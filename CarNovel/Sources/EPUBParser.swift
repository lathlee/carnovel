import Foundation

// ═══════════════════════════════════════════════════════════════════
//  EPUB 解析器
// ═══════════════════════════════════════════════════════════════════
//
//  EPUB 本质是一个 ZIP，结构：
//    mimetype
//    META-INF/container.xml          → 指向 .opf
//    OEBPS/content.opf               → 书目 + spine（正文顺序）
//    OEBPS/*.xhtml                   → 各章正文
//
//  这里实现最小可用子集：解 container.xml → 读 opf → 按 spine 顺序
//  提取每个 xhtml 的纯文本。不处理加密、不处理 CSS、不处理嵌套 nav。
//
//  没有用第三方 ZIP 库 —— Foundation 的 Archive API 在 iOS 上不可用，
//  所以这里用最朴素的 deflate 解压（EPUB 里除了 mimetype 都是 deflate）。
//  如果你的 EPUB 是纯 store（不压缩）的，也能处理。
//
//  ⚠️ 未实现：EPUB 3 的 nav 目录、加密 EPUB、字体子集。
//  遇到不支持的会退化成"一章到底"，至少能读。

import Compression
import Foundation

enum EPUBParser {

    struct ParsedBook {
        var title: String
        var author: String
        var chapters: [TXTParser.ParsedChapter]
    }

    enum EPUBError: LocalizedError {
        case notAZip
        case missingContainer
        case missingOPF
        case noContent

        var errorDescription: String? {
            switch self {
            case .notAZip: "这个文件不是有效的 EPUB"
            case .missingContainer: "EPUB 缺少 META-INF/container.xml"
            case .missingOPF: "EPUB 缺少 .opf 书目文件"
            case .noContent: "EPUB 里没找到正文"
            }
        }
    }

    static func parse(url: URL) throws -> ParsedBook {
        let scoped = url.startAccessingSecurityScopedResource()
        defer { if scoped { url.stopAccessingSecurityScopedResource() } }

        let data = try Data(contentsOf: url)
        let entries = try unzip(data)

        // 1. container.xml → .opf 路径
        guard let containerData = entries["META-INF/container.xml"],
              let containerXML = String(data: containerData, encoding: .utf8),
              let opfPath = firstAttribute(in: containerXML, tag: "rootfile", attribute: "full-path")
        else {
            throw EPUBError.missingContainer
        }

        // 2. .opf → 书名、作者、spine
        guard let opfData = entries[opfPath],
              let opf = String(data: opfData, encoding: .utf8)
        else {
            throw EPUBError.missingOPF
        }

        let title = firstElementText(in: opf, tag: "dc:title") ?? "未命名"
        let author = firstElementText(in: opf, tag: "dc:creator") ?? ""

        // 3. spine 给出正文顺序（idref 列表），再经 manifest 映射到文件路径
        let manifest = parseManifest(opf)
        let spine = parseSpine(opf)

        let basePath = (opfPath as NSString).deletingLastPathComponent

        var chapters: [TXTParser.ParsedChapter] = []

        for idref in spine {
            guard let href = manifest[idref] else { continue }
            let full = basePath.isEmpty ? href : "\(basePath)/\(href)"
            let normalized = normalizePath(full)

            guard let chapterData = entries[normalized],
                  let html = decodeHTML(chapterData) else { continue }

            let text = stripHTML(html)
            guard !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { continue }

            let heading = firstElementText(in: html, tag: "h1")
                ?? firstElementText(in: html, tag: "h2")
                ?? firstElementText(in: html, tag: "title")
                ?? "第 \(chapters.count + 1) 节"

            chapters.append(TXTParser.ParsedChapter(
                title: clean(heading),
                body: text
            ))
        }

        // spine 拿不到就退化成按 manifest 顺序全读
        if chapters.isEmpty {
            for (_, href) in manifest.sorted(by: { $0.key < $1.key }) {
                let full = basePath.isEmpty ? href : "\(basePath)/\(href)"
                guard let chapterData = entries[normalizePath(full)],
                      let html = decodeHTML(chapterData) else { continue }
                let text = stripHTML(html)
                guard !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { continue }
                chapters.append(TXTParser.ParsedChapter(
                    title: firstElementText(in: html, tag: "title") ?? "第 \(chapters.count + 1) 节",
                    body: text
                ))
            }
        }

        guard !chapters.isEmpty else { throw EPUBError.noContent }

        return ParsedBook(title: clean(title), author: clean(author), chapters: chapters)
    }

    // MARK: - ZIP

    /// 解出 ZIP 里所有文件。只支持 deflate 和 store 两种方式（EPUB 标准要求）。
    private static func unzip(_ data: Data) throws -> [String: Data] {
        guard data.count > 22 else { throw EPUBError.notAZip }

        // 从尾部找 EOCD（End of Central Directory），签名 0x06054b50
        var eocdOffset = -1
        let searchStart = max(0, data.count - 65557)
        var i = data.count - 22
        while i >= searchStart {
            if data[i] == 0x50, data[i+1] == 0x4b, data[i+2] == 0x05, data[i+3] == 0x06 {
                eocdOffset = i
                break
            }
            i -= 1
        }
        guard eocdOffset >= 0 else { throw EPUBError.notAZip }

        let entryCount = Int(data.uint16(at: eocdOffset + 10))
        let cdOffset = Int(data.uint32(at: eocdOffset + 16))

        var files: [String: Data] = [:]
        var cursor = cdOffset

        for _ in 0..<entryCount {
            guard data.uint32(at: cursor) == 0x02014b50 else { break }

            let method = data.uint16(at: cursor + 10)
            let compressedSize = Int(data.uint32(at: cursor + 20))
            let nameLength = Int(data.uint16(at: cursor + 28))
            let extraLength = Int(data.uint16(at: cursor + 30))
            let commentLength = Int(data.uint16(at: cursor + 32))
            let localOffset = Int(data.uint32(at: cursor + 42))

            let nameStart = cursor + 46
            guard let name = String(data: data[nameStart..<nameStart + nameLength],
                                    encoding: .utf8) else {
                cursor = nameStart + nameLength + extraLength + commentLength
                continue
            }

            // 读本地头拿真实数据起点（本地头的 extra 长度可能和中央目录不同）
            let localNameLength = Int(data.uint16(at: localOffset + 26))
            let localExtraLength = Int(data.uint16(at: localOffset + 28))
            let dataStart = localOffset + 30 + localNameLength + localExtraLength

            if compressedSize > 0, dataStart + compressedSize <= data.count {
                let raw = data[dataStart..<dataStart + compressedSize]

                switch method {
                case 0:   // stored
                    files[name] = Data(raw)
                case 8:   // deflate
                    if let inflated = inflate(Data(raw)) {
                        files[name] = inflated
                    }
                default:
                    break
                }
            }

            cursor = nameStart + nameLength + extraLength + commentLength
        }

        return files
    }

    /// raw deflate 解压。EPUB 里的 deflate 是 raw（无 zlib 头），
    /// 用 COMPRESSION_ZLIB 会被 Compression 框架当成 raw 处理。
    private static func inflate(_ data: Data) -> Data? {
        guard !data.isEmpty else { return Data() }

        // 每次尝试的缓冲区大小递增。压缩比高的 xhtml 可能要试几次。
        var capacity = max(data.count * 8, 64 * 1024)
        let limit = 64 * 1024 * 1024

        while capacity <= limit {
            var output = Data(count: capacity)
            let written = output.withUnsafeMutableBytes { outPtr -> Int in
                data.withUnsafeBytes { inPtr -> Int in
                    guard let outBase = outPtr.bindMemory(to: UInt8.self).baseAddress,
                          let inBase = inPtr.bindMemory(to: UInt8.self).baseAddress else { return 0 }
                    return compression_decode_buffer(
                        outBase, capacity,
                        inBase, data.count,
                        nil, COMPRESSION_ZLIB
                    )
                }
            }
            // 正好填满说明可能被截断，加大再试
            if written > 0 && written < capacity {
                output.removeSubrange(written..<output.count)
                return output
            }
            capacity *= 2
        }
        return nil
    }

    // MARK: - XML / HTML 小工具

    private static func parseManifest(_ opf: String) -> [String: String] {
        var map: [String: String] = [:]
        let pattern = #"<item\b[^>]*>"#
        guard let regex = try? NSRegularExpression(pattern: pattern) else { return map }

        let ns = opf as NSString
        for match in regex.matches(in: opf, range: NSRange(location: 0, length: ns.length)) {
            let tag = ns.substring(with: match.range)
            guard let id = firstAttribute(in: tag, tag: "item", attribute: "id"),
                  let href = firstAttribute(in: tag, tag: "item", attribute: "href") else { continue }
            map[id] = href
        }
        return map
    }

    private static func parseSpine(_ opf: String) -> [String] {
        var ids: [String] = []
        let pattern = #"<itemref\b[^>]*>"#
        guard let regex = try? NSRegularExpression(pattern: pattern) else { return ids }

        let ns = opf as NSString
        for match in regex.matches(in: opf, range: NSRange(location: 0, length: ns.length)) {
            let tag = ns.substring(with: match.range)
            if let idref = firstAttribute(in: tag, tag: "itemref", attribute: "idref") {
                ids.append(idref)
            }
        }
        return ids
    }

    /// 从标签里取某个属性的值。容忍单引号和双引号。
    private static func firstAttribute(in xml: String, tag: String, attribute: String) -> String? {
        let pattern = "\(attribute)\\s*=\\s*[\"']([^\"']*)[\"']"
        guard let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        else { return nil }
        let ns = xml as NSString
        guard let match = regex.firstMatch(in: xml, range: NSRange(location: 0, length: ns.length)),
              match.numberOfRanges >= 2 else { return nil }
        return ns.substring(with: match.range(at: 1))
    }

    /// 取某个元素里的文本
    private static func firstElementText(in xml: String, tag: String) -> String? {
        let pattern = "<\(tag)\\b[^>]*>(.*?)</\(tag)>"
        guard let regex = try? NSRegularExpression(pattern: pattern,
                                                   options: [.caseInsensitive, .dotMatchesLineSeparators])
        else { return nil }
        let ns = xml as NSString
        guard let match = regex.firstMatch(in: xml, range: NSRange(location: 0, length: ns.length)),
              match.numberOfRanges >= 2 else { return nil }
        let inner = ns.substring(with: match.range(at: 1))
        let plain = stripHTML(inner)
        return plain.isEmpty ? nil : plain
    }

    /// 去标签、解实体、压空白，得到可读纯文本
    static func stripHTML(_ html: String) -> String {
        var text = html

        // 去掉 script / style 整块
        for tag in ["script", "style", "head"] {
            let pattern = "<\(tag)\\b[^>]*>.*?</\(tag)>"
            text = text.replacingOccurrences(of: pattern,
                                             with: " ",
                                             options: [.regularExpression, .caseInsensitive])
        }

        // 块级标签换成换行，保住段落
        text = text.replacingOccurrences(
            of: "</?(p|div|br|h[1-6]|li|tr|section|article)\\b[^>]*>",
            with: "\n",
            options: [.regularExpression, .caseInsensitive]
        )

        // 其余标签直接去
        text = text.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression)

        // 实体
        let entities = [
            "&nbsp;": " ", "&amp;": "&", "&lt;": "<", "&gt;": ">",
            "&quot;": "\"", "&#39;": "'", "&apos;": "'", "&mdash;": "—",
            "&ldquo;": "\u{201C}", "&rdquo;": "\u{201D}",
            "&hellip;": "…", "&middot;": "·",
        ]
        for (entity, replacement) in entities {
            text = text.replacingOccurrences(of: entity, with: replacement)
        }

        // 数字实体 &#12345;
        if let regex = try? NSRegularExpression(pattern: "&#(\\d+);") {
            let ns = text as NSString
            let matches = regex.matches(in: text, range: NSRange(location: 0, length: ns.length))
            for match in matches.reversed() where match.numberOfRanges >= 2 {
                if let code = UInt32(ns.substring(with: match.range(at: 1))),
                   let scalar = UnicodeScalar(code) {
                    text = (text as NSString).replacingCharacters(
                        in: match.range, with: String(Character(scalar))
                    )
                }
            }
        }

        // 压空白：连续空行合并，行首尾去空格
        let lines = text
            .replacingOccurrences(of: "\r\n", with: "\n")
            .split(separator: "\n", omittingEmptySubsequences: false)
            .map { $0.trimmingCharacters(in: .whitespaces) }

        var out: [String] = []
        var lastWasEmpty = false
        for line in lines {
            if line.isEmpty {
                if !lastWasEmpty { out.append("") }
                lastWasEmpty = true
            } else {
                out.append(line)
                lastWasEmpty = false
            }
        }

        return out.joined(separator: "\n").trimmingCharacters(in: .whitespacesAndNewlines)
    }

    private static func decodeHTML(_ data: Data) -> String? {
        if let text = String(data: data, encoding: .utf8) { return text }
        return try? TXTParser.decode(data)
    }

    private static func normalizePath(_ path: String) -> String {
        // 去掉 ./ 和 重复斜杠
        var parts: [String] = []
        for component in path.split(separator: "/") {
            switch component {
            case ".": continue
            case "..": if !parts.isEmpty { parts.removeLast() }
            default: parts.append(String(component))
            }
        }
        return parts.joined(separator: "/")
    }

    private static func clean(_ text: String) -> String {
        text.trimmingCharacters(in: .whitespacesAndNewlines)
            .replacingOccurrences(of: "\n", with: " ")
    }
}

// MARK: - 小端读取

private extension Data {
    func uint16(at offset: Int) -> UInt16 {
        guard offset + 2 <= count else { return 0 }
        return withUnsafeBytes { raw in
            UInt16(raw[offset]) | (UInt16(raw[offset + 1]) << 8)
        }
    }

    func uint32(at offset: Int) -> UInt32 {
        guard offset + 4 <= count else { return 0 }
        return withUnsafeBytes { raw in
            UInt32(raw[offset])
                | (UInt32(raw[offset + 1]) << 8)
                | (UInt32(raw[offset + 2]) << 16)
                | (UInt32(raw[offset + 3]) << 24)
        }
    }
}
