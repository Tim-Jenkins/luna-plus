#!/usr/bin/env python3
"""Build the minimal game data set from its text sources.

Sources live under data/minimal/. A file named "<name>.bin.txt" is encoded into "<name>.bin"
with the legacy (non-AES) format the game's CMHFile reader accepts (see tools/mhbin.py).
Every other file (README.md excepted) is copied unchanged, because some loaders read plain
text, e.g. System/Resource/droprate.txt.

Usage:
    build_minimal_data.py [--out build/data]

The output folder mirrors a server's working directory: copy its contents into the folder
the servers run from (alongside serverset/), or the client's install folder.
"""
import argparse
import shutil
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import mhbin  # noqa: E402

ROOT = Path(__file__).resolve().parent.parent
SRC = ROOT / "data" / "minimal"


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--out", default=str(ROOT / "build" / "data"))
    args = parser.parse_args()
    out = Path(args.out)

    count = 0
    for src in sorted(SRC.rglob("*")):
        if not src.is_file() or src.name == "README.md" or src.name.startswith("."):
            continue
        rel = src.relative_to(SRC)
        if src.name.endswith(".bin.txt"):
            dst = out / rel.parent / src.name[: -len(".txt")]
            dst.parent.mkdir(parents=True, exist_ok=True)
            # CMHFile::IsEOF is only true once the read position reaches the last byte, and
            # GetString stops in front of a line break. A trailing newline would make every
            # record loop read one extra, all-zero record, so strip it.
            dst.write_bytes(mhbin.encode(src.read_bytes().rstrip()))
        else:
            dst = out / rel
            dst.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(src, dst)
        count += 1
    print(f"{count} files -> {out}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
