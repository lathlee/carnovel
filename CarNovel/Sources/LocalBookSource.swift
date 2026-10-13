import Foundation

// ═══════════════════════════════════════════════════════════════════
//  LocalBookSource —— 本地 TXT / EPUB 导入
// ═══════════════════════════════════════════════════════════════════
//
//  这是最推荐的使用方式：离线、零法律风险、速度最快。
//
//  实现要点：
//  - 导入时**一次性**解析并切章，把章节切分结果落盘成 JSON
//    这样每次打开书不用重新解析 15MB 的 TXT（省电、秒开）
//  - 正文按需读取：只在打开某一章时把那一章的文本载进内存
//    一本 797 万字的书不可能全塞进内存
//
//  存储布局（Documents/Books/）：
//    <hash>.txt          原始文本（转成 UTF-8 保存，统一编码）
//    <hash>.chapters.json 章节目录 + 每章的字符区间
//    <hash>.meta.json     书名/作者/导入时间

final class LocalBookSource: BookSource {

    let id = "local"
    let name = "本地导入"
    let supportsSearch = false

    private let root: URL

    init() {
        let docs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        root = docs.appendingPathComponent("Books", isDirectory: true)
        try? FileManager.default.createDirectory(at: root, withIntermediateDirectories: true)
    }

    /// 本地源不参与搜索 —— 书架里的书直接列出来就行
    func search(_ keyword: String) async throws -> [BookHit] {
        throw BookSourceError.notSupported
    }

    // MARK: - 导入

    struct ImportResult {
        var bookID: String
        var title: String
        var author: String
        var chapters: [ChapterRef]
        var textPath: String
    }

    /// 导入一个 TXT 文件。会做编码探测 + 切章 + 落盘。
    func importTXT(from url: URL) async throws -> ImportResult {
        // 从"文件"App 选进来的文件要先拷到自己沙盒里，否则随时可能被系统回收
        let scoped = url.startAccessingSecurityScopedResource()
        defer { if scoped { url.stopAccessingSecurityScopedResource() } }

        let data = try Data(contentsOf: url)
        let text = try TXTParser.decode(data)

        let parsed = TXTParser.split(text)
        guard !parsed.isEmpty else {
            throw BookSourceError.badResponse("这个文件里没解析出任何正文")
        }

        let hash = stableHash(url.lastPathComponent + String(text.count))
        let textURL = root.appendingPathComponent("\(hash).txt")
        let indexURL = root.appendingPathComponent("\(hash).chapters.json")
        let metaURL = root.appendingPathComponent("\(hash).meta.json")

        // 统一以 UTF-8 落盘，后续读取不用再猜编码
        try text.write(to: textURL, atomically: true, encoding: .utf8)

        // 章节目录 + 字符区间，避免每次重新解析
        var refs: [ChapterRef] = []
        var index: [ChapterIndexEntry] = []
        var cursor = 0

        for (i, chapter) in parsed.enumerated() {
            let chapterID = "c\(i)"
            refs.append(ChapterRef(chapterID: chapterID, index: i, title: chapter.title))
            index.append(ChapterIndexEntry(
                chapterID: chapterID,
                title: chapter.title,
                location: cursor,
                length: chapter.body.utf16.count
            ))
            cursor += chapter.body.utf16.count
        }

        // 正文按章存储：每个章存成独立文件，读取时只载入一章。
        // 797 万字的书如果整块存，读一章要把整个文件读进内存，太浪费。
        let bodiesDir = root.appendingPathComponent("\(hash).bodies", isDirectory: true)
        try? FileManager.default.createDirectory(at: bodiesDir, withIntermediateDirectories: true)
        for (i, chapter) in parsed.enumerated() {
            let bodyURL = bodiesDir.appendingPathComponent("c\(i).txt")
            try chapter.body.write(to: bodyURL, atomically: true, encoding: .utf8)
        }

        try JSONEncoder().encode(index).write(to: indexURL)

        let meta = ImportMeta(
            bookID: hash,
            title: guessTitle(from: url, firstChapter: parsed.first?.title),
            author: guessAuthor(from: text),
            importedAt: Date(),
            chapterCount: parsed.count,
            charCount: text.count
        )
        try JSONEncoder().encode(meta).write(to: metaURL)

        return ImportResult(
            bookID: hash,
            title: meta.title,
            author: meta.author,
            chapters: refs,
            textPath: "\(hash).txt"
        )
    }

    /// 把已经解析好的章节直接落盘（EPUB 走这条路，解析器不同但存储结构一样）
    func storeParsed(title: String, author: String,
                     chapters: [TXTParser.ParsedChapter],
                     originName: String) throws -> ImportResult {
        guard !chapters.isEmpty else {
            throw BookSourceError.badResponse("没有可存储的章节")
        }

        let hash = stableHash(originName + String(chapters.count) + title)
        let indexURL = root.appendingPathComponent("\(hash).chapters.json")
        let metaURL = root.appendingPathComponent("\(hash).meta.json")

        var refs: [ChapterRef] = []
        var index: [ChapterIndexEntry] = []
        var cursor = 0

        let bodiesDir = root.appendingPathComponent("\(hash).bodies", isDirectory: true)
        try? FileManager.default.createDirectory(at: bodiesDir, withIntermediateDirectories: true)

        for (i, chapter) in chapters.enumerated() {
            let chapterID = "c\(i)"
            refs.append(ChapterRef(chapterID: chapterID, index: i, title: chapter.title))
            index.append(ChapterIndexEntry(
                chapterID: chapterID,
                title: chapter.title,
                location: cursor,
                length: chapter.body.utf16.count
            ))
            cursor += chapter.body.utf16.count

            let bodyURL = bodiesDir.appendingPathComponent("c\(i).txt")
            try chapter.body.write(to: bodyURL, atomically: true, encoding: .utf8)
        }

        try JSONEncoder().encode(index).write(to: indexURL)

        let meta = ImportMeta(
            bookID: hash,
            title: title.isEmpty ? originName : title,
            author: author,
            importedAt: Date(),
            chapterCount: chapters.count,
            charCount: cursor
        )
        try JSONEncoder().encode(meta).write(to: metaURL)

        return ImportResult(
            bookID: hash,
            title: meta.title,
            author: meta.author,
            chapters: refs,
            textPath: ""
        )
    }

    // MARK: - 读取

    func detail(for hit: BookHit) async throws -> BookDetail {
        let index = try loadIndex(hit.bookID)
        let refs = index.enumerated().map { i, entry in
            ChapterRef(chapterID: entry.chapterID, index: i, title: entry.title)
        }
        return BookDetail(hit: hit, chapters: refs)
    }

    func content(bookID: String, chapterID: String) async throws -> String {
        let url = root
            .appendingPathComponent("\(bookID).bodies", isDirectory: true)
            .appendingPathComponent("\(chapterID).txt")
        guard let text = try? String(contentsOf: url, encoding: .utf8) else {
            throw BookSourceError.notFound
        }
        return text
    }

    /// 本地书直接列出来（不走搜索）
    func allBooks() -> [BookHit] {
        guard let files = try? FileManager.default.contentsOfDirectory(
            at: root, includingPropertiesForKeys: nil
        ) else { return [] }

        return files
            .filter { $0.lastPathComponent.hasSuffix(".meta.json") }
            .compactMap { url -> BookHit? in
                guard let data = try? Data(contentsOf: url),
                      let meta = try? JSONDecoder().decode(ImportMeta.self, from: data)
                else { return nil }
                return BookHit(
                    sourceID: id,
                    bookID: meta.bookID,
                    title: meta.title,
                    author: meta.author,
                    intro: "\(meta.chapterCount) 章 · \(meta.charCount / 10000) 万字",
                    coverURL: nil
                )
            }
            .sorted { $0.title < $1.title }
    }

    func delete(bookID: String) {
        let fm = FileManager.default
        guard let files = try? fm.contentsOfDirectory(at: root, includingPropertiesForKeys: nil)
        else { return }
        for file in files where file.lastPathComponent.hasPrefix("\(bookID).") {
            try? fm.removeItem(at: file)
        }
    }

    // MARK: - 私有

    private func loadMeta(_ bookID: String) throws -> ImportMeta {
        let url = root.appendingPathComponent("\(bookID).meta.json")
        guard let data = try? Data(contentsOf: url),
              let meta = try? JSONDecoder().decode(ImportMeta.self, from: data) else {
            throw BookSourceError.notFound
        }
        return meta
    }

    private func loadIndex(_ bookID: String) throws -> [ChapterIndexEntry] {
        let url = root.appendingPathComponent("\(bookID).chapters.json")
        guard let data = try? Data(contentsOf: url),
              let index = try? JSONDecoder().decode([ChapterIndexEntry].self, from: data) else {
            throw BookSourceError.notFound
        }
        return index
    }

    /// 从文件名或首章猜书名
    private func guessTitle(from url: URL, firstChapter: String?) -> String {
        let base = url.deletingPathExtension().lastPathComponent
        // 文件名像书名就用文件名
        if base.count >= 2 && base.count <= 30 {
            return base
        }
        return firstChapter ?? "未命名"
    }

    /// 从卷首猜作者
    private func guessAuthor(from text: String) -> String {
        let head = String(text.prefix(500))
        let patterns = [#"作者[：:]\s*(\S+)"#, #"著[者]?[：:]\s*(\S+)"#]
        for pattern in patterns {
            if let regex = try? NSRegularExpression(pattern: pattern),
               let match = regex.firstMatch(in: head,
                                            range: NSRange(head.startIndex..., in: head)),
               match.numberOfRanges >= 2,
               let range = Range(match.range(at: 1), in: head) {
                return String(head[range])
            }
        }
        return ""
    }

    /// 简单稳定哈希（FNV-1a），不追求密码学强度，只要同名文件稳定一致
    private func stableHash(_ string: String) -> String {
        var hash: UInt64 = 0xcbf29ce484222325
        for byte in string.utf8 {
            hash ^= UInt64(byte)
            hash = hash &* 0x100000001b3
        }
        return String(hash, radix: 16)
    }

    // MARK: - 落盘结构

    struct ChapterIndexEntry: Codable {
        var chapterID: String
        var title: String
        var location: Int
        var length: Int
    }

    struct ImportMeta: Codable {
        var bookID: String
        var title: String
        var author: String
        var importedAt: Date
        var chapterCount: Int
        var charCount: Int
    }
}
