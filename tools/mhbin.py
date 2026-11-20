#!/usr/bin/env python3
"""Encode or decode LUNA ".bin" text files in the legacy (non-AES) format.

The game opens these files with CMHFile::Init(name, "rb") ([CC]ServerModule/MHFile.cpp,
[Client]LUNA/MHFile.cpp). A file whose header version is 20040308 has an empty AES key
in [CC]Header/AESFile.h, so the reader falls back to the old encoding, which this tool
writes. decode also reads files encrypted with the newer key (version 20090506), such as
the client's Data/Script/Direct/List_*.befl and Data/Interface/Windows/SystemMsg.bin.

Layout:
    DWORD version  = 20040308 + type + size   (little-endian)
    DWORD type     (any non-zero value)
    DWORD size     (number of data bytes)
    BYTE  crc1
    BYTE  data[size]
    BYTE  crc2     (same as crc1)

AES layout (version 20090506):
    DWORD version  = 20090506 + type + size
    DWORD type, DWORD size
    BYTE  crc1
    BYTE  data[size rounded up to 16]   AES-256-ECB; the key is the hex string in
                                        AESFile.h, as bytes, zero-padded to 32
    BYTE  crc2
crc = (type + sum(decrypted padded data)) modulo 256

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
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import aes  # noqa: E402

LEGACY_VERSION = 20040308
AES_VERSION = 20090506
AES_KEY = bytes.fromhex("E76B2413958B00E193A1").ljust(32, b"\0")  # [CC]Header/AESFile.h
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
    if (version - (file_type + size)) & 0xFFFFFFFF == AES_VERSION:
        return decode_aes(blob, file_type, size)
    if version - (file_type + size) != LEGACY_VERSION:
        raise ValueError("unknown header version (corrupt file?)")
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


def decode_aes(blob: bytes, file_type: int, size: int) -> bytes:
    padded = (size + 15) // 16 * 16
    start = HEADER.size + 1
    data = blob[start:start + padded]
    if len(data) != padded or len(blob) < start + padded + 1:
        raise ValueError("file too short")
    crc1, crc2 = blob[HEADER.size], blob[start + padded]
    keys = aes.expand_key(AES_KEY)
    out = b"".join(aes.decrypt_block(keys, data[i:i + 16]) for i in range(0, padded, 16))
    if crc1 != crc2 or (file_type + sum(out)) & 0xFF != crc1:
        raise ValueError("CRC check failed")
    return out[:size]


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
