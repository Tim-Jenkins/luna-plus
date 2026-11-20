"""Minimal pure-Python AES block decryption (FIPS-197), enough to read LUNA's AES .bin files.

Only decryption of single 16-byte blocks is implemented, for any of the three key sizes.
It is slow (a few hundred KB/s) but has no dependencies.
"""

_SBOX = bytearray(256)
_INV_SBOX = bytearray(256)


def _init_sbox() -> None:
    # Build the S-box from the multiplicative inverse in GF(2^8) and the affine transform.
    p = q = 1
    while True:
        p = p ^ ((p << 1) & 0xFF) ^ (0x1B if p & 0x80 else 0)  # p *= 3
        q ^= q << 1
        q ^= q << 2
        q ^= q << 4
        q &= 0xFF
        if q & 0x80:
            q ^= 0x09  # q /= 3
        x = q ^ _rotl8(q, 1) ^ _rotl8(q, 2) ^ _rotl8(q, 3) ^ _rotl8(q, 4) ^ 0x63
        _SBOX[p] = x
        if p == 1:
            break
    _SBOX[0] = 0x63
    for i, v in enumerate(_SBOX):
        _INV_SBOX[v] = i


def _rotl8(x: int, n: int) -> int:
    return ((x << n) | (x >> (8 - n))) & 0xFF


def _xtime(a: int) -> int:
    a <<= 1
    return (a ^ 0x1B) & 0xFF if a & 0x100 else a


def _mul(a: int, b: int) -> int:
    r = 0
    while b:
        if b & 1:
            r ^= a
        a = _xtime(a)
        b >>= 1
    return r


_init_sbox()
_MUL9 = bytes(_mul(i, 9) for i in range(256))
_MUL11 = bytes(_mul(i, 11) for i in range(256))
_MUL13 = bytes(_mul(i, 13) for i in range(256))
_MUL14 = bytes(_mul(i, 14) for i in range(256))


def expand_key(key: bytes) -> list:
    """Return the round keys (a list of 16-byte bytearrays) for a 16, 24 or 32 byte key."""
    nk = len(key) // 4
    if len(key) not in (16, 24, 32):
        raise ValueError("AES key must be 16, 24 or 32 bytes")
    rounds = nk + 6
    words = [list(key[4 * i:4 * i + 4]) for i in range(nk)]
    rcon = 1
    for i in range(nk, 4 * (rounds + 1)):
        t = list(words[i - 1])
        if i % nk == 0:
            t = t[1:] + t[:1]
            t = [_SBOX[b] for b in t]
            t[0] ^= rcon
            rcon = _xtime(rcon)
        elif nk > 6 and i % nk == 4:
            t = [_SBOX[b] for b in t]
        words.append([a ^ b for a, b in zip(words[i - nk], t)])
    return [bytearray(sum(words[4 * r:4 * r + 4], [])) for r in range(rounds + 1)]


def decrypt_block(round_keys: list, block: bytes) -> bytes:
    s = bytearray(a ^ b for a, b in zip(block, round_keys[-1]))
    for r in range(len(round_keys) - 2, -1, -1):
        s = _inv_shift_sub(s)
        k = round_keys[r]
        for i in range(16):
            s[i] ^= k[i]
        if r:
            for c in range(0, 16, 4):
                a0, a1, a2, a3 = s[c:c + 4]
                s[c] = _MUL14[a0] ^ _MUL11[a1] ^ _MUL13[a2] ^ _MUL9[a3]
                s[c + 1] = _MUL9[a0] ^ _MUL14[a1] ^ _MUL11[a2] ^ _MUL13[a3]
                s[c + 2] = _MUL13[a0] ^ _MUL9[a1] ^ _MUL14[a2] ^ _MUL11[a3]
                s[c + 3] = _MUL11[a0] ^ _MUL13[a1] ^ _MUL9[a2] ^ _MUL14[a3]
    return bytes(s)


def _inv_shift_sub(s: bytearray) -> bytearray:
    out = bytearray(16)
    for col in range(4):
        for row in range(4):
            # InvShiftRows moves row `row` right by `row` columns.
            out[row + 4 * ((col + row) % 4)] = _INV_SBOX[s[row + 4 * col]]
    return out
