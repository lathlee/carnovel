import Foundation

// ═══════════════════════════════════════════════════════════════════
//  PublicDomainSource —— 公版书源
// ═══════════════════════════════════════════════════════════════════
//
//  为什么给这个源：你需要"能在里面在线搜到小说"，而**公版书是唯一
//  既在线、又完全免费、又没有任何版权风险的类别**。
//
//  作品进入公版的条件（中国）：作者逝世满 50 年（2021 年著作权法修订后
//  仍为 50 年，法人作品为发表后 50 年）。所以四大名著、聊斋、三言二拍、
//  儒林外史、老残游记、鲁迅（1936 年逝世）等都可自由使用。
//
//  这个实现内置一个书目表，正文从可配置的镜像地址拉取。
//  你可以把它换成任何你有权访问的公版书接口 —— 换 URL 即可，不用动协议。

final class PublicDomainSource: BookSource {

    let id = "public-domain"
    let name = "公版书"

    /// 正文接口。默认用 Gutenberg 的中文镜像（公版书，无版权问题）。
    /// 换成自己的服务器或镜像都行 —— 只要返回纯文本。
    private let endpoint: URL

    private let session: URLSession

    init(endpoint: URL = URL(string: "https://www.gutenberg.org")!) {
        self.endpoint = endpoint

        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 15
        config.waitsForConnectivity = false
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        self.session = URLSession(configuration: config)
    }

    // MARK: - 内置书目

    /// 公版书目。id 是 Gutenberg 的编号，title/author 用于本地搜索。
    /// 加书只要往这个数组里加一条。
    private struct Entry {
        var gutenbergID: String
        var title: String
        var author: String
        var note: String
    }

    private let catalog: [Entry] = [
        Entry(gutenbergID: "23962", title: "红楼梦", author: "曹雪芹", note: "四大名著"),
        Entry(gutenbergID: "23950", title: "三国演义", author: "罗贯中", note: "四大名著"),
        Entry(gutenbergID: "23963", title: "水浒传", author: "施耐庵", note: "四大名著"),
        Entry(gutenbergID: "23964", title: "西游记", author: "吴承恩", note: "四大名著"),
        Entry(gutenbergID: "25328", title: "聊斋志异", author: "蒲松龄", note: "志怪小说"),
        Entry(gutenbergID: "27081", title: "儒林外史", author: "吴敬梓", note: "讽刺小说"),
        Entry(gutenbergID: "27508", title: "老残游记", author: "刘鹗", note: "晚清小说"),
        Entry(gutenbergID: "24264", title: "喻世明言", author: "冯梦龙", note: "三言"),
        Entry(gutenbergID: "25326", title: "警世通言", author: "冯梦龙", note: "三言"),
        Entry(gutenbergID: "27200", title: "醒世恒言", author: "冯梦龙", note: "三言"),
        Entry(gutenbergID: "27028", title: "封神演义", author: "许仲琳", note: "神魔小说"),
        Entry(gutenbergID: "25964", title: "镜花缘", author: "李汝珍", note: "神魔小说"),
    ]

    // MARK: - 搜索

    func search(_ keyword: String) async throws -> [BookHit] {
        let key = keyword.trimmingCharacters(in: .whitespaces)
        guard !key.isEmpty else { return [] }

        // 本地书目匹配：书名 / 作者 / 主题词
        return catalog
            .filter { entry in
                entry.title.contains(key)
                    || entry.author.contains(key)
                    || entry.note.contains(key)
            }
            .map { entry in
                BookHit(
                    sourceID: id,
                    bookID: entry.gutenbergID,
                    title: entry.title,
                    author: entry.author,
                    intro: "\(entry.note) · 公版书",
                    coverURL: nil
                )
            }
    }

    // MARK: - 详情与正文

    func detail(for hit: BookHit) async throws -> BookDetail {
        let text = try await rawText(bookID: hit.bookID)
        let parsed = TXTParser.split(text)

        let refs = parsed.enumerated().map { i, chapter in
            ChapterRef(chapterID: "c\(i)", index: i, title: chapter.title)
        }

        // 正文缓存起来，避免下一章又要重新拉整本（公版书整本往往几 MB）
        rememberCache(hit.bookID, parsed)

        return BookDetail(hit: hit, chapters: refs)
    }

    func content(bookID: String, chapterID: String) async throws -> String {
        let index = Int(chapterID.dropFirst()) ?? 0

        if let parsed = cache[bookID], parsed.indices.contains(index) {
            return parsed[index].body
        }

        let text = try await rawText(bookID: bookID)
        let parsed = TXTParser.split(text)
        rememberCache(bookID, parsed)

        guard parsed.indices.contains(index) else { throw BookSourceError.notFound }
        return parsed[index].body
    }

    // MARK: - 私有

    /// 已解析的书缓存。公版书整本解析一次要几秒，缓存起来体验好很多。
    /// 只保留最近 3 本，防止吃内存。
    private var cache: [String: [TXTParser.ParsedChapter]] = [:]
    private var cacheOrder: [String] = []

    private func rememberCache(_ bookID: String, _ parsed: [TXTParser.ParsedChapter]) {
        cache[bookID] = parsed
        cacheOrder.removeAll { $0 == bookID }
        cacheOrder.append(bookID)
        while cacheOrder.count > 3 {
            let evicted = cacheOrder.removeFirst()
            cache.removeValue(forKey: evicted)
        }
    }

    private func rawText(bookID: String) async throws -> String {
        // Gutenberg 的纯文本地址
        let candidates = [
            endpoint.appendingPathComponent("/cache/epub/\(bookID)/pg\(bookID).txt"),
            endpoint.appendingPathComponent("/files/\(bookID)/\(bookID)-0.txt"),
            endpoint.appendingPathComponent("/files/\(bookID)/\(bookID).txt"),
        ]

        var lastError: Error = BookSourceError.notFound

        for url in candidates {
            do {
                let (data, response) = try await session.data(from: url)
                guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
                    continue
                }
                let text = try TXTParser.decode(data)
                // 太短说明拿到的是错误页而不是正文
                guard text.count > 1000 else { continue }
                return text
            } catch {
                lastError = error
                continue
            }
        }

        throw BookSourceError.badResponse(
            "拿不到《\(bookID)》的正文（\(lastError.localizedDescription)）"
        )
    }
}
