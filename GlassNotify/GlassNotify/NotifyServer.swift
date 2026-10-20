//
//  NotifyServer.swift
//  GlassNotify
//
//  iPhone 内部的 HTTP + WebSocket 服务器，给一副安卓眼镜（Glass-view launcher）用。
//
//  相对 CarNotify 的改动：
//  - 端口固定 8090（避开 CarNotify 在车机上的 8081，两个 App 可共存）。
//  - 眼镜作为 WS 客户端连 ws://172.20.10.1:8090/ws（172.20.10.1 是 iPhone 个人热点的 IP）。
//  - 连上即回填历史：发 {"type":"latest","items":[...]} —— 与眼镜 NotifyClient 的解析一致
//    （CarNotify 旧版用的是 "hello"，眼镜端不认，这里改成 latest）。
//  - 新增三条由 iPhone 触控板下发的指令：pointer / tap / action，广播给连接的眼镜。
//
//  设计约束（沿用 CarNotify）：
//  - 只用 Network.framework，零第三方依赖。
//  - WebSocket 握手 + 帧编解码手写。
//  - 所有连接回调跑在同一个串行 queue 上，不加锁。
//

import Foundation
import Network
import CryptoKit

final class NotifyServer: ObservableObject {

    static let shared = NotifyServer()

    // MARK: - 对外状态（UI 绑定用）

    @Published private(set) var isRunning = false
    @Published private(set) var port: UInt16 = NotifyServer.preferredPort
    @Published private(set) var clientCount = 0
    @Published private(set) var lastError: String = ""
    @Published private(set) var pushedCount = 0

    // MARK: - App 层挂钩

    /// 每收到一条新通知（调试按钮走这里）。App 在这里挂原生提示音。
    var onPush: (([String: Any]) -> Void)?
    var onClear: (() -> Void)?

    /// 眼镜连上时回调（UI 可提示「已连接眼镜」）
    var onGlassConnect: (() -> Void)?

    static let preferredPort: UInt16 = 8090

    /// 本机回环地址（iPhone 自己访问调试用）
    var urlString: String { "http://127.0.0.1:\(port)/" }
    /// 眼镜连的地址：iPhone 开个人热点时固定是 172.20.10.1
    var glassesAddress: String { "http://172.20.10.1:\(port)/" }

    // MARK: - 内部类型

    private enum Phase: Equatable {
        case headers
        case body
        case websocket
    }

    private struct Request {
        let method: String
        let path: String
        let headers: [String: String]
    }

    private enum ParseOutcome {
        case needMore
        case parsed
        case malformed
    }

    private final class Client {
        let connection: NWConnection
        var phase: Phase = .headers
        var request: Request?
        var expectedBody = 0
        var buffer = Data()
        var body = Data()

        init(connection: NWConnection) {
            self.connection = connection
        }

        var isWebSocket: Bool { phase == .websocket }
    }

    // MARK: - 内部状态

    private var listener: NWListener?
    private let queue = DispatchQueue(label: "glassnotify.server")

    private var clients: [ObjectIdentifier: Client] = [:]
    private var history: [[String: Any]] = []
    private let historyLimit = 50

    // MARK: - 生命周期

    func start() {
        guard listener == nil else { return }

        let created: NWListener
        do {
            created = try makeListener()
        } catch {
            lastError = "监听创建失败：\(error.localizedDescription)"
            return
        }
        listener = created

        created.stateUpdateHandler = { [weak self] state in
            guard let self else { return }
            DispatchQueue.main.async {
                switch state {
                case .ready:
                    self.isRunning = true
                    self.lastError = ""
                    if let value = self.listener?.port?.rawValue { self.port = value }
                case .failed(let error):
                    self.isRunning = false
                    self.lastError = "监听失败：\(error.localizedDescription)"
                    self.listener = nil
                case .cancelled:
                    self.isRunning = false
                    self.listener = nil
                default:
                    break
                }
            }
        }

        created.newConnectionHandler = { [weak self] connection in
            self?.accept(connection)
        }

        created.start(queue: queue)
    }

    func stop() {
        listener?.cancel()
        listener = nil
        queue.async { [weak self] in
            guard let self else { return }
            for (_, client) in self.clients { client.connection.cancel() }
            self.clients.removeAll()
            self.publishClientCount()
        }
    }

    private func makeListener() throws -> NWListener {
        let parameters = NWParameters.tcp
        parameters.allowLocalEndpointReuse = true

        if let wanted = NWEndpoint.Port(rawValue: Self.preferredPort),
           let fixed = try? NWListener(using: parameters, on: wanted) {
            return fixed
        }
        return try NWListener(using: parameters, on: .any)
    }

    // MARK: - 推送 / 清屏 / 触控板（App 内的按钮和眼镜都走同一套）

    func push(app: String, title: String, body: String) {
        let item: [String: Any] = [
            "app": String(app.prefix(16)),
            "title": String(title.prefix(60)),
            "body": String(body.prefix(500)),
            "ts": Int(Date().timeIntervalSince1970),
        ]
        queue.async { [weak self] in
            guard let self else { return }
            self.history.append(item)
            if self.history.count > self.historyLimit {
                self.history.removeFirst(self.history.count - self.historyLimit)
            }
            self.broadcast(["type": "notify", "item": item])
            DispatchQueue.main.async {
                self.pushedCount += 1
                self.onPush?(item)
            }
        }
    }

    func clear() {
        queue.async { [weak self] in
            guard let self else { return }
            self.history.removeAll()
            self.broadcast(["type": "clear"])
            DispatchQueue.main.async { self.onClear?() }
        }
    }

    // MARK: - 触控板指令（iPhone -> 眼镜，经 WS 广播）

    /// 移动光标：nx/ny 为归一化坐标 0..1（左上原点）
    func pointer(x nx: Double, y ny: Double) {
        queue.async { [weak self] in
            self?.broadcast(["type": "pointer", "x": nx, "y": ny])
        }
    }

    /// 点击：nx/ny 为归一化坐标 0..1
    func tap(x nx: Double, y ny: Double) {
        queue.async { [weak self] in
            self?.broadcast(["type": "tap", "x": nx, "y": ny])
        }
    }

    /// 系统导航：back / home / recents
    func action(name: String) {
        queue.async { [weak self] in
            self?.broadcast(["type": "action", "name": name])
        }
    }

    // MARK: - 读取

    private func accept(_ connection: NWConnection) {
        connection.start(queue: queue)
        clients[ObjectIdentifier(connection)] = Client(connection: connection)
        readMore(ObjectIdentifier(connection))
    }

    private func readMore(_ key: ObjectIdentifier) {
        guard let client = clients[key] else { return }

        client.connection.receive(minimumIncompleteLength: 1, maximumLength: 32768) {
            [weak self] data, _, isDone, error in
            guard let self, let client = self.clients[key] else { return }

            if let data, !data.isEmpty {
                switch client.phase {
                case .headers, .websocket: client.buffer.append(data)
                case .body:                client.body.append(data)
                }
            }

            if error != nil { self.drop(key); return }

            switch client.phase {
            case .websocket:
                self.drainFrames(key)
                return

            case .headers:
                if client.buffer.count > 64 * 1024 { self.drop(key); return }
                switch self.tryParseHeaders(client) {
                case .malformed:
                    self.rejectAndDrop(key)
                    return
                case .parsed:
                    if client.body.count >= client.expectedBody {
                        self.finish(key: key, client: client)
                        return
                    }
                case .needMore:
                    break
                }

            case .body:
                if client.body.count > 8 * 1024 * 1024 { self.drop(key); return }
                if client.body.count >= client.expectedBody {
                    self.finish(key: key, client: client)
                    return
                }
            }

            if isDone { self.drop(key) } else { self.readMore(key) }
        }
    }

    private func tryParseHeaders(_ client: Client) -> ParseOutcome {
        guard let range = client.buffer.range(of: Data("\r\n\r\n".utf8)) else { return .needMore }

        let head = client.buffer.subdata(in: client.buffer.startIndex..<range.lowerBound)
        let leftover = client.buffer.subdata(in: range.upperBound..<client.buffer.endIndex)
        client.buffer = Data()

        guard let text = String(data: head, encoding: .utf8) else { return .malformed }
        let lines = text.components(separatedBy: "\r\n")
        guard let requestLine = lines.first else { return .malformed }

        let parts = requestLine.split(separator: " ", omittingEmptySubsequences: true)
        guard parts.count >= 2 else { return .malformed }

        let method = String(parts[0]).uppercased()
        let target = String(parts[1])
        let path = target.split(separator: "?").first.map(String.init) ?? target

        var headers: [String: String] = [:]
        for line in lines.dropFirst() {
            guard let colon = line.firstIndex(of: ":") else { continue }
            let name = String(line[..<colon]).trimmingCharacters(in: .whitespaces).lowercased()
            let value = String(line[line.index(after: colon)...]).trimmingCharacters(in: .whitespaces)
            headers[name] = value
        }

        client.request = Request(method: method, path: path, headers: headers)
        client.expectedBody = Int(headers["content-length"] ?? "0") ?? 0
        client.body = leftover
        client.phase = .body
        return .parsed
    }

    private func rejectAndDrop(_ key: ObjectIdentifier) {
        sendText(key: key, code: 400,
                 contentType: "text/plain; charset=utf-8", body: "Bad Request")
    }

    private func finish(key: ObjectIdentifier, client: Client) {
        guard let request = client.request else { drop(key); return }

        let body = client.body
        client.request = nil
        client.body = Data()
        client.expectedBody = 0
        client.phase = .headers

        dispatch(key: key, request: request, body: body)
    }

    private func dispatch(key: ObjectIdentifier, request: Request, body: Data) {
        switch (request.method, request.path) {

        case ("GET", "/ws"):
            upgradeToWebSocket(key: key, headers: request.headers)

        case ("GET", "/"), ("GET", "/index.html"):
            serveStatusPage(key: key)

        case ("POST", "/push"):
            guard let object = (try? JSONSerialization.jsonObject(with: body)) as? [String: Any] else {
                sendJSON(key: key, code: 400, object: ["ok": false, "err": "bad json"])
                return
            }
            let pages = clients.values.filter { $0.isWebSocket }.count
            push(
                app: (object["app"] as? String) ?? "通知",
                title: (object["title"] as? String) ?? "",
                body: (object["body"] as? String) ?? (object["text"] as? String) ?? ""
            )
            sendJSON(key: key, code: 200, object: ["ok": true, "clients": pages])

        case ("POST", "/clear"):
            clear()
            sendJSON(key: key, code: 200, object: ["ok": true])

        case ("GET", "/status"):
            sendJSON(key: key, code: 200, object: [
                "ok": true,
                "port": Int(port),
                "glasses": "172.20.10.1",
                "clients": clients.values.filter { $0.isWebSocket }.count,
                "history": history.count,
            ])

        case ("GET", "/latest"):
            let latest = Array(history.suffix(10).reversed())
            sendJSON(key: key, code: 200, object: ["ok": true, "items": latest])

        default:
            sendText(key: key, code: 404,
                     contentType: "text/plain; charset=utf-8", body: "Not Found")
        }
    }

    private func drop(_ key: ObjectIdentifier) {
        guard let client = clients.removeValue(forKey: key) else { return }
        client.connection.cancel()
        publishClientCount()
    }

    private func publishClientCount() {
        let n = clients.values.filter { $0.isWebSocket }.count
        DispatchQueue.main.async { self.clientCount = n }
    }

    // MARK: - WebSocket

    private func upgradeToWebSocket(key: ObjectIdentifier, headers: [String: String]) {
        guard let offered = headers["sec-websocket-key"],
              (headers["upgrade"] ?? "").lowercased().contains("websocket"),
              let client = clients[key] else {
            sendText(key: key, code: 400,
                     contentType: "text/plain; charset=utf-8", body: "Not a WebSocket request")
            return
        }

        var response = "HTTP/1.1 101 Switching Protocols\r\n"
        response += "Upgrade: websocket\r\n"
        response += "Connection: Upgrade\r\n"
        response += "Sec-WebSocket-Accept: \(Self.webSocketAccept(for: offered))\r\n"
        response += "\r\n"

        client.phase = .websocket
        client.buffer = Data()

        client.connection.send(content: Data(response.utf8),
                               completion: .contentProcessed { [weak self] error in
            guard let self else { return }
            if error != nil { self.drop(key); return }

            self.publishClientCount()
            // 连上即回填历史（与眼镜端解析一致：type=latest）
            self.sendFrame(key: key, text: self.jsonString([
                "type": "latest",
                "items": self.history,
            ]))
            DispatchQueue.main.async { self.onGlassConnect?() }
            self.readMore(key)
        })
    }

    private static func webSocketAccept(for key: String) -> String {
        let magic = key + "258EAFA5-E914-47DA-95CA-C5AB0DC85B11"
        let digest = Insecure.SHA1.hash(data: Data(magic.utf8))
        return Data(digest).base64EncodedString()
    }

    private func drainFrames(_ key: ObjectIdentifier) {
        while true {
            guard let client = clients[key] else { return }
            guard let frame = WsFrame.decode(client.buffer) else { return }
            client.buffer.removeFirst(frame.consumed)

            switch frame.opcode {
            case 0x8:                                   // close
                drop(key)
                return
            case 0x9:                                   // ping -> pong
                sendFrame(key: key, payload: frame.payload, opcode: 0xA)
            case 0x1:                                   // text
                if let text = String(data: frame.payload, encoding: .utf8), text == "ping" {
                    sendFrame(key: key, text: "{\"type\":\"pong\"}")
                }
            default:
                break
            }
        }
    }

    private func broadcast(_ object: [String: Any]) {
        let text = jsonString(object)
        for (key, client) in clients where client.isWebSocket {
            sendFrame(key: key, text: text)
        }
    }

    private func sendFrame(key: ObjectIdentifier, text: String) {
        sendFrame(key: key, payload: Data(text.utf8), opcode: 0x1)
    }

    private func sendFrame(key: ObjectIdentifier, payload: Data, opcode: UInt8) {
        guard let client = clients[key] else { return }
        client.connection.send(content: WsFrame.encode(payload: payload, opcode: opcode),
                               completion: .contentProcessed { _ in })
    }

    // MARK: - 静态资源（状态页 / JSON 响应）

    private func serveStatusPage(key: ObjectIdentifier) {
        let html = """
        <!doctype html><html lang="zh"><head><meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <title>GlassNotify</title></head><body style="background:#0b0e0b;color:#cfc;
        font-family:-apple-system,system-ui;padding:24px">
        <h2>GlassNotify 运行中</h2>
        <p>端口 <b>\(port)</b></p>
        <p>眼镜连接地址：<code>http://172.20.10.1:\(port)/ws</code></p>
        <p>已连眼镜：<b>\(clients.values.filter { $0.isWebSocket }.count)</b> 个</p>
        <p>历史消息：<b>\(history.count)</b> 条</p>
        <p>状态接口：<a href="/status" style="color:#7f7">/status</a></p>
        </body></html>
        """
        sendText(key: key, code: 200, contentType: "text/html; charset=utf-8", body: html)
    }

    private func sendJSON(key: ObjectIdentifier, code: Int, object: [String: Any]) {
        sendText(key: key, code: code,
                 contentType: "application/json; charset=utf-8", body: jsonString(object))
    }

    private func sendText(key: ObjectIdentifier, code: Int, contentType: String, body: String) {
        let data = Data(body.utf8)
        let reason: String
        switch code {
        case 200: reason = "OK"
        case 400: reason = "Bad Request"
        default:  reason = "Not Found"
        }

        var head = "HTTP/1.1 \(code) \(reason)\r\n"
        head += "Content-Type: \(contentType)\r\n"
        head += "Content-Length: \(data.count)\r\n"
        head += "Connection: close\r\n"
        head += "\r\n"

        var out = Data(head.utf8)
        out.append(data)

        clients[key]?.connection.send(content: out,
                                      completion: .contentProcessed { [weak self] _ in
            self?.drop(key)
        })
    }

    private func jsonString(_ object: [String: Any]) -> String {
        guard let data = try? JSONSerialization.data(withJSONObject: object),
              let text = String(data: data, encoding: .utf8) else { return "{}" }
        return text
    }
}

// ═══════════════════════════════════════════════════════════════════
//  WebSocket 帧编解码（RFC 6455）
// ═══════════════════════════════════════════════════════════════════

enum WsFrame {

    struct Decoded {
        let opcode: UInt8
        let payload: Data
        let consumed: Int
    }

    static func decode(_ buffer: Data) -> Decoded? {
        guard buffer.count >= 2 else { return nil }

        let base = buffer.startIndex
        let opcode = buffer[base] & 0x0F
        let masked = (buffer[base + 1] & 0x80) != 0
        var length = Int(buffer[base + 1] & 0x7F)
        var offset = 2

        if length == 126 {
            guard buffer.count >= offset + 2 else { return nil }
            length = Int(buffer[base + offset]) << 8 | Int(buffer[base + offset + 1])
            offset += 2
        } else if length == 127 {
            guard buffer.count >= offset + 8 else { return nil }
            var value = 0
            for i in 0..<8 { value = (value << 8) | Int(buffer[base + offset + i]) }
            length = value
            offset += 8
        }

        var maskKey = [UInt8]()
        if masked {
            guard buffer.count >= offset + 4 else { return nil }
            for i in 0..<4 { maskKey.append(buffer[base + offset + i]) }
            offset += 4
        }

        guard length >= 0, buffer.count >= offset + length else { return nil }

        var payload = Data(buffer[(base + offset)..<(base + offset + length)])
        if masked {
            for i in 0..<payload.count {
                payload[payload.startIndex + i] ^= maskKey[i % 4]
            }
        }

        return Decoded(opcode: opcode, payload: payload, consumed: offset + length)
    }

    static func encode(payload: Data, opcode: UInt8) -> Data {
        var out = Data()
        out.append(0x80 | opcode)

        let n = payload.count
        if n < 126 {
            out.append(UInt8(n))
        } else if n < 65536 {
            out.append(126)
            out.append(UInt8((n >> 8) & 0xFF))
            out.append(UInt8(n & 0xFF))
        } else {
            out.append(127)
            for shift in stride(from: 56, through: 0, by: -8) {
                out.append(UInt8((n >> shift) & 0xFF))
            }
        }

        out.append(payload)
        return out
    }
}
