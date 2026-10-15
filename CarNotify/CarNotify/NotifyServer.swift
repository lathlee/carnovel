//
//  NotifyServer.swift
//  CarNotify
//
//  iPhone 内部的 HTTP + WebSocket 服务器，替代原型的 a-Shell + Python。
//
//  为什么能替代 a-Shell：
//    a-Shell 是别人的进程，iOS 想挂起就挂起，我们拦不住。
//    自己的 App 可以在 Info.plist 声明 UIBackgroundModes，
//    系统就得按后台 App 的规则对待我们 —— 这是 App 相对脚本终端的根本优势。
//
//  设计约束：
//  - 只用 Network.framework，零第三方依赖（不引 swift-nio，CI 上少一堆变数）。
//  - WebSocket 握手 + 帧编解码手写。RFC 6455 那点东西，写一遍最省事。
//  - 所有连接回调跑在同一个串行 queue 上，于是自己不用加锁。
//  - 端口优先固定 8081：APTV 里存的地址是 http://127.0.0.1:8081，
//    端口每次变的话每次都得重新输地址，很烦。
//

import Foundation
import Network
import CryptoKit

final class NotifyServer: ObservableObject {

    // MARK: - 对外状态（UI 绑定用）

    @Published private(set) var isRunning = false
    @Published private(set) var port: UInt16 = NotifyServer.preferredPort
    @Published private(set) var clientCount = 0
    @Published private(set) var lastError: String = ""
    @Published private(set) var pushedCount = 0

    static let preferredPort: UInt16 = 8081

    var urlString: String { "http://127.0.0.1:\(port)/" }

    // MARK: - 内部状态（只在 queue 上访问）

    private var listener: NWListener?
    private let queue = DispatchQueue(label: "carnotify.server")

    private var sockets: [ObjectIdentifier: Client] = [:]
    private var history: [[String: Any]] = []
    private let historyLimit = 50

    private struct Client {
        let connection: NWConnection
        var upgraded: Bool = false
        var headerBuffer = Data()
    }

    // MARK: - 生命周期

    func start() {
        guard listener == nil else { return }

        do {
            listener = try makeListener()
        } catch {
            DispatchQueue.main.async { self.lastError = "监听创建失败：\(error.localizedDescription)" }
            return
        }

        listener?.stateUpdateHandler = { [weak self] state in
            guard let self else { return }
            DispatchQueue.main.async {
                switch state {
                case .ready:
                    self.isRunning = true
                    self.lastError = ""
                    if let p = self.listener?.port?.rawValue { self.port = p }
                case .failed(let err):
                    self.isRunning = false
                    self.lastError = "监听失败：\(err.localizedDescription)"
                    self.listener = nil
                case .cancelled:
                    self.isRunning = false
                    self.listener = nil
                default:
                    break
                }
            }
        }

        listener?.newConnectionHandler = { [weak self] connection in
            self?.accept(connection)
        }

        listener?.start(queue: queue)
    }

    func stop() {
        listener?.cancel()
        listener = nil
        queue.async { [weak self] in
            guard let self else { return }
            for (_, client) in self.sockets { client.connection.cancel() }
            self.sockets.removeAll()
            self.publishClientCount()
        }
    }

    /// 先试固定 8081，被占用了才退到系统分配
    private func makeListener() throws -> NWListener {
        let params = NWParameters.tcp
        params.allowLocalEndpointReuse = true

        if let p = NWEndpoint.Port(rawValue: Self.preferredPort),
           let l = try? NWListener(using: params, on: p) {
            return l
        }
        return try NWListener(using: params, on: .any)
    }

    // MARK: - 推送 / 清屏（App 内部和页面共用）

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
            DispatchQueue.main.async { self.pushedCount += 1 }
        }
    }

    func clear() {
        queue.async { [weak self] in
            guard let self else { return }
            self.history.removeAll()
            self.broadcast(["type": "clear"])
        }
    }

    // MARK: - 连接处理

    private func accept(_ connection: NWConnection) {
        connection.start(queue: queue)
        sockets[ObjectIdentifier(connection)] = Client(connection: connection)
        readHeader(for: ObjectIdentifier(connection))
    }

    private func readHeader(for key: ObjectIdentifier) {
        guard let client = sockets[key] else { return }

        client.connection.receive(minimumIncompleteLength: 1, maximumLength: 16384) {
            [weak self] data, _, isDone, error in
            guard let self, var client = self.sockets[key] else { return }

            if let data, !data.isEmpty { client.headerBuffer.append(data) }
            self.sockets[key] = client

            if error != nil { self.drop(key); return }

            if let range = client.headerBuffer.range(of: Data("\r\n\r\n".utf8)) {
                let head = client.headerBuffer.subdata(in: client.headerBuffer.startIndex..<range.lowerBound)
                let rest = client.headerBuffer.subdata(in: range.upperBound..<client.headerBuffer.endIndex)
                self.handleRequest(key: key, header: head, leftover: rest)
                return
            }

            if client.headerBuffer.count > 64 * 1024 { self.drop(key); return }

            if isDone { self.drop(key) } else { self.readHeader(for: key) }
        }
    }

    private func handleRequest(key: ObjectIdentifier, header: Data, leftover: Data) {
        guard sockets[key] != nil, let text = String(data: header, encoding: .utf8) else {
            drop(key)
            return
        }

        let lines = text.components(separatedBy: "\r\n")
        guard let requestLine = lines.first else { drop(key); return }
        let parts = requestLine.split(separator: " ", omittingEmptySubsequences: true)
        guard parts.count >= 2 else { drop(key); return }

        let method = String(parts[0]).uppercased()
        let rawTarget = String(parts[1])
        let path = rawTarget.split(separator: "?").first.map(String.init) ?? rawTarget

        var headers: [String: String] = [:]
        for line in lines.dropFirst() {
            guard let colon = line.firstIndex(of: ":") else { continue }
            let name = String(line[..<colon]).trimmingCharacters(in: .whitespaces).lowercased()
            let value = String(line[line.index(after: colon)...]).trimmingCharacters(in: .whitespaces)
            headers[name] = value
        }

        switch (method, path) {
        case ("GET", "/ws"):
            upgradeToWebSocket(key: key, headers: headers)

        case ("GET", "/"), ("GET", "/index.html"):
            serveResource(key: key, name: "index", ext: "html")

        case ("GET", "/rtos.wasm"):
            serveResource(key: key, name: "rtos", ext: "wasm")

        case ("POST", "/push"):
            readBody(key: key, headers: headers, leftover: leftover) { [weak self] body in
                guard let self else { return }
                guard let body,
                      let object = (try? JSONSerialization.jsonObject(with: body)) as? [String: Any] else {
                    self.sendJSON(key: key, code: 400, object: ["ok": false, "err": "bad json"])
                    return
                }
                let clients = self.sockets.values.filter { $0.upgraded }.count
                self.push(
                    app: (object["app"] as? String) ?? "通知",
                    title: (object["title"] as? String) ?? "",
                    body: (object["body"] as? String) ?? (object["text"] as? String) ?? ""
                )
                self.sendJSON(key: key, code: 200, object: ["ok": true, "clients": clients])
            }

        case ("POST", "/clear"):
            readBody(key: key, headers: headers, leftover: leftover) { [weak self] _ in
                guard let self else { return }
                self.clear()
                self.sendJSON(key: key, code: 200, object: ["ok": true])
            }

        // 给 PC / curl 用的自检口，不参与页面逻辑
        case ("GET", "/status"):
            let clients = sockets.values.filter { $0.upgraded }.count
            sendJSON(key: key, code: 200, object: [
                "ok": true,
                "port": Int(port),
                "clients": clients,
                "history": history.count,
            ])

        default:
            sendText(key: key, code: 404,
                     contentType: "text/plain; charset=utf-8", body: "Not Found")
        }
    }

    private func drop(_ key: ObjectIdentifier) {
        guard let client = sockets.removeValue(forKey: key) else { return }
        client.connection.cancel()
        publishClientCount()
    }

    private func publishClientCount() {
        let n = sockets.values.filter { $0.upgraded }.count
        DispatchQueue.main.async { self.clientCount = n }
    }

    /// 攒够 Content-Length 指定的字节再回调
    private func readBody(key: ObjectIdentifier,
                          headers: [String: String],
                          leftover: Data,
                          done: @escaping (Data?) -> Void) {
        let need = Int(headers["content-length"] ?? "0") ?? 0
        if need <= 0 { done(Data()); return }

        var have = Data(leftover)
        if have.count >= need { done(Data(have.prefix(need))); return }

        func pull() {
            guard let client = sockets[key] else { done(nil); return }
            client.connection.receive(minimumIncompleteLength: 1, maximumLength: 65536) {
                data, _, _, error in
                if let data, !data.isEmpty { have.append(data) }
                if error != nil { done(nil); return }
                if have.count >= need { done(Data(have.prefix(need))); return }
                if have.count > 4 * 1024 * 1024 { done(nil); return }
                pull()
            }
        }
        pull()
    }

    // MARK: - WebSocket

    private func upgradeToWebSocket(key: ObjectIdentifier, headers: [String: String]) {
        guard let wsKey = headers["sec-websocket-key"],
              (headers["upgrade"] ?? "").lowercased().contains("websocket"),
              var client = sockets[key] else {
            sendText(key: key, code: 400,
                     contentType: "text/plain; charset=utf-8", body: "Not a WebSocket request")
            return
        }

        let accept = Self.webSocketAccept(for: wsKey)
        var response = "HTTP/1.1 101 Switching Protocols\r\n"
        response += "Upgrade: websocket\r\n"
        response += "Connection: Upgrade\r\n"
        response += "Sec-WebSocket-Accept: \(accept)\r\n"
        response += "\r\n"

        client.upgraded = true
        client.headerBuffer = Data()
        sockets[key] = client

        client.connection.send(content: Data(response.utf8),
                               completion: .contentProcessed { [weak self] error in
            guard let self else { return }
            if error != nil { self.drop(key); return }

            self.publishClientCount()

            // 回填历史，然后开始收帧
            self.sendFrame(key: key, text: self.jsonString([
                "type": "hello",
                "items": self.history,
            ]))
            self.readFrame(for: key)
        })
    }

    private static func webSocketAccept(for key: String) -> String {
        let magic = key + "258EAFA5-E914-47DA-95CA-C5AB0DC85B11"
        let digest = Insecure.SHA1.hash(data: Data(magic.utf8))
        return Data(digest).base64EncodedString()
    }

    private func readFrame(for key: ObjectIdentifier) {
        guard let client = sockets[key] else { return }

        client.connection.receive(minimumIncompleteLength: 1, maximumLength: 65536) {
            [weak self] data, _, isDone, error in
            guard let self, var client = self.sockets[key] else { return }

            if let data, !data.isEmpty { client.headerBuffer.append(data) }
            self.sockets[key] = client

            if error != nil || isDone { self.drop(key); return }

            self.drainFrames(key: key)
        }
    }

    private func drainFrames(key: ObjectIdentifier) {
        while true {
            guard var client = sockets[key] else { return }
            guard let frame = WsFrame.decode(client.headerBuffer) else {
                readFrame(for: key)
                return
            }

            client.headerBuffer.removeFirst(frame.consumed)
            sockets[key] = client

            switch frame.opcode {
            case 0x8:                                   // close
                drop(key)
                return
            case 0x9:                                   // ping → pong
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
        for (key, client) in sockets where client.upgraded {
            sendFrame(key: key, text: text)
        }
    }

    private func sendFrame(key: ObjectIdentifier, text: String) {
        sendFrame(key: key, payload: Data(text.utf8), opcode: 0x1)
    }

    private func sendFrame(key: ObjectIdentifier, payload: Data, opcode: UInt8) {
        guard let client = sockets[key] else { return }
        client.connection.send(content: WsFrame.encode(payload: payload, opcode: opcode),
                               completion: .contentProcessed { _ in })
    }

    // MARK: - 静态资源

    private func serveResource(key: ObjectIdentifier, name: String, ext: String) {
        // 优先 Documents —— 用文件 App 拖一个同名文件进去就能热替换，不用重新编译
        let documents = FileManager.default
            .urls(for: .documentDirectory, in: .userDomainMask)[0]
            .appendingPathComponent("\(name).\(ext)")
        let bundled = Bundle.main.url(forResource: name, withExtension: ext)
        let url = FileManager.default.fileExists(atPath: documents.path) ? documents : bundled

        guard let url, let data = try? Data(contentsOf: url) else {
            sendText(key: key, code: 404,
                     contentType: "text/plain; charset=utf-8", body: "missing \(name).\(ext)")
            return
        }

        let contentType: String
        switch ext {
        case "html": contentType = "text/html; charset=utf-8"
        case "wasm": contentType = "application/wasm"
        case "css":  contentType = "text/css; charset=utf-8"
        case "js":   contentType = "application/javascript; charset=utf-8"
        default:     contentType = "application/octet-stream"
        }

        var head = "HTTP/1.1 200 OK\r\n"
        head += "Content-Type: \(contentType)\r\n"
        head += "Content-Length: \(data.count)\r\n"
        head += "Cache-Control: no-store\r\n"
        head += "Connection: close\r\n"
        head += "\r\n"

        var out = Data(head.utf8)
        out.append(data)

        sockets[key]?.connection.send(content: out, completion: .contentProcessed { [weak self] _ in
            self?.drop(key)
        })
    }

    // MARK: - 响应工具

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

        sockets[key]?.connection.send(content: out, completion: .contentProcessed { [weak self] _ in
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
        /// 这一帧一共吃掉多少字节（帧头 + mask + 载荷）
        let consumed: Int
    }

    /// 解析第一帧。字节不够就返回 nil，等下一批数据。
    static func decode(_ buffer: Data) -> Decoded? {
        guard buffer.count >= 2 else { return nil }

        let base = buffer.startIndex
        let b0 = buffer[base]
        let b1 = buffer[base + 1]
        let opcode = b0 & 0x0F
        let masked = (b1 & 0x80) != 0
        var length = Int(b1 & 0x7F)
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
        if masked, !maskKey.isEmpty {
            for i in 0..<payload.count {
                payload[payload.startIndex + i] ^= maskKey[i % 4]
            }
        }

        return Decoded(opcode: opcode, payload: payload, consumed: offset + length)
    }

    /// 服务端 → 客户端的帧不需要 mask（RFC 6455 §5.1）
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
