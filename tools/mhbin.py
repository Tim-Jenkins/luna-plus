#!/usr/bin/env python3
"""Encode or decode LUNA ".bin" text files in the legacy (non-AES) format.

The game opens these files with CMHFile::Init(name, "rb") ([CC]ServerModule/MHFile.cpp,
[Client]LUNA/MHFile.cpp). A file whose header version is 20040308 has an empty AES key
in [CC]Header/AESFile.h, so the reader falls back to the old encoding, which this tool
writes. Files encrypted with the newer AES key (version 20090506) are not supported.

Layout:
    DWORD version  = 20040308 + type + size   (little-endian)
    DWORD type     (any non-zero value)
    DWORD size     (number of data bytes)
    BYTE  crc1
    BYTE  data[size]
    BYTE  crc2     (same as crc1)

Encoding of plain byte p at offset i:
    e = p + i (+ type when i % type == 0), all modulo 256
crc = (type + sum(e)) modulo 256

The packed reader splits lines on CR LF only, so encode converts line endings to CR LF.
Text is handled as raw bytes, so CP949 content passes through unchanged.

Usage:
    mhbin.py encode input.txt output.bin [--type N]
    mhbin.py decode input.bin output.txt
"""
import argparse
import struct
import sys

LEGACY_VERSION = 20040308
HEADER = struct.Struct("<III")


def encode(plain: bytes, file_type: int = 1) -> bytes:
    if file_type <= 0:
        raise ValueError("type must be non-zero")
    plain = plain.replace(b"\r\n", b"\n").replace(b"\n", b"\r\n")
    data = bytearray(len(plain))
    for i, p in enumerate(plain):
        e = p + i
        if i % file_type == 0:
            e += file_type
        data[i] = e & 0xFF
    crc = (file_type + sum(data)) & 0xFF
    size = len(data)
    header = HEADER.pack((LEGACY_VERSION + file_type + size) & 0xFFFFFFFF, file_type, size)
    return header + bytes([crc]) + bytes(data) + bytes([crc])


def decode(blob: bytes) -> bytes:
    if len(blob) < HEADER.size + 2:
        raise ValueError("file too short")
    version, file_type, size = HEADER.unpack_from(blob)
    if version - (file_type + size) != LEGACY_VERSION:
        raise ValueError("not a legacy-format .bin (AES-encrypted or corrupt)")
    if file_type == 0:
        raise ValueError("header type is 0")
    crc1 = blob[HEADER.size]
    data = blob[HEADER.size + 1:HEADER.size + 1 + size]
    crc2 = blob[HEADER.size + 1 + size]
    if len(data) != size or crc1 != crc2:
        raise ValueError("CRC bytes don't match")
    if (file_type + sum(data)) & 0xFF != crc1:
        raise ValueError("CRC check failed")
    out = bytearray(size)
    for i, e in enumerate(data):
        p = e - i
        if i % file_type == 0:
            p -= file_type
        out[i] = p & 0xFF
    return bytes(out)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = parser.add_subparsers(dest="cmd", required=True)
    enc = sub.add_parser("encode")
    enc.add_argument("input")
    enc.add_argument("output")
    enc.add_argument("--type", type=int, default=1)
    dec = sub.add_parser("decode")
    dec.add_argument("input")
    dec.add_argument("output")
    args = parser.parse_args()

    with open(args.input, "rb") as f:
        src = f.read()
    try:
        out = encode(src, args.type) if args.cmd == "encode" else decode(src)
    except ValueError as e:
        print(f"{args.input}: {e}", file=sys.stderr)
        return 1
    with open(args.output, "wb") as f:
        f.write(out)
    return 0


if __name__ == "__main__":
    sys.exit(main())
