//
//  BookHTTPServer.swift
//  CarNovel
//
//  在 iPhone 内部起一个极简 HTTP 服务器。
//
//  用途：CarPlay 里的 APTV / 车联投屏 等第三方 App 自带浏览器，
//  它们能把网页渲染到车机屏上。我们的 App 不需要 CarPlay entitlement，
//  只要把小说内容以网页形式提供，车机浏览器访问 http://127.0.0.1:xxxx/ 即可阅读。
//
//  设计约束：
//  - 零第三方依赖，只用 Network.framework 的 NWListener。
//  - 监听端口由系统分配（传 0），避免 8080 被占用。
//  - 所有回调跑在 .main queue，这样读 SwiftData 不需要跨 actor。
//  - 响应 HTML/CSS，黑底白字、大字号、全屏，适合车机远距离观看。
//

import Foundation
import Network
import SwiftData
import SwiftUI
import UIKit

final class BookHTTPServer: ObservableObject {

    static let shared = BookHTTPServer()

    @Published var isRunning = false
    @Published var urlString = ""

    private var listener: NWListener?
    private weak var modelContainer: ModelContainer?

    private init() {}

    func configure(modelContainer: ModelContainer) {
        self.modelContainer = modelContainer
    }

    func start() {
        guard listener == nil else { return }

        let parameters = NWParameters.tcp
        do {
            listener = try NWListener(using: parameters, on: .any)
        } catch {
            urlString = "端口创建失败: \(error.localizedDescription)"
            return
        }

        listener?.stateUpdateHandler = { [weak self] state in
            DispatchQueue.main.async {
                switch state {
                case .ready:
                    self?.isRunning = true
                    if let port = self?.listener?.port?.rawValue {
                        self?.urlString = "http://127.0.0.1:\(port)/"
                    }
                case .failed(let err):
                    self?.isRunning = false
                    self?.urlString = "监听失败: \(err.localizedDescription)"
                    self?.listener = nil
                case .cancelled:
                    self?.isRunning = false
                    self?.urlString = ""
                    self?.listener = nil
                default:
                    break
                }
            }
        }

        listener?.newConnectionHandler = { [weak self] connection in
            self?.handleConnection(connection)
        }

        listener?.start(queue: .main)
    }

    func stop() {
        listener?.cancel()
        listener = nil
    }

    /// 生成当前书/章/页的完整 URL
    func readURL(bookID: String, chapter: Int, page: Int) -> String {
        guard let port = listener?.port?.rawValue else { return urlString }
        return "http://127.0.0.1:\(port)/read?book=\(bookID)&chapter=\(chapter)&page=\(page)"
    }

    // MARK: - 连接处理

    private func handleConnection(_ connection: NWConnection) {
        connection.stateUpdateHandler = { state in
            if case .failed = state {
                connection.cancel()
            }
        }
        connection.start(queue: .main)

        var buffer = Data()

        func read() {
            connection.receive(minimumIncompleteLength: 1, maximumLength: 65536) { data, _, isDone, error in
                if let data = data {
                    buffer.append(data)
                }

                if error != nil {
                    connection.cancel()
                    return
                }

                if let range = buffer.range(of: Data("\r\n\r\n".utf8)) {
                    let headerBytes = buffer.subdata(in: 0..<range.upperBound)
                    guard let requestLine = self.parseRequestLine(from: headerBytes) else {
                        self.send404(connection)
                        return
                    }
                    self.dispatch(requestLine: requestLine, on: connection)
                    return
                }

                if isDone {
                    connection.cancel()
                } else {
                    read()
                }
            }
        }

        read()
    }

    private func parseRequestLine(from headerData: Data) -> (method: String, path: String, query: String)? {
        guard let header = String(data: headerData, encoding: .utf8) else { return nil }
        let lines = header.components(separatedBy: "\r\n")
        guard let first = lines.first else { return nil }
        let parts = first.split(separator: " ", maxSplits: 2, omittingEmptySubsequences: true)
        guard parts.count >= 2, parts[0] == "GET" else { return nil }

        let raw = String(parts[1])
        if let qIndex = raw.firstIndex(of: "?") {
            let path = String(raw[..<qIndex])
            let query = String(raw[raw.index(after: qIndex)...])
            return ("GET", path, query)
        }
        return ("GET", raw, "")
    }

    // MARK: - 路由

    private func dispatch(requestLine: (method: String, path: String, query: String),
                          on connection: NWConnection) {
        let path = requestLine.path
        let queryItems = parseQuery(requestLine.query)

        Task { @MainActor in
            let (body, contentType): (Data, String)
            switch path {
            case "/":
                body = (await self.renderIndex()).data(using: .utf8) ?? Data()
                contentType = "text/html; charset=utf-8"
            case "/read":
                let html = await self.renderRead(
                    bookID: queryItems["book"],
                    chapter: queryItems["chapter"].flatMap(Int.init),
                    page: queryItems["page"].flatMap(Int.init)
                )
                body = html.data(using: .utf8) ?? Data()
                contentType = "text/html; charset=utf-8"
            case "/style.css":
                body = self.css().data(using: .utf8) ?? Data()
                contentType = "text/css; charset=utf-8"
            default:
                body = self.notFoundHTML().data(using: .utf8) ?? Data()
                contentType = "text/html; charset=utf-8"
            }
            self.sendResponse(connection, status: "200 OK", contentType: contentType, body: body)
        }
    }

    private func parseQuery(_ query: String) -> [String: String] {
        var result: [String: String] = [:]
        for pair in query.components(separatedBy: "&") {
            let kv = pair.components(separatedBy: "=")
            if kv.count == 2, let key = kv[0].removingPercentEncoding,
               let value = kv[1].removingPercentEncoding {
                result[key] = value
            }
        }
        return result
    }

    // MARK: - 响应工具

    private func sendResponse(_ connection: NWConnection, status: String,
                              contentType: String, body: Data) {
        let head = "HTTP/1.1 \(status)\r\nContent-Type: \(contentType)\r\nContent-Length: \(body.count)\r\nConnection: close\r\n\r\n"
        let data = (head.data(using: .utf8) ?? Data()) + body
        connection.send(content: data, completion: .contentProcessed { _ in
            connection.cancel()
        })
    }

    private func send404(_ connection: NWConnection) {
        sendResponse(connection, status: "404 Not Found",
                     contentType: "text/plain; charset=utf-8",
                     body: Data("Not Found".utf8))
    }

    // MARK: - 页面渲染

    @MainActor
    private func renderIndex() async -> String {
        guard let context = modelContainer?.mainContext else {
            return errorHTML("服务器尚未拿到书架数据")
        }

        let descriptor = FetchDescriptor<ShelfBook>(
            sortBy: [SortDescriptor(\.lastReadAt, order: .reverse)]
        )
        let books = (try? context.fetch(descriptor)) ?? []

        var items = ""
        if books.isEmpty {
            items = "<div class='empty'>书架为空，请在 iPhone App 里导入 TXT 或 EPUB</div>"
        } else {
            for book in books {
                let resumeChapter = max(0, min(book.currentChapter, book.chapterList.count - 1))
                let href = "/read?book=\(escape(book.bookID))&chapter=\(resumeChapter)&page=\(book.currentPage)"
                let author = book.author.isEmpty ? "未知作者" : book.author
                let progress = book.chapterList.isEmpty
                    ? "未读"
                    : "第 \(resumeChapter + 1) 章 · 第 \(book.currentPage + 1) 页"
                items += """
                <a class="book" href="\(href)">
                    <div class="title">\(escape(book.title))</div>
                    <div class="meta">\(escape(author)) · \(progress)</div>
                </a>
                """
            }
        }

        return wrap(title: "书架", body: """
        <h1>CarNovel 书架</h1>
        \(items)
        """)
    }

    @MainActor
    private func renderRead(bookID: String?, chapter: Int?, page: Int?) async -> String {
        guard let bookID = bookID else { return errorHTML("缺少 book 参数") }
        guard let chapter = chapter, chapter >= 0 else { return errorHTML("缺少 chapter 参数") }
        guard let context = modelContainer?.mainContext else { return errorHTML("服务器未就绪") }

        let descriptor = FetchDescriptor<ShelfBook>(predicate: #Predicate { $0.bookID == bookID })
        guard let book = try? context.fetch(descriptor).first else {
            return errorHTML("书架里没有这本书，请先导入")
        }

        guard chapter < book.chapterList.count else { return errorHTML("章节不存在") }
        let chapterRef = book.chapterList[chapter]

        // 取正文
        let text = await loadChapterText(book: book, chapterRef: chapterRef)
        if text.isEmpty { return errorHTML("本章正文为空") }

        // 分页：复用现有排版引擎（1920×1080 车机画布）
        let pages = Paginator.paginate(text, style: .car)
        guard !pages.isEmpty else { return errorHTML("这一章没排版出任何页面") }
        let pageIndex = max(0, min(page ?? 0, pages.count - 1))
        let currentPage = pages[pageIndex]

        let prevHref = pageIndex > 0
            ? "/read?book=\(escape(bookID))&chapter=\(chapter)&page=\(pageIndex - 1)"
            : nil
        let nextHref = pageIndex < pages.count - 1
            ? "/read?book=\(escape(bookID))&chapter=\(chapter)&page=\(pageIndex + 1)"
            : nil

        // 章节列表快速跳转
        let chapterSelect = renderChapterSelect(bookID: bookID, chapters: book.chapterList, current: chapter)

        // 翻页按钮先算好，避免在模板里写嵌套字符串插值
        let prevButton = prevHref.map { "<a class='toolbtn' href='\($0)'>上一页</a>" }
            ?? "<span class='toolbtn disabled'>上一页</span>"
        let nextButton = nextHref.map { "<a class='toolbtn' href='\($0)'>下一页</a>" }
            ?? "<span class='toolbtn disabled'>下一页</span>"

        return wrap(title: "\(book.title) · \(chapterRef.title)", body: """
        <div class="reader">
            <div class="chapter-title">\(escape(chapterRef.title))</div>
            <div class="page-text">\(escape(currentPage.text))</div>
            <div class="page-number">第 \(pageIndex + 1) / \(pages.count) 页</div>
            <div class="nav prev" onclick="location.href='\(prevHref ?? "#")'"></div>
            <div class="nav next" onclick="location.href='\(nextHref ?? "#")'"></div>
        </div>
        <div class="toolbar">
            <a class="toolbtn" href="/">返回书架</a>
            <select onchange="location.href=this.value">\(chapterSelect)</select>
            \(prevButton)
            \(nextButton)
        </div>
        """)
    }

    private func renderChapterSelect(bookID: String, chapters: [ChapterRef], current: Int) -> String {
        var options = ""
        for (i, ch) in chapters.enumerated() {
            let selected = i == current ? " selected" : ""
            options += "<option value=\"/read?book=\(escape(bookID))&chapter=\(i)&page=0\"\(selected)>\(escape(ch.title))</option>"
        }
        return options
    }

    @MainActor
    private func loadChapterText(book: ShelfBook, chapterRef: ChapterRef) async -> String {
        if book.sourceID == "local" {
            return (try? await LocalBookSource().content(bookID: book.remoteID,
                                                           chapterID: chapterRef.chapterID)) ?? ""
        }

        // 在线源：先读缓存，没有再请求
        if let cached = ChapterCache.shared.text(bookID: book.remoteID, chapterID: chapterRef.chapterID),
           !cached.isEmpty {
            return cached
        }

        guard let source = SourceRegistry.shared.source(id: book.sourceID) else { return "" }
        do {
            let text = try await source.content(bookID: book.remoteID, chapterID: chapterRef.chapterID)
            ChapterCache.shared.store(bookID: book.remoteID, chapterID: chapterRef.chapterID, text: text)
            return text
        } catch {
            return ""
        }
    }

    // MARK: - HTML 模板

    private func wrap(title: String, body: String) -> String {
        return """
        <!DOCTYPE html>
        <html lang="zh-CN">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
            <title>\(escape(title))</title>
            <link rel="stylesheet" href="/style.css">
        </head>
        <body>
            \(body)
        </body>
        </html>
        """
    }

    private func errorHTML(_ message: String) -> String {
        wrap(title: "提示", body: """
        <div class="reader">
            <div class="page-text" style="text-align:center; color:#ff6b6b;">\(escape(message))</div>
            <div class="toolbar"><a class="toolbtn" href="/">返回书架</a></div>
        </div>
        """)
    }

    private func notFoundHTML() -> String {
        errorHTML("没有这个页面")
    }

    private func escape(_ s: String) -> String {
        s.replacingOccurrences(of: "&", with: "&amp;")
            .replacingOccurrences(of: "<", with: "&lt;")
            .replacingOccurrences(of: ">", with: "&gt;")
            .replacingOccurrences(of: "\"", with: "&quot;")
    }

    // MARK: - CSS

    private func css() -> String {
        return """
        * { margin: 0; padding: 0; box-sizing: border-box; }
        html, body {
            width: 100%; height: 100%;
            background: #000; color: #fff;
            font-family: -apple-system, "PingFang SC", "Hiragino Sans GB", sans-serif;
            overflow: hidden;
        }

        /* 书架 */
        h1 { font-size: clamp(24px, 5vw, 48px); padding: 4vh 4vw 2vh; font-weight: 600; }
        .book {
            display: block;
            margin: 2vh 4vw;
            padding: 3vh 4vw;
            background: #111;
            border-radius: 16px;
            color: #fff;
            text-decoration: none;
            border: 1px solid #222;
        }
        .book .title { font-size: clamp(18px, 4vw, 36px); margin-bottom: 1vh; }
        .book .meta { font-size: clamp(12px, 2.5vw, 20px); color: #888; }
        .empty { color: #666; text-align: center; margin-top: 20vh; font-size: clamp(14px, 3vw, 24px); }

        /* 阅读器 */
        .reader {
            position: fixed;
            inset: 0;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 6vw;
            padding-bottom: 12vh;
        }
        .chapter-title {
            position: fixed;
            top: 0; left: 0; right: 0;
            padding: 2vh 4vw;
            font-size: clamp(14px, 2.8vw, 28px);
            color: rgba(255,255,255,0.6);
            background: linear-gradient(to bottom, rgba(0,0,0,0.85), rgba(0,0,0,0));
            pointer-events: none;
            z-index: 5;
        }
        .page-text {
            font-size: clamp(28px, 5.5vw, 72px);
            line-height: 1.75;
            text-align: left;
            white-space: pre-wrap;
            max-height: 78vh;
            overflow: hidden;
        }
        .page-number {
            position: fixed;
            bottom: 3vh; left: 0; right: 0;
            text-align: center;
            font-size: clamp(12px, 2.5vw, 22px);
            color: rgba(255,255,255,0.4);
            pointer-events: none;
        }
        .nav {
            position: fixed;
            top: 0; bottom: 0;
            width: 28%;
            z-index: 10;
        }
        .nav.prev { left: 0; }
        .nav.next { right: 0; }

        /* 底部工具栏 */
        .toolbar {
            position: fixed;
            bottom: 0; left: 0; right: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 2vw;
            padding: 1.5vh 3vw;
            background: rgba(20,20,20,0.95);
            border-top: 1px solid #333;
            z-index: 20;
        }
        .toolbtn, .toolbar select {
            background: #222;
            color: #fff;
            border: 1px solid #444;
            border-radius: 10px;
            padding: 1vh 3vw;
            font-size: clamp(12px, 2.5vw, 22px);
            text-decoration: none;
            white-space: nowrap;
        }
        .toolbtn.disabled {
            color: #666;
            background: #1a1a1a;
        }
        .toolbar select {
            max-width: 40vw;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        """
    }
}
