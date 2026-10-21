#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
WsFrame 逻辑交叉验证
====================

测试对象：GlassView/GlassView/NotifyServer.swift 里的 `enum WsFrame`
（encode / decode 两个函数，逐行搬到 Python，算法结构保持一致）。

参照物：aptv-notify/notify_server.py 里的 ws_send / ws_recv ——
这套已经在你手机 + 车机上真跑通了（短信上车那次），可以当基准。

为什么要做这件事：帧编解码是最容易写错、而 CI 编译又查不出来的地方。
126 / 127 两个长度分支、mask 轮转、半包等下一批，任何一个错都会让页面
一直卡在"未连接"。所以这里把两边对着喂。

不测什么：不验证 Swift 语法。语法正确性由 CI 编译保证。
"""

import struct
import sys

PASS, FAIL = 0, 0
FAILURES = []


def check(name, got, want):
    global PASS, FAIL
    if got == want:
        PASS += 1
    else:
        FAIL += 1
        FAILURES.append(f"{name}\n    得到 {got!r}\n    期望 {want!r}")


# ── 参照实现：从 aptv-notify/notify_server.py 原样抄下来的一段 ──
# 那套已经在你手机 + 车机上真跑通了（短信上车那次），可当基准。
# 这里内联进来而不是 import，是为了让这个测试自包含、随便丢哪儿都能跑。

def ref_ws_send(w, payload, opcode=0x1):
    head = bytes([0x80 | opcode])
    n = len(payload)
    if n < 126:
        head += bytes([n])
    elif n < 65536:
        head += bytes([126]) + struct.pack(">H", n)
    else:
        head += bytes([127]) + struct.pack(">Q", n)
    w.write(head + payload)
    w.flush()


def ref_read_exact(r, n):
    buf = b""
    while len(buf) < n:
        c = r.read(n - len(buf))
        if not c:
            raise ConnectionError("peer closed")
        buf += c
    return buf


def ref_ws_recv(r):
    b = ref_read_exact(r, 2)
    op = b[0] & 0x0F
    masked = b[1] & 0x80
    ln = b[1] & 0x7F
    if ln == 126:
        ln = struct.unpack(">H", ref_read_exact(r, 2))[0]
    elif ln == 127:
        ln = struct.unpack(">Q", ref_read_exact(r, 8))[0]
    mask = ref_read_exact(r, 4) if masked else b""
    data = ref_read_exact(r, ln) if ln else b""
    if mask:
        data = bytes(c ^ mask[i % 4] for i, c in enumerate(data))
    return op, data


# ── 以下两个函数：NotifyServer.swift 里 WsFrame.encode / decode 的逐行搬运 ──

def swift_encode(payload: bytes, opcode: int = 0x1) -> bytes:
    out = bytearray()
    out.append(0x80 | opcode)
    n = len(payload)
    if n < 126:
        out.append(n)
    elif n < 65536:
        out.append(126)
        out.append((n >> 8) & 0xFF)
        out.append(n & 0xFF)
    else:
        out.append(127)
        for shift in range(56, -1, -8):
            out.append((n >> shift) & 0xFF)
    out += payload
    return bytes(out)


def swift_decode(buf: bytes):
    """返回 (opcode, payload, consumed)，字节不够返回 None"""
    if len(buf) < 2:
        return None
    base = 0
    opcode = buf[base] & 0x0F
    masked = (buf[base + 1] & 0x80) != 0
    length = buf[base + 1] & 0x7F
    offset = 2

    if length == 126:
        if len(buf) < offset + 2:
            return None
        length = (buf[base + offset] << 8) | buf[base + offset + 1]
        offset += 2
    elif length == 127:
        if len(buf) < offset + 8:
            return None
        value = 0
        for i in range(8):
            value = (value << 8) | buf[base + offset + i]
        length = value
        offset += 8

    mask_key = b""
    if masked:
        if len(buf) < offset + 4:
            return None
        mask_key = buf[base + offset:base + offset + 4]
        offset += 4

    if len(buf) < offset + length:
        return None

    payload = bytearray(buf[base + offset:base + offset + length])
    if masked:
        for i in range(len(payload)):
            payload[i] ^= mask_key[i % 4]

    return opcode, bytes(payload), offset + length


# ── 1. 我编 → 参照解 ──

class Sink:
    """把 ws_send 的输出收下来"""

    def __init__(self):
        self.buf = bytearray()

    def write(self, b):
        self.buf += b

    def flush(self):
        pass


class Src:
    """喂给 ws_recv 的假读端"""

    def __init__(self, data):
        self.data = data
        self.pos = 0

    def read(self, n):
        chunk = self.data[self.pos:self.pos + n]
        self.pos += len(chunk)
        return chunk


SIZES = [0, 1, 2, 124, 125, 126, 127, 128, 1000, 65534, 65535, 65536, 65537, 100000]

for n in SIZES:
    payload = bytes((i * 37 + n) & 0xFF for i in range(n))
    sink = Sink()
    ref_ws_send(sink, payload)
    op, data, consumed = swift_decode(bytes(sink.buf))
    check(f"我编→基准解  n={n} payload", data, payload)
    check(f"我编→基准解  n={n} opcode", op, 0x1)
    check(f"我编→基准解  n={n} 吃掉的字节", consumed, len(sink.buf))

# ── 2. 参照编 → 我解 ──

for n in SIZES:
    payload = bytes((i * 91 + 7) & 0xFF for i in range(n))
    encoded = swift_encode(payload)
    op, data = ref_ws_recv(Src(encoded))
    check(f"基准编→我解  n={n} payload", data, payload)
    check(f"基准编→我解  n={n} opcode", op, 0x1)

# ── 3. 带 mask 的客户端帧（浏览器发过来的一定是 masked）──

for n in [0, 5, 125, 126, 300, 70000]:
    payload = bytes((i * 13 + 3) & 0xFF for i in range(n))
    mask = bytes([0xAB, 0xCD, 0xEF, 0x12])
    head = bytearray([0x81])
    if n < 126:
        head.append(0x80 | n)
    elif n < 65536:
        head.append(0x80 | 126)
        head += struct.pack(">H", n)
    else:
        head.append(0x80 | 127)
        head += struct.pack(">Q", n)
    head += mask
    body = bytes(c ^ mask[i % 4] for i, c in enumerate(payload))
    frame = bytes(head) + body

    got = swift_decode(frame)
    check(f"masked  n={n}", got[1] if got else None, payload)
    check(f"masked  n={n} consumed", got[2] if got else None, len(frame))

# ── 4. 半包：字节不够时必须返回 None，而不是报错或给半截 ──

full = swift_encode(bytes(range(200)), 0x1)
for cut in [1, 2, 3, 5, 10, 100, len(full) - 1]:
    check(f"半包 cut={cut} 返回 None", swift_decode(full[:cut]), None)

# ── 5. 粘包：两帧接在一起，解第一帧的 consumed 必须正好是第一帧长度 ──

a = swift_encode(b"hello", 0x1)
b = swift_encode(b"world", 0x1)
op1, d1, c1 = swift_decode(a + b)
op2, d2, c2 = swift_decode((a + b)[c1:])
check("粘包 第一帧", d1, b"hello")
check("粘包 第二帧", d2, b"world")
check("粘包 consumed 正确", c1, len(a))

# ── 6. ping / close 的 opcode 不被吃掉 ──

for oc in [0x8, 0x9, 0xA]:
    frame = swift_encode(b"x", oc)
    got = swift_decode(frame)
    check(f"opcode 0x{oc:x} 保留", got[0], oc)

# ── 报告 ──

print("WsFrame 交叉验证")
print("  encode/decode 逻辑：NotifyServer.swift 的逐行搬运")
print("  基准：aptv-notify/notify_server.py（已在真机 + 车机上跑通）")
print()
if FAILURES:
    print("失败项：")
    for f in FAILURES:
        print("  ✗ " + f)
    print()
print(f"通过 {PASS} / {PASS + FAIL}")
sys.exit(1 if FAIL else 0)
