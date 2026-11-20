#!/usr/bin/env python3
"""Find and replace the Chinese and Korean text in LUNA data files with English.

The original server data (data/original/, not in git) is Big5 Chinese with some leftover Korean
(CP949) from the Korean source. This tool finds every piece of non-ASCII text in it and replaces
it with English from data/translations/en/<File>.tsv. import_original_data.py does that for you.

A text unit is the part of a tab-separated field from its first to its last double-byte
character (so "LUNA女神" -> "LUNA" + unit, "等級31" -> unit + "31"). Comments (from "//" or a
field that starts with "@") are left alone; nothing reads them. Each unit is keyed by the first
12 hex digits of the SHA-1 of its original bytes, so the translation files hold no original text
and the same string in two places shares one entry.

Translation files are tab-separated, one unit per line:

    <hash>  <where: first field of the record and column, or line number>  <English>

Spaces: CMHFile::GetString reads one whitespace-separated token and the client turns "^s" back
into a space ([Client]LUNA/MHFile.cpp, _parsingKeywordString). A unit whose original used "^s"
or had no spaces at all, in a file read token by token, gets "^s" for its spaces; a unit that
already had plain spaces (quest text, monster speech, multi-line tooltips) keeps them.

Commands:
    translate_data.py pending --from build/data-orig [--file ItemList.bin]  # units still needing English
    translate_data.py add <batch.tsv> --from build/data-orig                # merge "<hash> <English>" lines
    translate_data.py check                                                 # lint the translation files

--from is a converted (but untranslated) data folder: import_original_data.py --no-translate.
"""
import argparse
import hashlib
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import mhbin  # noqa: E402

ROOT = Path(__file__).resolve().parent.parent
TRANSLATIONS = ROOT / "data" / "translations" / "en"

# Fixed-size name buffers the text is copied into ([CC]Header/CommonGameDefine.h). Longer names
# are cut off by SafeStrCpy, so `check` and `add` reject them. (file, column) -> max bytes.
LIMITS = {
    ("itemlist.bin", 1): 32,  # MAX_ITEMNAME_LENGTH
    ("skilllist.bin", 1): 32,  # MAX_SKILL_NAME_LENGTH
    ("skill_buff_list.bin", 1): 32,
    ("staticnpc.bin", 2): 32,  # MAX_NPC_NAME_LENGTH
    ("npclist.bin", 1): 32,
    ("monsterlist.bin", 1): 60,  # MAX_MONSTER_NAME_LENGTH
    ("monsterlist.bin", 2): 60,
    ("monsterlist.bin", 3): 60,
    ("questitemlist.bin", 1): 32,
    ("mapmovelist.bin", 1): 32,
    ("mapmovelist.bin", 2): 32,
}


# Files whose text the game never shows, left as they are.
SKIP = {
    "tooltipmsg.bin",  # the client reads Data/Interface/Windows/ToolTipMsg.bin instead
    "tootipmsg.bin",
    "tooltipinfo.bin",
    "trade.bin",  # stale copies of Data/Interface/Windows dialogs
    "quest.bin",
    "dealitem.bin",  # CDealDialog::LoadDealerItem skips the map, NPC and item names
    "filterword.bin",  # banned words for names and chat; English versions would block real names
}


def _is_lead(b: int) -> bool:
    return b >= 0x81 and b != 0xFF


def _chars(field: bytes):
    """Yield (start, end) of each character, treating a lead byte and its trail byte as one."""
    i = 0
    while i < len(field):
        if _is_lead(field[i]) and i + 1 < len(field):
            yield i, i + 2
            i += 2
        else:
            yield i, i + 1
            i += 1


def unit_span(field: bytes):
    """(start, end) of the text unit in a field, or None if it is all ASCII."""
    wide = [(s, e) for s, e in _chars(field) if e - s == 2]
    if not wide:
        return None
    return wide[0][0], wide[-1][1]


def key(raw: bytes) -> str:
    return hashlib.sha1(raw).hexdigest()[:12]


def is_korean(raw: bytes) -> bool:
    """Korean text uses KS X 1001 Hangul (lead 0xB0-0xC8, trail 0xA1-0xFE); Big5 Chinese mostly
    has trail bytes below 0xA1 somewhere. CP949's extended Hangul would also decode Big5, so it
    doesn't count."""
    pairs = [raw[s:e] for s, e in _chars(raw) if e - s == 2]
    if not pairs or any(p[1] < 0xA1 for p in pairs):
        return False
    hangul = sum(1 for p in pairs if 0xB0 <= p[0] <= 0xC8)
    return hangul * 2 > len(pairs)


def decode_unit(raw: bytes) -> str:
    """The unit as text: Korean (CP949) or Chinese (Big5). Both bytes of every character in
    0xA1-0xFE is valid in either, so such units show both readings: "<Big5> || <CP949>"."""
    if is_korean(raw):
        try:
            kor = raw.decode("cp949")
        except UnicodeDecodeError:
            return raw.decode("big5", errors="replace")
        try:
            return f"{raw.decode('big5')} || {kor}"
        except UnicodeDecodeError:
            return kor
    return raw.decode("big5", errors="replace")


def _comment_cut(line: bytes) -> int:
    """Index where a comment starts in a line (len(line) if none)."""
    cut = len(line)
    m = re.search(rb"(^|[\t ])//", line)
    if m:
        cut = m.start() if m.group(1) == b"" else m.start() + 1
    # A field that starts with "@" is a note in the interface-style files.
    pos = 0
    for field in line[:cut].split(b"\t"):
        if field.lstrip(b" ").startswith(b"@"):
            return min(cut, pos)
        pos += len(field) + 1
    return cut


def units(text: bytes):
    """Yield (line_no, column, start, end) for every text unit, offsets into that line."""
    for n, line in enumerate(text.split(b"\r\n")):
        if not any(b >= 0x80 for b in line):
            continue
        cut = _comment_cut(line)
        pos = 0
        for col, field in enumerate(line.split(b"\t")):
            if pos >= cut:
                break
            field = field[: cut - pos]
            span = unit_span(field)
            if span:
                yield n, col, pos + span[0], pos + span[1]
            pos += len(field) + 1


def where(line: bytes, n: int, col: int) -> str:
    first = line.split(b"\t", 1)[0].strip()
    if re.fullmatch(rb"-?\d+", first) and col > 0:
        return f"{first.decode()}:{col}"
    return f"L{n + 1}"


def _token_based(text: bytes) -> bool:
    """Record files are read token by token; free text has plain spaces around wide text."""
    lines = text.split(b"\r\n")
    found = list(units(text))
    spaced = sum(1 for n, c, s, e in found if b" " in lines[n][s:e])
    return spaced / (len(found) or 1) < 0.2


def spaces_for(raw: bytes, token_based: bool) -> str:
    if b"^s" in raw:
        return "^s"
    if b" " in raw:
        return " "
    return "^s" if token_based else " "


def read_table(name: str) -> dict:
    path = TRANSLATIONS / (Path(name).stem + ".tsv")
    table = {}
    if path.exists():
        for line in path.read_text(encoding="utf-8").splitlines():
            if not line.strip() or line.startswith("#"):
                continue
            h, _where, english = line.split("\t", 2)
            table[h] = english
    return table


def apply(name: str, text: bytes, table: dict):
    """Replace every unit that has a translation. Returns (text, translated, missing)."""
    token_based = _token_based(text)
    lines = text.split(b"\r\n")
    done = missing = 0
    for n in sorted({u[0] for u in units(text)}):
        line = lines[n]
        out, last = [], 0
        for _n, _col, s, e in units(line):
            raw = line[s:e]
            english = table.get(key(raw))
            if english is None:
                missing += 1
                continue
            sp = spaces_for(raw, token_based)
            english = english.replace("^", "").replace("\t", " ")
            # "LUNA女神" -> "LUNA Goddess", "等級31" -> "Level 31".
            if s > 0 and chr(line[s - 1]).isalnum() and english[:1].isalnum():
                english = " " + english
            if e < len(line) and chr(line[e]).isalnum() and english[-1:].isalnum():
                english += " "
            if sp == "^s":
                english = english.replace(" ", "^s")
            out += [line[last:s], english.encode("ascii", errors="replace")]
            last = e
            done += 1
        out.append(line[last:])
        lines[n] = b"".join(out)
    return b"\r\n".join(lines), done, missing


def load(path: Path) -> bytes:
    blob = path.read_bytes()
    return mhbin.decode(blob) if path.suffix.lower() == ".bin" else blob


def data_files(src: Path):
    res = src / "System" / "Resource"
    for p in sorted(res.iterdir()):
        if p.suffix.lower() in (".bin", ".txt") and p.is_file() and p.name.lower() not in SKIP:
            yield p


def collect(src: Path, only=None):
    """{hash: (file name, where, column, source text)} over a data folder, first occurrence wins."""
    found = {}
    for p in data_files(src):
        if only and p.name.lower() != only.lower():
            continue
        text = load(p)
        lines = text.split(b"\r\n")
        for n, col, s, e in units(text):
            raw = lines[n][s:e]
            h = key(raw)
            if (p.name, h) not in found:
                found[(p.name, h)] = (where(lines[n], n, col), col, decode_unit(raw))
    return found


def cmd_pending(args):
    found = collect(Path(args.src), args.file)
    tables = {}
    count = 0
    for (name, h), (w, col, src) in found.items():
        table = tables.setdefault(name, read_table(name))
        if h in table:
            continue
        count += 1
        if args.limit and count > args.limit:
            continue
        print(f"{h}\t{name}\t{w}\t{src.replace(chr(9), ' ')}")
    print(f"# {count} pending", file=sys.stderr)


def cmd_add(args):
    found = collect(Path(args.src))
    by_hash = {}
    for (name, h), v in found.items():
        by_hash.setdefault(h, []).append((name, v))
    new = {}
    bad = 0
    for line in Path(args.batch).read_text(encoding="utf-8").splitlines():
        if not line.strip() or line.startswith("#"):
            continue
        h, english = line.split("\t")[0], line.split("\t")[-1].strip()
        if h not in by_hash:
            print(f"unknown hash {h}", file=sys.stderr)
            bad += 1
            continue
        if not english.isascii():
            print(f"{h}: not ASCII: {english}", file=sys.stderr)
            bad += 1
            continue
        for name, (w, col, _src) in by_hash[h]:
            limit = LIMITS.get((name.lower(), col))
            if limit and len(english.encode()) > limit:
                print(f"{h} {name} {w}: {len(english)} > {limit} bytes: {english}", file=sys.stderr)
                bad += 1
                continue
            new.setdefault(name, {})[h] = (w, english)
    for name, rows in new.items():
        path = TRANSLATIONS / (Path(name).stem + ".tsv")
        path.parent.mkdir(parents=True, exist_ok=True)
        existing = {}
        if path.exists():
            for line in path.read_text(encoding="utf-8").splitlines():
                if line.strip() and not line.startswith("#"):
                    h, w, e = line.split("\t", 2)
                    existing[h] = (w, e)
        existing.update(rows)
        order = [h for (n, h) in found if n == name and h in existing]
        order += [h for h in existing if h not in set(order)]
        path.write_text("".join(f"{h}\t{existing[h][0]}\t{existing[h][1]}\n" for h in order), encoding="utf-8")
        print(f"{path.relative_to(ROOT)}: {len(rows)} added or updated, {len(existing)} total")
    return 1 if bad else 0


def _read_glossary(paths):
    glossary = {}
    for path in paths:
        for line in Path(path).read_text(encoding="utf-8").splitlines():
            if line.strip() and not line.startswith("#"):
                zh, en = line.split("\t")[:2]
                glossary[zh.strip()] = en.strip()
    return glossary


def compose(text: str, glossary: dict, missing: set):
    """English for a name built from glossary pieces, or None (the unknown pieces go in missing).

    Besides whole names, it knows the shapes most item names take: "<affix>的<name>" (the 25
    enchant affixes), "<name> - 7天" (rental time), "<tag>]<name>" (costume sets, events)."""
    text = text.strip()
    if text in glossary:
        return glossary[text]
    if text.replace(" ", "") in glossary:
        return glossary[text.replace(" ", "")]
    rules = [
        (r"(.+?)\s*-\s*(\d+)\s*[天日]", lambda m: f"{{}} ({m.group(2)}d)"),
        (r"(.+?)\s*-\s*(\d+)\s*小時", lambda m: f"{{}} ({m.group(2)}h)"),
        (r"(.+?)\s*-\s*活動用", lambda m: "{} (Event)"),
        (r"(.+?)\s*-\s*永久", lambda m: "{} (Permanent)"),
        (r"(.+?)\s*\[\s*等級\s*(\d+)\s*\]", lambda m: f"{{}} [Lv{m.group(2)}]"),
        (r"(.+?)\s*(\d+)\s*(?:等級|級)", lambda m: f"{{}} Lv{m.group(2)}"),
        (r"(.+?)\s+等級", lambda m: "{} Lv"),
        (r"(.+?)\s*\(\s*(\d+)\s*[天日]", lambda m: f"{{}} ({m.group(2)}d"),
    ]
    for pattern, fmt in rules:
        m = re.fullmatch(pattern, text)
        if m:
            base = compose(m.group(1), glossary, missing)
            return fmt(m).format(base) if base else None
    m = re.fullmatch(r"([^:]+?)\s*:\s*(.+)", text)
    if m:
        head, rest = compose(m.group(1), glossary, missing), compose(m.group(2), glossary, missing)
        return f"{head}: {rest}" if head and rest else None
    m = re.fullmatch(r"([^\]]+)\](.+)", text)
    if m:
        tag, rest = compose(m.group(1), glossary, missing), compose(m.group(2), glossary, missing)
        return f"{tag}] {rest}" if tag and rest else None
    m = re.fullmatch(r"(.+?)的(.+)", text)
    if m and m.group(1) in glossary and glossary.get("affix:" + m.group(1)):
        rest = compose(m.group(2), glossary, missing)
        return f"{glossary[m.group(1)]} {rest}" if rest else None
    # "suffix:<Chinese> <English>" entries: "<name>碎片" -> "<name> Fragment", longest first.
    suffixes = glossary.get("\0suffixes")
    if suffixes is None:
        suffixes = sorted((k[7:] for k in glossary if k.startswith("suffix:")), key=len, reverse=True)
        glossary["\0suffixes"] = suffixes
    for suffix in suffixes:
        if text.endswith(suffix) and len(text) > len(suffix):
            head = compose(text[: -len(suffix)], glossary, missing)
            return f"{head} {glossary['suffix:' + suffix]}" if head else None
    missing.add(text)
    return None


def cmd_compose(args):
    """Write a batch for every pending unit of --file that the glossary can build."""
    glossary = _read_glossary(args.glossary)
    found = collect(Path(args.src), args.file)
    table = read_table(args.file)
    missing, out, long = set(), [], []
    for (name, h), (w, col, src) in found.items():
        if h in table and not args.redo:
            continue
        text = src.split(" || ")[0].replace("^s", " ")
        english = compose(text, glossary, missing)
        if english is None:
            continue
        limit = LIMITS.get((name.lower(), col))
        if limit and len(english.encode()) > limit:
            long.append(f"{text}\t{english}")
            continue
        out.append(f"{h}\t{english}")
    Path(args.out).write_text("\n".join(out) + "\n", encoding="utf-8")
    if args.missing:
        Path(args.missing).write_text("\n".join(sorted(missing)) + "\n", encoding="utf-8")
    if args.long:
        Path(args.long).write_text("\n".join(long) + "\n", encoding="utf-8")
    print(f"{len(out)} composed, {len(missing)} missing pieces, {len(long)} too long", file=sys.stderr)


def cmd_check(args):
    bad = 0
    for path in sorted(TRANSLATIONS.glob("*.tsv")):
        seen = set()
        for i, line in enumerate(path.read_text(encoding="utf-8").splitlines(), 1):
            parts = line.split("\t")
            if len(parts) != 3 or not re.fullmatch(r"[0-9a-f]{12}", parts[0]):
                print(f"{path.name}:{i}: expected <hash> <where> <English>")
                bad += 1
                continue
            if parts[0] in seen:
                print(f"{path.name}:{i}: duplicate {parts[0]}")
                bad += 1
            seen.add(parts[0])
            if not parts[2].isascii() or "^" in parts[2] or not parts[2].strip():
                print(f"{path.name}:{i}: English must be non-empty ASCII without ^")
                bad += 1
    print("ok" if not bad else f"{bad} problems")
    return 1 if bad else 0


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = parser.add_subparsers(dest="cmd", required=True)
    p = sub.add_parser("pending")
    p.add_argument("--from", dest="src", required=True)
    p.add_argument("--file")
    p.add_argument("--limit", type=int, default=0)
    p = sub.add_parser("add")
    p.add_argument("batch")
    p.add_argument("--from", dest="src", required=True)
    sub.add_parser("check")
    p = sub.add_parser("compose")
    p.add_argument("--from", dest="src", required=True)
    p.add_argument("--file", required=True)
    p.add_argument("--glossary", nargs="+", required=True, help="<Chinese> <English> TSVs; 'affix:<Chinese> 1' marks an enchant affix")
    p.add_argument("--out", required=True)
    p.add_argument("--missing")
    p.add_argument("--long")
    p.add_argument("--redo", action="store_true", help="also rebuild units that already have English")
    args = parser.parse_args()
    return {"pending": cmd_pending, "add": cmd_add, "check": cmd_check, "compose": cmd_compose}[args.cmd](args) or 0


if __name__ == "__main__":
    sys.exit(main())
