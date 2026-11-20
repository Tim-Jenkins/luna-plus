#!/usr/bin/env python3
"""Build the game data set from an original LUNA server's data, converted to this source's formats.

The original data isn't in this repo (it isn't ours to redistribute). Copy a server's `system/`
folder somewhere local, for example data/original/<name>/system (git ignores data/original/),
and run:

    import_original_data.py --from data/original/tw-2008 [--out build/data]

The known source is the Taiwanese LUNA Online server data from late 2008 (Big5 text). This
source is from 2010, and a few tables gained columns in between; CONVERTERS below rewrites
those. Every other file is copied byte for byte. Files the original data lacks but this source
reads (the Devil race lists, skillScript.bin) are taken from data/minimal.

The output folder mirrors a server's working directory, like build_minimal_data.py: copy its
contents into the servers' working folder and the client's install folder. Both copies must be
identical, because Distribute checksums about 50 of the files at login.
"""
import argparse
import shutil
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import mhbin  # noqa: E402
import translate_data  # noqa: E402

ROOT = Path(__file__).resolve().parent.parent
MINIMAL = ROOT / "data" / "minimal"

# Hand-written files the original data replaces under another name (its motionList.bin points to
# default.bin instead).
NOT_FROM_MINIMAL = {"resource/monstermotion.bin"}

# Object kinds that use the boss target window (eObjectKind_BossMonster, _FieldBossMonster).
BOSS_OBJECT_KINDS = {b"33", b"35"}


def _fields(line: bytes, sep: bytes):
    return line.split(sep)


def skill_list(fields):
    """56 -> 54 fields: the two always-zero columns between area size and unit kind are gone."""
    if len(fields) != 56:
        return None
    return fields[:27] + fields[29:]


def skill_buff_list(fields):
    """33 -> 34 fields: one more column before the mana cost (all zero in the original data)."""
    if len(fields) != 33:
        return None
    return fields[:28] + [b"0"] + fields[28:]


def monster_list(fields):
    """124 -> 125 fields: dwMonsterTargetType follows the object kind. Also shows the English name.

    1 selects the normal target window, 2 the boss one. With 0 the client crashes when the
    monster is clicked (cMonsterTargetDlg::SetTargetNameInfo).
    """
    if len(fields) != 124:
        return None
    target = b"2" if fields[8] in BOSS_OBJECT_KINDS else b"1"
    # The displayed name (field 2) is Big5 Chinese, which the English client can't show; field
    # 3 is the English name, with ^s for spaces like every name in the data.
    fields = fields[:1] + [fields[2]] + fields[2:]
    return fields[:9] + [target] + fields[9:]


def item_list(fields):
    """60 -> 65 fields: point type, two point values, item type and item type detail."""
    if len(fields) != 60:
        return None
    return fields + [b"0"] * 5


def static_npc(fields):
    """7 -> 8 fields: a notice dialog id, 0 for none."""
    if len(fields) != 7:
        return None
    return fields + [b"0"]


def conduct_list(fields):
    """7 -> 8 fields: bInvalidOnVehicle (vehicles came later). The reader is token-based, so a
    missing field shifts every following record; the client then crashes in
    cConductManager::RegistConduct on a tab that doesn't exist."""
    if len(fields) != 7:
        return None
    return fields + [b"0"]


# Lower-case file name -> (field separator, converter). A converter gets a record's fields and
# returns the new fields, or None if the record doesn't have the expected shape.
CONVERTERS = {
    "skilllist.bin": (b"\t", skill_list),
    "skill_buff_list.bin": (b"\t", skill_buff_list),
    "monsterlist.bin": (b"\t", monster_list),
    "itemlist.bin": (b"\t", item_list),
    "staticnpc.bin": (b"\t", static_npc),
    "conductlist.bin": (b"\t", conduct_list),
}


def convert(name: str, blob: bytes, report: list) -> bytes:
    sep, func = CONVERTERS[name.lower()]
    text = mhbin.decode(blob)
    out, changed, skipped = [], 0, 0
    for line in text.split(b"\r\n"):
        if not line.strip():
            out.append(line)
            continue
        new = func(_fields(line, sep))
        if new is None:
            skipped += 1
            out.append(line)
        else:
            changed += 1
            out.append(sep.join(new))
    report.append(f"{name}: converted {changed} records" + (f", left {skipped} unexpected ones unchanged" if skipped else ""))
    return mhbin.encode(b"\r\n".join(out).rstrip())


def translate(out_system: Path, report: list) -> None:
    """Replace the Chinese and Korean text with English from data/translations/en/."""
    total = missing = 0
    for path in translate_data.data_files(out_system.parent):
        table = translate_data.read_table(path.name)
        if not table:
            continue
        text, done, left = translate_data.apply(path.name, translate_data.load(path), table)
        if done:
            path.write_bytes(mhbin.encode(text) if path.suffix.lower() == ".bin" else text)
        total += done
        missing += left
    report.append(f"translated {total} text units to English" + (f", {missing} still untranslated" if missing else ""))


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--from", dest="src", required=True, help="folder that contains the original system/ folder")
    parser.add_argument("--out", default=str(ROOT / "build" / "data"))
    parser.add_argument("--no-translate", action="store_true", help="keep the original Chinese and Korean text")
    args = parser.parse_args()

    src_system = Path(args.src) / "system"
    if not (src_system / "Resource").is_dir():
        print(f"{src_system}/Resource not found", file=sys.stderr)
        return 1
    out_system = Path(args.out) / "System"

    report, copied, have = [], 0, set()
    for src in sorted(src_system.rglob("*")):
        if not src.is_file() or src.name.startswith("."):
            continue
        rel = src.relative_to(src_system)
        dst = out_system / rel
        dst.parent.mkdir(parents=True, exist_ok=True)
        have.add(str(rel).lower())
        if rel.parent.name.lower() == "resource" and src.name.lower() in CONVERTERS:
            dst.write_bytes(convert(src.name, src.read_bytes(), report))
        else:
            shutil.copyfile(src, dst)
            copied += 1

    # Fill in what the original data doesn't have from the hand-written set. Windows file names
    # are case-insensitive, so compare them that way.
    added = []
    for src in sorted((MINIMAL / "System").rglob("*")):
        if not src.is_file() or src.name == "README.md" or src.name.startswith("."):
            continue
        rel = src.relative_to(MINIMAL / "System")
        name = src.name[: -len(".txt")] if src.name.endswith(".bin.txt") else src.name
        rel = rel.parent / name
        if str(rel).lower() in have or str(rel).lower() in NOT_FROM_MINIMAL:
            continue
        dst = out_system / rel
        dst.parent.mkdir(parents=True, exist_ok=True)
        if src.name.endswith(".bin.txt"):
            dst.write_bytes(mhbin.encode(src.read_bytes().rstrip()))
        else:
            shutil.copyfile(src, dst)
        added.append(str(rel))

    if not args.no_translate:
        translate(out_system, report)

    for line in report:
        print(line)
    print(f"copied {copied} files unchanged")
    print(f"added {len(added)} files from data/minimal: {', '.join(added)}")
    print(f"-> {out_system}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
