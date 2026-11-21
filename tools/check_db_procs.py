#!/usr/bin/env python3
"""Check that every stored procedure the servers call exists in db/.

Scans the source files the Agent, Distribute and Map servers compile (from
their CMakeLists.txt, plus the headers beside them) for procedure names in
string literals, either "dbo.NAME" or "EXEC NAME". Comments, `#if 0` blocks and
`#ifdef` blocks for macros the build never defines (UNDEFINED_MACROS) are
skipped. Compares the names with the procedures the scripts in db/ create (the
three schema scripts and db/procs/). SQL Server matches names case-insensitively under the databases'
collation, so this does too.

Exits 1 and lists the missing procedures if any are missing.

    python3 tools/check_db_procs.py           # report missing procedures
    python3 tools/check_db_procs.py --list    # list every called procedure and its call sites
"""

import argparse
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
SERVERS = ["[Server]Agent", "[Server]Distribute", "[Server]Map"]
# Feature macros no source file or CMakeLists.txt defines: _TEST_DB_ picks the
# MP_TEST_* siege procedures, _NPROTECT_ guards the nProtect GameGuard code (#5).
UNDEFINED_MACROS = {"_TEST_DB_", "_NPROTECT_"}
SQL_FILES = sorted((ROOT / "db").glob("LUNA_*.sql")) + sorted((ROOT / "db" / "procs").glob("*.sql"))

CREATE_RE = re.compile(r"\bcreate\s+(?:or\s+alter\s+)?proc(?:edure)?\s+(?:\[?dbo\]?\.)?\[?(\w+)\]?", re.I)
DBO_RE = re.compile(r"\bdbo\.(\w+)", re.I)
EXEC_RE = re.compile(r"\bexec(?:ute)?\s+(?!dbo\.)([A-Za-z_]\w*)", re.I)
TOKEN_RE = re.compile(r'//[^\n]*|/\*.*?\*/|"(?:\\.|[^"\\\n])*"|\'(?:\\.|[^\'\\\n])*\'', re.S)


def strip_dead_blocks(text):
    """Blank out `#if 0` and `#ifdef <undefined macro>` blocks up to their
    `#else`/`#endif`, keeping line numbers."""
    out, depth, skipping = [], 0, False
    for line in text.split("\n"):
        directive = line.strip()
        if skipping:
            if re.match(r"#\s*if", directive):
                depth += 1
            elif re.match(r"#\s*endif", directive):
                if depth == 0:
                    skipping = False
                else:
                    depth -= 1
            elif re.match(r"#\s*el", directive) and depth == 0:
                skipping = False
            out.append("")
        elif re.match(r"#\s*if\s+0\b", directive) or (
            (m := re.match(r"#\s*ifdef\s+(\w+)", directive)) and m.group(1) in UNDEFINED_MACROS
        ):
            skipping, depth = True, 0
            out.append("")
        else:
            out.append(line)
    return "\n".join(out)


def string_literals(text):
    """Yield (line number, contents) of each string literal outside comments."""
    for m in TOKEN_RE.finditer(text):
        token = m.group(0)
        if token.startswith('"'):
            yield text.count("\n", 0, m.start()) + 1, token[1:-1]


def server_sources():
    """The .cpp files the servers' CMakeLists.txt compile, plus the headers beside them."""
    cpps = set()
    for server in SERVERS:
        cmake = (ROOT / server / "CMakeLists.txt").read_text(encoding="utf-8")
        for name in re.findall(r'"([^"]+\.cpp)"', cmake, re.I):
            path = (ROOT / server / name).resolve()
            if path.is_file():
                cpps.add(path)
    headers = {h for d in {p.parent for p in cpps} for h in d.glob("*.h")}
    return sorted(cpps | headers)


def called_procs():
    calls = {}
    for path in server_sources():
        text = strip_dead_blocks(path.read_bytes().decode("cp949", errors="replace"))
        for line, s in string_literals(text):
            for name in DBO_RE.findall(s) + EXEC_RE.findall(s):
                site = f"{path.relative_to(ROOT)}:{line}"
                calls.setdefault(name.upper(), (name, []))[1].append(site)
    return calls


def defined_procs():
    names = set()
    for path in SQL_FILES:
        names.update(n.upper() for n in CREATE_RE.findall(path.read_text(encoding="utf-8")))
    return names


def main():
    parser = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    parser.add_argument("--list", action="store_true", help="list every called procedure")
    args = parser.parse_args()

    calls, defined = called_procs(), defined_procs()
    missing = sorted(k for k in calls if k not in defined)

    if args.list:
        for key in sorted(calls):
            name, sites = calls[key]
            flag = "MISSING " if key in missing else ""
            print(f"{flag}{name}: {', '.join(sites)}")
        print()

    print(f"{len(calls)} procedures called, {len(calls) - len(missing)} defined in db/, {len(missing)} missing")
    for key in missing:
        name, sites = calls[key]
        print(f"  {name}: {', '.join(sites)}")
    return 1 if missing else 0


if __name__ == "__main__":
    sys.exit(main())
