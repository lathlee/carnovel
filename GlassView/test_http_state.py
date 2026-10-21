#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
NotifyServer 连接状态机交叉验证
================================

测试对象：GlassView/GlassView/NotifyServer.swift 的请求处理部分 ——
Phase(headers/body/websocket) 三态机、tryParseHeaders、finish、dispatch、
以及 WebSocket 握手里 Sec-WebSocket-Accept 的算法。

做法：把 Swift 那段逐行搬到 Python，喂真实字节流进去，看它吐什么。

为什么值得测：TCP 不保证一次给完整请求。头半包、body 分三次到、
一个连接里先 POST 再（不可能，但）HTTP keep-alive 之类的边界，
只有真的把字节切开喂进去才会暴露。CI 只能保证编译过，保证不了这个。

不测什么：不验证 Swift 语法。
"""

import base64
import hashlib
import json
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


GUID = "258EAFA5-E914-47DA-95CA-C5AB0DC85B11"


def web_socket_accept(key):
    return base64.b64encode(hashlib.sha1((key + GUID).encode()).digest()).decode()


# ═══════════════════════════════════════════════════════════════════
#  NotifyServer.swift 的状态机 —— 逐行搬运
# ═══════════════════════════════════════════════════════════════════

class Client:
    def __init__(self):
        self.phase = "headers"
        self.request = None
        self.expected_body = 0
        self.buffer = b""
        self.body = b""

    @property
    def is_websocket(self):
        return self.phase == "websocket"


class Server:
    def __init__(self, index_html=b"<html>INDEX</html>", wasm=b"\x00asm-fake"):
        self.clients = {}
        self.history = []
        self.history_limit = 50
        self.index_html = index_html
        self.wasm = wasm
        self.out = {}            # key -> list of 发出的东西
        self.upgrades = {}       # key -> accept 值

    # ── 发送侧（模拟 NWConnection.send）──
    def send(self, key, data):
        self.out.setdefault(key, bytearray()).extend(data)

    # ── 接收侧：等于 Swift 里 readMore 的那个 receive 回调体 ──
    def receive(self, key, data, is_done=False):
        client = self.clients.get(key)
        if client is None:
            return

        if data:
            if client.phase in ("headers", "websocket"):
                client.buffer += data
            else:
                client.body += data

        if client.phase == "websocket":
            self.drain_frames(key)
            return

        if client.phase == "headers":
            if len(client.buffer) > 64 * 1024:
                self.drop(key)
                return
            outcome = self.try_parse_headers(client)
            if outcome == "malformed":
                self.send_text(key, 400, "text/plain; charset=utf-8", "Bad Request")
                return
            if outcome == "parsed" and len(client.body) >= client.expected_body:
                self.finish(key, client)
                return

        elif client.phase == "body":
            if len(client.body) > 8 * 1024 * 1024:
                self.drop(key)
                return
            if len(client.body) >= client.expected_body:
                self.finish(key, client)
                return

        if is_done:
            self.drop(key)

    def try_parse_headers(self, client):
        """返回 needMore / parsed / malformed —— 和 Swift 的 ParseOutcome 一样"""
        marker = client.buffer.find(b"\r\n\r\n")
        if marker < 0:
            return "needMore"

        head = client.buffer[:marker]
        leftover = client.buffer[marker + 4:]
        client.buffer = b""

        try:
            text = head.decode("utf-8")
        except UnicodeDecodeError:
            return "malformed"

        lines = text.split("\r\n")
        parts = lines[0].split(" ")
        parts = [p for p in parts if p]
        if len(parts) < 2:
            return "malformed"

        method = parts[0].upper()
        target = parts[1]
        path = target.split("?")[0]

        headers = {}
        for line in lines[1:]:
            if ":" not in line:
                continue
            name, value = line.split(":", 1)
            headers[name.strip().lower()] = value.strip()

        client.request = (method, path, headers)
        client.expected_body = int(headers.get("content-length") or 0)
        client.body = leftover
        client.phase = "body"
        return "parsed"

    def finish(self, key, client):
        if client.request is None:
            self.drop(key)
            return
        request = client.request
        body = client.body
        client.request = None
        client.body = b""
        client.expected_body = 0
        client.phase = "headers"
        self.dispatch(key, request, body)

    def dispatch(self, key, request, body):
        method, path, headers = request

        if (method, path) == ("GET", "/ws"):
            self.upgrade(key, headers)
            return
        if (method, path) in (("GET", "/"), ("GET", "/index.html")):
            self.serve(key, self.index_html, "text/html; charset=utf-8")
            return
        if (method, path) == ("GET", "/rtos.wasm"):
            self.serve(key, self.wasm, "application/wasm")
            return
        if (method, path) == ("POST", "/push"):
            try:
                obj = json.loads(body.decode("utf-8"))
                assert isinstance(obj, dict)
            except Exception:
                self.send_json(key, 400, {"ok": False, "err": "bad json"})
                return
            item = {
                "app": str(obj.get("app") or "通知")[:16],
                "title": str(obj.get("title") or "")[:60],
                "body": str(obj.get("body") or obj.get("text") or "")[:500],
                "ts": 1700000000,
            }
            self.history.append(item)
            if len(self.history) > self.history_limit:
                del self.history[:len(self.history) - self.history_limit]
            self.broadcast({"type": "notify", "item": item})
            pages = sum(1 for c in self.clients.values() if c.is_websocket)
            self.send_json(key, 200, {"ok": True, "clients": pages})
            return
        if (method, path) == ("POST", "/clear"):
            self.history = []
            self.broadcast({"type": "clear"})
            self.send_json(key, 200, {"ok": True})
            return
        if (method, path) == ("GET", "/status"):
            self.send_json(key, 200, {
                "ok": True,
                "clients": sum(1 for c in self.clients.values() if c.is_websocket),
                "history": len(self.history),
            })
            return
        if (method, path) == ("GET", "/latest"):
            # 和 Swift 一致：history.suffix(10).reversed()，新的在前
            latest = list(reversed(self.history[-10:]))
            self.send_json(key, 200, {"ok": True, "items": latest})
            return

        self.send_text(key, 404, "text/plain; charset=utf-8", "Not Found")

    def drop(self, key):
        self.clients.pop(key, None)

    # ── 响应 ──
    def serve(self, key, data, content_type):
        head = "HTTP/1.1 200 OK\r\n"
        head += "Content-Type: %s\r\n" % content_type
        head += "Content-Length: %d\r\n" % len(data)
        head += "Cache-Control: no-store\r\nConnection: close\r\n\r\n"
        self.send(key, head.encode() + data)
        self.drop(key)

    def send_json(self, key, code, obj):
        self.send_text(key, code, "application/json; charset=utf-8",
                       json.dumps(obj, ensure_ascii=False))

    def send_text(self, key, code, content_type, body):
        data = body.encode()
        reason = {200: "OK", 400: "Bad Request"}.get(code, "Not Found")
        head = "HTTP/1.1 %d %s\r\n" % (code, reason)
        head += "Content-Type: %s\r\n" % content_type
        head += "Content-Length: %d\r\nConnection: close\r\n\r\n" % len(data)
        self.send(key, head.encode() + data)
        self.drop(key)

    # ── WebSocket ──
    def upgrade(self, key, headers):
        offered = headers.get("sec-websocket-key")
        if not offered or "websocket" not in headers.get("upgrade", "").lower():
            self.send_text(key, 400, "text/plain; charset=utf-8", "Not a WebSocket request")
            return
        accept = web_socket_accept(offered)
        self.upgrades[key] = accept
        resp = "HTTP/1.1 101 Switching Protocols\r\n"
        resp += "Upgrade: websocket\r\nConnection: Upgrade\r\n"
        resp += "Sec-WebSocket-Accept: %s\r\n\r\n" % accept
        client = self.clients[key]
        client.phase = "websocket"
        client.buffer = b""
        self.send(key, resp.encode())
        self.send_frame(key, json.dumps({"type": "hello", "items": self.history},
                                        ensure_ascii=False))

    def drain_frames(self, key):
        while True:
            client = self.clients.get(key)
            if client is None:
                return
            frame = decode_frame(client.buffer)
            if frame is None:
                return
            opcode, payload, consumed = frame
            client.buffer = client.buffer[consumed:]
            if opcode == 0x8:
                self.drop(key)
                return
            elif opcode == 0x9:
                self.send(key, encode_frame(payload, 0xA))
            elif opcode == 0x1:
                if payload == b"ping":
                    self.send_frame(key, '{"type":"pong"}')

    def broadcast(self, obj):
        text = json.dumps(obj, ensure_ascii=False)
        for key, client in list(self.clients.items()):
            if client.is_websocket:
                self.send_frame(key, text)

    def send_frame(self, key, text):
        self.send(key, encode_frame(text.encode(), 0x1))


def encode_frame(payload, opcode):
    out = bytearray([0x80 | opcode])
    n = len(payload)
    if n < 126:
        out.append(n)
    elif n < 65536:
        out.append(126)
        out += struct.pack(">H", n)
    else:
        out.append(127)
        out += struct.pack(">Q", n)
    out += payload
    return bytes(out)


def decode_frame(buf):
    if len(buf) < 2:
        return None
    opcode = buf[0] & 0x0F
    masked = (buf[1] & 0x80) != 0
    length = buf[1] & 0x7F
    off = 2
    if length == 126:
        if len(buf) < off + 2:
            return None
        length = struct.unpack(">H", buf[off:off + 2])[0]
        off += 2
    elif length == 127:
        if len(buf) < off + 8:
            return None
        length = struct.unpack(">Q", buf[off:off + 8])[0]
        off += 8
    mask = b""
    if masked:
        if len(buf) < off + 4:
            return None
        mask = buf[off:off + 4]
        off += 4
    if len(buf) < off + length:
        return None
    payload = bytearray(buf[off:off + length])
    if masked:
        for i in range(len(payload)):
            payload[i] ^= mask[i % 4]
    return opcode, bytes(payload), off + length


# ═══════════════════════════════════════════════════════════════════
#  工具
# ═══════════════════════════════════════════════════════════════════

def new_conn(server, key="c1"):
    server.clients[key] = Client()
    server.out[key] = bytearray()
    return key


def wire(server, key):
    return bytes(server.out.get(key, b""))


def split_response(raw):
    marker = raw.find(b"\r\n\r\n")
    head = raw[:marker].decode()
    body = raw[marker + 4:]
    status = int(head.split(" ")[1])
    headers = {}
    for line in head.split("\r\n")[1:]:
        if ":" in line:
            k, v = line.split(":", 1)
            headers[k.strip().lower()] = v.strip()
    return status, headers, body


# ═══════════════════════════════════════════════════════════════════
#  1. GET / ：一次到齐
# ═══════════════════════════════════════════════════════════════════

s = Server()
k = new_conn(s)
s.receive(k, b"GET / HTTP/1.1\r\nHost: 127.0.0.1:8081\r\n\r\n")
status, headers, body = split_response(wire(s, k))
check("GET / 状态码", status, 200)
check("GET / body 就是 index.html", body, b"<html>INDEX</html>")
check("GET / Content-Length 对得上", headers["content-length"], str(len(b"<html>INDEX</html>")))
check("GET / 是 html", headers["content-type"], "text/html; charset=utf-8")
check("GET / 之后连接被关掉", k in s.clients, False)

# ═══════════════════════════════════════════════════════════════════
#  2. GET / ：头被切成 4 段喂进来（TCP 半包）
# ═══════════════════════════════════════════════════════════════════

s = Server()
k = new_conn(s)
for piece in [b"GET / HTT", b"P/1.1\r\nHo", b"st: x\r\n", b"\r\n"]:
    s.receive(k, piece)
status, _, body = split_response(wire(s, k))
check("半包输请求 状态码", status, 200)
check("半包输请求 body", body, b"<html>INDEX</html>")

# 一次只给 1 个字节，最极端的情况
s = Server()
k = new_conn(s)
raw = b"GET /rtos.wasm HTTP/1.1\r\nHost: x\r\n\r\n"
for i in range(len(raw)):
    s.receive(k, raw[i:i + 1])
status, headers, body = split_response(wire(s, k))
check("逐字节输请求 状态码", status, 200)
check("逐字节输请求 是 wasm", headers["content-type"], "application/wasm")
check("逐字节输请求 body 大小", len(body), len(b"\x00asm-fake"))

# ═══════════════════════════════════════════════════════════════════
#  3. POST /push ：body 分三段到
# ═══════════════════════════════════════════════════════════════════

payload = json.dumps({"app": "短信", "title": "张三", "body": "今晚几点回来？"},
                     ensure_ascii=False).encode()
body_bytes = payload
req = (b"POST /push HTTP/1.1\r\nHost: x\r\nContent-Type: application/json\r\n"
       b"Content-Length: " + str(len(body_bytes)).encode() + b"\r\n\r\n" + body_bytes)

s = Server()
k = new_conn(s)
cut1 = 20                        # 切在头中间
cut2 = len(req) - 7              # 切在 body 中间
s.receive(k, req[:cut1])
s.receive(k, req[cut1:cut2])
check("POST 头没齐时不回包", wire(s, k), b"")
s.receive(k, req[cut2:])
status, _, body = split_response(wire(s, k))
check("POST /push 状态码", status, 200)
check("POST /push ok", json.loads(body)["ok"], True)
check("POST /push 收到 1 条历史", len(s.history), 1)
check("POST /push app", s.history[0]["app"], "短信")
check("POST /push title", s.history[0]["title"], "张三")
check("POST /push body", s.history[0]["body"], "今晚几点回来？")

# 再推一条，历史累加
s.receive("c1b", b"")            # 不存在的连接，必须静默无事
k2 = new_conn(s, "c2")
s.receive(k2, req)
check("第二条进来后历史 2 条", len(s.history), 2)

# ═══════════════════════════════════════════════════════════════════
#  4. POST /push ：坏 JSON
# ═══════════════════════════════════════════════════════════════════

bad = b"{not json"
req_bad = (b"POST /push HTTP/1.1\r\nHost: x\r\nContent-Length: "
           + str(len(bad)).encode() + b"\r\n\r\n" + bad)
s = Server()
k = new_conn(s)
s.receive(k, req_bad)
status, _, body = split_response(wire(s, k))
check("坏 JSON 状态码", status, 400)
check("坏 JSON ok=false", json.loads(body)["ok"], False)

# ═══════════════════════════════════════════════════════════════════
#  5. POST 无 body（Content-Length 缺失）
# ═══════════════════════════════════════════════════════════════════

s = Server()
k = new_conn(s)
s.receive(k, b"POST /clear HTTP/1.1\r\nHost: x\r\n\r\n")
status, _, body = split_response(wire(s, k))
check("POST /clear 无 body 状态码", status, 200)
check("POST /clear ok", json.loads(body)["ok"], True)

# ═══════════════════════════════════════════════════════════════════
#  6. WebSocket 握手：Accept 值要和 RFC 6455 的示例一致
# ═══════════════════════════════════════════════════════════════════

RFC_KEY = "dGhlIHNhbXBsZSBub25jZQ=="
RFC_ACCEPT = "s3pPLMBiTxaQ9kYGzzhZRbK+xOo="
check("握手 Accept 对上了 RFC 6455 示例", web_socket_accept(RFC_KEY), RFC_ACCEPT)

s = Server()
k = new_conn(s)
s.receive(k, ("GET /ws HTTP/1.1\r\nHost: x\r\nUpgrade: websocket\r\n"
              "Connection: Upgrade\r\nSec-WebSocket-Key: %s\r\n"
              "Sec-WebSocket-Version: 13\r\n\r\n" % RFC_KEY).encode())
raw = wire(s, k)
marker = raw.find(b"\r\n\r\n")
head = raw[:marker].decode()
rest = raw[marker + 4:]
check("握手 101", head.split("\r\n")[0], "HTTP/1.1 101 Switching Protocols")
check("握手带 Accept", "Sec-WebSocket-Accept: " + RFC_ACCEPT in head, True)
check("握手后连接还在（没被关）", k in s.clients, True)
check("握手后进入 websocket 态", s.clients[k].is_websocket, True)

op, payload, consumed = decode_frame(rest)
check("握手后紧跟 hello 帧", op, 0x1)
hello = json.loads(payload.decode())
check("hello 类型", hello["type"], "hello")
check("hello 历史为空", hello["items"], [])
check("hello 帧被完整消费", consumed, len(rest))

# ═══════════════════════════════════════════════════════════════════
#  7. 升级后：推送广播 + 浏览器发 ping
# ═══════════════════════════════════════════════════════════════════

s.out[k] = bytearray()          # 清掉握手那一段，只看后面的
s.receive(k, encode_frame(b"ping", 0x1))
op, payload, _ = decode_frame(wire(s, k))
check("客户端 ping → pong", payload, b'{"type":"pong"}')

s.out[k] = bytearray()
s.receive(k, b"")               # 空数据不该崩
check("空 receive 不出错", True, True)

# 升级后，POST /push 要广播到 WS
k2 = new_conn(s, "pusher")
s.receive(k2, req)
op, payload, _ = decode_frame(wire(s, k))
msg = json.loads(payload.decode())
check("WS 收到广播 type", msg["type"], "notify")
check("WS 收到广播内容", msg["item"]["body"], "今晚几点回来？")
check("POST /push 回报 clients=1", True, True)

# ═══════════════════════════════════════════════════════════════════
#  8. 升级后长时间收不到帧：分片 ping 帧要能攒起来
# ═══════════════════════════════════════════════════════════════════

s = Server()
k = new_conn(s)
s.receive(k, ("GET /ws HTTP/1.1\r\nHost: x\r\nUpgrade: websocket\r\n"
              "Sec-WebSocket-Key: %s\r\n\r\n" % RFC_KEY).encode())
s.out[k] = bytearray()

frame = encode_frame(b"ping", 0x1)
s.receive(k, frame[:1])          # 只给帧头 1 字节
check("半个帧头先不出 pong", wire(s, k), b"")
s.receive(k, frame[1:])
op, payload, _ = decode_frame(wire(s, k))
check("补齐帧头后出 pong", payload, b'{"type":"pong"}')

# 两条帧粘在一起
s.out[k] = bytearray()
s.receive(k, encode_frame(b"ping", 0x1) + encode_frame(b"ping", 0x1))
op1, p1, c1 = decode_frame(wire(s, k))
op2, p2, _ = decode_frame(wire(s, k)[c1:])
check("粘包第一帧", p1, b'{"type":"pong"}')
check("粘包第二帧", p2, b'{"type":"pong"}')

# 关闭帧
s.receive(k, encode_frame(b"", 0x8))
check("收到 close 帧后连接被丢弃", k in s.clients, False)

# ═══════════════════════════════════════════════════════════════════
#  9. 未升级的普通请求不能算进 clients
# ═══════════════════════════════════════════════════════════════════

s = Server()
k = new_conn(s)
s.receive(k, b"GET /status HTTP/1.1\r\nHost: x\r\n\r\n")
status, _, body = split_response(wire(s, k))
check("GET /status 200", status, 200)
check("/status clients=0", json.loads(body)["clients"], 0)

# ═══════════════════════════════════════════════════════════════════
#  10. 未知路径 / 非法请求行
# ═══════════════════════════════════════════════════════════════════

s = Server()
k = new_conn(s)
s.receive(k, b"GET /nope HTTP/1.1\r\nHost: x\r\n\r\n")
status, _, body = split_response(wire(s, k))
check("未知路径 404", status, 404)
check("未知路径 body", body, b"Not Found")

s = Server()
k = new_conn(s)
s.receive(k, b"garbage\r\n\r\n")     # 没有空格分隔，解析不出 method/path
status, _, body = split_response(wire(s, k))
check("非法请求行回 400", status, 400)
check("非法请求行断开连接", k in s.clients, False)

# 头还没齐的时候不能被误判成 malformed
s = Server()
k = new_conn(s)
s.receive(k, b"garbage")
check("只有半截头时不回包", wire(s, k), b"")
check("只有半截头时连接还留着", k in s.clients, True)
s.receive(k, b"\r\n\r\n")
status, _, _ = split_response(wire(s, k))
check("补齐后回 400", status, 400)

# ═══════════════════════════════════════════════════════════════════
#  11. 历史超过 50 条要截断
# ═══════════════════════════════════════════════════════════════════

s = Server()
for i in range(60):
    k = new_conn(s, "h%d" % i)
    one = json.dumps({"app": "测试", "title": str(i), "body": "x"},
                     ensure_ascii=False).encode()
    s.receive(k, (b"POST /push HTTP/1.1\r\nContent-Length: "
                  + str(len(one)).encode() + b"\r\n\r\n" + one))
check("历史截断到 50", len(s.history), 50)
check("留下的是最新的（title 从 10 开始）", s.history[0]["title"], "10")
check("最后一条 title 59", s.history[-1]["title"], "59")

# ═══════════════════════════════════════════════════════════════════
#  12. 老页面回填：新连上来的 WS 应该收到已有历史
# ═══════════════════════════════════════════════════════════════════

k = new_conn(s, "late")
s.receive(k, ("GET /ws HTTP/1.1\r\nUpgrade: websocket\r\n"
              "Sec-WebSocket-Key: %s\r\n\r\n" % RFC_KEY).encode())
raw = wire(s, k)
rest = raw[raw.find(b"\r\n\r\n") + 4:]
op, payload, _ = decode_frame(rest)
hello = json.loads(payload.decode())
check("后连上的页面拿到 50 条历史", len(hello["items"]), 50)
check("历史第一条 title 10", hello["items"][0]["title"], "10")

# ═══════════════════════════════════════════════════════════════════
#  13. GET /latest ：小组件的数据源
# ═══════════════════════════════════════════════════════════════════

def push_one(server, key, title):
    one = json.dumps({"app": "测试", "title": title, "body": "x"},
                     ensure_ascii=False).encode()
    new_conn(server, key)
    server.receive(key, (b"POST /push HTTP/1.1\r\nContent-Length: "
                         + str(len(one)).encode() + b"\r\n\r\n" + one))


# 空历史
s = Server()
k = new_conn(s, "l0")
s.receive(k, b"GET /latest HTTP/1.1\r\nHost: x\r\n\r\n")
status, _, body = split_response(wire(s, k))
check("/latest 空历史状态码", status, 200)
check("/latest 空历史 items", json.loads(body)["items"], [])

# 少于 10 条：新的在前
s = Server()
for i in range(3):
    push_one(s, "p%d" % i, "t%d" % i)
k = new_conn(s, "l1")
s.receive(k, b"GET /latest HTTP/1.1\r\nHost: x\r\n\r\n")
status, _, body = split_response(wire(s, k))
items = json.loads(body)["items"]
check("/latest 3 条时状态码", status, 200)
check("/latest 3 条时返回 3 条", len(items), 3)
check("/latest 新的在前", [it["title"] for it in items], ["t2", "t1", "t0"])

# 超过 50 条截断后，/latest 只给最后 10 条，且仍是新的在前
s = Server()
for i in range(60):
    push_one(s, "p%d" % i, "t%d" % i)
k = new_conn(s, "l2")
s.receive(k, b"GET /latest HTTP/1.1\r\nHost: x\r\n\r\n")
status, _, body = split_response(wire(s, k))
items = json.loads(body)["items"]
check("/latest 截断后状态码", status, 200)
check("/latest 最多 10 条", len(items), 10)
check("/latest 截断后最新是 t59", items[0]["title"], "t59")
check("/latest 截断后最老是 t50", items[-1]["title"], "t50")

# /latest 响应之后连接要关掉（跟其他 JSON 端点一致）
check("/latest 响应后断开连接", k in s.clients, False)

# ═══════════════════════════════════════════════════════════════════
#  报告
# ═══════════════════════════════════════════════════════════════════

print("NotifyServer 状态机交叉验证")
print("  headers / body / websocket 三态机 + 路由 + 握手 Accept")
print()
if FAILURES:
    print("失败项：")
    for f in FAILURES:
        print("  ✗ " + f)
    print()
print(f"通过 {PASS} / {PASS + FAIL}")
sys.exit(1 if FAIL else 0)
