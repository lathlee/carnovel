import Foundation

// ═══════════════════════════════════════════════════════════════════
//  TXT 解析器 —— 本地导入的核心
// ═══════════════════════════════════════════════════════════════════
//
//  中文小说 TXT 的两个必踩坑：
//    1. **编码**：大量老 TXT 是 GB18030 而非 UTF-8。直接按 UTF-8 读会全是乱码。
//       （《凡人修仙传》那个 15MB 的文件就是 GB18030。）
//    2. **章节切分**：章名格式五花八门，得用一串正则去试，
//       而且不能只认"第X章"——有些是"第X节""Chapter X"，甚至只有卷名。
//
//  解析原则：**宁少切、不误切**。切错一章只是导航难看，
//  但要是在正文里误判出一个"章节"，阅读就断了。所以正则要求章名独立成行。

enum TXTParser {

    /// 章节标记正则。**必须和卷标记分开** ——
    ///
    /// 原因：很多 TXT 里「卷名」也独立成行（`第十卷` / `第二卷`）。
    /// 如果章和卷用同一套正则，卷标记会被当成章节切出来，
    /// 结果是章数虚高、正文被切碎。
    /// 实测《凡人修仙传》：合并匹配得到 2495 条，分开后是 1554 条 —— 差 941 条全是卷。
    private static let chapterPatterns: [String] = [
        // 第1章 / 第一章 / 第一百二十三章，允许后面紧跟标题文字
        #"^第\s*[0-9０-９一二三四五六七八九十百千万零两]+\s*[章回节]\s*[:：.、]?\s*\S*$"#,
        // 正文 第一章 标题（带"正文"前缀）
        #"^正文\s*第\s*[0-9０-９一二三四五六七八九十百千万零两]+\s*[章回节卷篇].*$"#,
        // Chapter 12
        #"^Chapter\s+\d+.*$"#,
    ]

    /// 卷标记正则。只在**整本书一个章标记都没有**时才退而求其次用它。
    private static let volumePatterns: [String] = [
        #"^第\s*[0-9０-９一二三四五六七八九十百千万零两]+\s*[卷篇]\s*[:：.、]?\s*\S*$"#,
        #"^[卷篇]\s*[0-9０-９一二三四五六七八九十百千万零两]+.*$"#,
    ]

    private static func compile(_ patterns: [String]) -> [NSRegularExpression] {
        patterns.compactMap { try? NSRegularExpression(pattern: $0, options: [.anchorsMatchLines]) }
    }

    private static let chapterRegexes = compile(chapterPatterns)
    private static let volumeRegexes = compile(volumePatterns)

    /// 常见编码，按"中文小说出现概率"排序
    private static let encodings: [String.Encoding] = [
        .utf8,
        String.Encoding(rawValue: CFStringConvertEncodingToNSStringEncoding(
            CFStringEncoding(CFStringEncodings.GB_18030_2000.rawValue))),
        String.Encoding(rawValue: CFStringConvertEncodingToNSStringEncoding(
            CFStringEncoding(CFStringEncodings.big5.rawValue))),
        .utf16,
    ]

    // MARK: - 解码

    /// 自动探测编码并解码。先看 BOM，再逐个试。
    static func decode(_ data: Data) throws -> String {
        // BOM 优先，最可靠
        let boms: [(prefix: [UInt8], encoding: String.Encoding)] = [
            ([0xEF, 0xBB, 0xBF], .utf8),
            ([0xFF, 0xFE], .utf16LittleEndian),
            ([0xFE, 0xFF], .utf16BigEndian),
        ]
        for bom in boms where data.starts(with: bom.prefix) {
            if let text = String(data: data, encoding: bom.encoding) {
                return text
            }
        }

        // 没有 BOM：逐个试，取"解码后替换字符最少"的那个。
        // 只看"能不能解"是不够的 —— GB18030 几乎能解任何字节序列，会解出一堆乱码。
        var best: (text: String, badness: Double) = ("", .infinity)

        for encoding in encodings {
            guard let text = String(data: data, encoding: encoding) else { continue }
            let badness = badRatio(text)
            if badness < best.badness {
                best = (text, badness)
            }
            if badness < 0.001 { break }   // 已经足够干净，不用再试
        }

        guard best.badness < .infinity else {
            throw BookSourceError.badResponse("无法识别文本编码")
        }
        return best.text
    }

    /// 乱码字符占比。U+FFFD 是解码失败的替换符；
    /// C0/C1 控制符和私用区大量出现也说明解错了。
    private static func badRatio(_ text: String) -> Double {
        guard !text.isEmpty else { return 1 }
        var bad = 0
        var checked = 0
        for scalar in text.unicodeScalars {
            checked += 1
            if checked > 5000 { break }   // 采样前 5000 个字符够了
            switch scalar.value {
            case 0xFFFD:                 bad += 1
            case 0x00...0x08, 0x0B, 0x0E...0x1F, 0x7F...0x9F:
                bad += 1
            case 0xE000...0xF8FF:        bad += 1   // 私用区
            default: break
            }
        }
        return checked == 0 ? 1 : Double(bad) / Double(checked)
    }

    // MARK: - 切分

    struct ParsedChapter {
        var title: String
        var body: String
    }

    /// 从章名里抽出"章号"，用于识别重复标记。
    ///
    /// 真实的 TXT 里同一个章经常出现两次：
    ///     第六卷通天灵宝第九百九十一章紫雾     ← 卷名+章号连写
    ///     第九百九十一章紫雾                    ← 纯章号
    /// 两条都被匹配到的话，中间夹的内容（书名、广告行）会被切成一个空章。
    /// 用章号识别出重复，只保留最后一条（正文在它后面）。
    ///
    /// ★ 关键：必须取**最后一个**「第X章」——
    ///   上面第一行里既有「第六卷」又有「第九百九十一章」，
    ///   只取第一个数字会拿到卷号 6，跟第二行的 991 对不上。
    private static func chapterKey(_ title: String) -> String? {
        if let key = extractChapterKey(title, requiringPrefix: true) {
            return key
        }
        // 兜底：源文件里有些章名把"第"字丢了（"一千九百零六章"），
        // 严格模式抓不到，放宽再试一次。
        return extractChapterKey(title, requiringPrefix: false)
    }

    private static func extractChapterKey(_ title: String,
                                          requiringPrefix: Bool) -> String? {
        let pattern = requiringPrefix
            ? #"第\s*([0-9０-９]+|[一二三四五六七八九十百千万零两]+)\s*[章回节]"#
            : #"([0-9０-９]{1,4}|[一二三四五六七八九十百千万零两]{1,10})\s*[章回节]"#

        guard let regex = try? NSRegularExpression(pattern: pattern) else { return nil }
        let ns = title as NSString
        let matches = regex.matches(in: title,
                                    range: NSRange(location: 0, length: ns.length))
        guard let last = matches.last, last.numberOfRanges >= 2 else { return nil }
        return normalizeNumber(ns.substring(with: last.range(at: 1)))
    }

    /// 阿拉伯数字和中文数字统一成同一个字符串，便于比较。
    /// "第2151章" 和 "第两千一百五十一章" 会被归成同一个 key。
    private static func normalizeNumber(_ raw: String) -> String {
        let trimmed = raw.trimmingCharacters(in: .whitespaces)

        if let value = Int(trimmed) {
            return String(value)
        }

        // 全角数字先转半角
        let half = String(trimmed.map { ch -> Character in
            guard let v = ch.wholeNumberValue, ch.isNumber, ch.isWholeNumber,
                  let scalar = UnicodeScalar(0x30 + v) else { return ch }
            return Character(scalar)
        })
        if let value = Int(half) { return String(value) }

        // 中文数字
        if let value = parseChineseNumber(trimmed) { return String(value) }
        return trimmed
    }

    /// 中文数字 → Int。只处理到万位，够用了。
    /// 十一 → 11，二十 → 20，一百零八 → 108，两千四百四十四 → 2444
    private static func parseChineseNumber(_ s: String) -> Int? {
        let digits: [Character: Int] = [
            "零": 0, "一": 1, "二": 2, "两": 2, "三": 3, "四": 4,
            "五": 5, "六": 6, "七": 7, "八": 8, "九": 9,
        ]
        let units: [Character: Int] = ["十": 10, "百": 100, "千": 1000]

        var total = 0
        var section = 0
        var current = 0
        var sawAny = false

        for ch in s {
            if let d = digits[ch] {
                current = d
                sawAny = true
            } else if let u = units[ch] {
                // "十一" 里的前导"十"要当成"一十"
                section += (current == 0 ? 1 : current) * u
                current = 0
                sawAny = true
            } else if ch == "万" {
                section = (section + current) * 10_000
                total += section
                section = 0
                current = 0
                sawAny = true
            } else {
                return nil
            }
        }

        guard sawAny else { return nil }
        return total + section + current
    }

    /// 把整本书正文切成章节。切不出章节就返回单章。
    static func split(_ text: String) -> [ParsedChapter] {
        // 统一换行，去掉 BOM 和零宽字符
        let normalized = text
            .replacingOccurrences(of: "\r\n", with: "\n")
            .replacingOccurrences(of: "\r", with: "\n")
            .replacingOccurrences(of: "\u{FEFF}", with: "")
            .replacingOccurrences(of: "\u{200B}", with: "")

        let lines = normalized.split(separator: "\n", omittingEmptySubsequences: false)
            .map { $0.trimmingCharacters(in: .whitespaces) }

        // 找所有候选标记行。章名不能太长（超过 40 字基本是正文）。
        func scan(_ regexes: [NSRegularExpression]) -> [Int] {
            var hits: [Int] = []
            for (index, line) in lines.enumerated() {
                guard !line.isEmpty, line.count <= 40 else { continue }
                let range = NSRange(line.startIndex..., in: line)
                if regexes.contains(where: { $0.firstMatch(in: line, range: range) != nil }) {
                    hits.append(index)
                }
            }
            return hits
        }

        // ★ 优先用章标记。只有整本书一个章标记都没有时，才退回卷标记
        //   （有些短篇只有卷没有章）。绝不混用 —— 混用会切出一堆伪章节。
        let chapterHits = scan(chapterRegexes)
        let volumeHits = scan(volumeRegexes)
        var marks = chapterHits.count >= 3 ? chapterHits : Array(Set(chapterHits + volumeHits)).sorted()

        marks = dedupe(marks, lines: lines)

        guard marks.count >= 2 else {
            // 切不出来就当一整章，至少能读
            let body = lines.joined(separator: "\n")
                .trimmingCharacters(in: .whitespacesAndNewlines)
            return body.isEmpty ? [] : [ParsedChapter(title: "正文", body: body)]
        }

        var result: [ParsedChapter] = []

        // 首个章节标记之前的内容（书名、作者、简介）。
        // 只在够长时才单列一章 —— 通常只有两三行，单独成章体验很差。
        if marks[0] > 0 {
            let head = lines[0..<marks[0]].joined(separator: "\n")
                .trimmingCharacters(in: .whitespacesAndNewlines)
            if head.count >= stubThreshold * 2 {
                result.append(ParsedChapter(title: "卷首", body: head))
            }
        }

        for (n, start) in marks.enumerated() {
            let end = n + 1 < marks.count ? marks[n + 1] : lines.count
            let title = lines[start]
            let body = lines[(start + 1)..<end]
                .joined(separator: "\n")
                .trimmingCharacters(in: .whitespacesAndNewlines)
            result.append(ParsedChapter(title: title, body: body))
        }

        return splitOverlong(mergeStubs(result))
    }

    /// 兜底：把空章 / 极短章合并进上一章。
    ///
    /// 为什么需要这一步：源文件里的脏数据无法靠正则穷举。实测《凡人修仙传》
    /// 那个 TXT 里就同时有这几种情况：
    ///   - 章名把"第"字丢了：`第十卷魔界之战一千九百零六章`
    ///   - 同一个章名连写两遍
    ///   - 卷名单独占一行：`第十卷` / `魔界之战` 各一行
    ///
    /// 正则修不完这种问题，而且换一本书又会有新的脏法。
    /// 所以不追求"切得完美"，只保证**阅读不断**：
    /// 正文太短的章直接并进上一章，读者感觉不到。
    ///
    /// 阈值 80 字：正常章节不可能少于这个（实测最小 1419 字），
    /// 而漏切的残渣通常只有几字到几十字。
    private static let stubThreshold = 80

    private static func mergeStubs(_ chapters: [ParsedChapter]) -> [ParsedChapter] {
        var out: [ParsedChapter] = []

        for chapter in chapters {
            let isStub = chapter.body.count < stubThreshold

            if isStub, !out.isEmpty {
                // 并进上一章：标题丢掉（它本来就是脏数据），正文接上去
                let extra = chapter.body.isEmpty ? "" : "\n" + chapter.body
                out[out.count - 1].body += extra
            } else {
                out.append(chapter)
            }
        }

        return out
    }

    /// 兜底：超长章按字数再切。
    ///
    /// 《凡人修仙传》那个 TXT 有整段缺章名标记的情况 ——
    /// `第一千九百零八章` 之后直接跳到 `第一千九百八十章`，中间 72 章没有标记，
    /// 全被算成同一章（实测最大 94.9 万字）。这是源文件本身残缺，正则救不了。
    ///
    /// 处理方式：超过 maxChars 就按段落边界切成多块，后续块标"（续）"。
    /// 这样至少每块大小适合阅读和生成视频，不会一"章"要渲染几千页。
    private static let maxCharsPerChapter = 12_000

    private static func splitOverlong(_ chapters: [ParsedChapter]) -> [ParsedChapter] {
        var out: [ParsedChapter] = []

        for chapter in chapters {
            // 极短的开头（如"卷首"）不单独成章，接进上一章
            if chapter.body.count < stubThreshold, !out.isEmpty {
                if !chapter.body.isEmpty {
                    out[out.count - 1].body += "\n" + chapter.body
                }
                continue
            }

            guard chapter.body.count > maxCharsPerChapter else {
                out.append(chapter)
                continue
            }

            // 按段落切，尽量在段落边界断开
            let paragraphs = chapter.body
                .split(separator: "\n", omittingEmptySubsequences: false)
                .map(String.init)

            var buffer = ""
            var part = 1

            func flush() {
                guard !buffer.isEmpty else { return }
                let title = part == 1 ? chapter.title : "\(chapter.title)（续 \(part)）"
                out.append(ParsedChapter(title: title, body: buffer))
                part += 1
                buffer = ""
            }

            for paragraph in paragraphs {
                // 单个段落就超限的极端情况：硬切
                if paragraph.count > maxCharsPerChapter {
                    flush()
                    let chars = Array(paragraph)
                    var offset = 0
                    while offset < chars.count {
                        let end = min(offset + maxCharsPerChapter, chars.count)
                        buffer = String(chars[offset..<end])
                        flush()
                        offset = end
                    }
                    continue
                }

                if buffer.count + paragraph.count + 1 > maxCharsPerChapter {
                    flush()
                }
                buffer += (buffer.isEmpty ? "" : "\n") + paragraph
            }
            flush()
        }

        return out
    }

    /// 去掉重复的章节标记：同一章号连续出现时，只保留最后一个。
    ///
    /// 只在"两条标记之间正文极少"时才合并 —— 否则会把正文里
    /// 引用章名的句子误判成标记（那种情况两标记之间是长正文）。
    private static func dedupe(_ marks: [Int], lines: [String]) -> [Int] {
        guard marks.count > 1 else { return marks }

        func bodyLength(from start: Int, to end: Int) -> Int {
            guard start + 1 < end else { return 0 }
            return lines[(start + 1)..<end].reduce(0) { $0 + $1.count }
        }

        var kept: [Int] = [marks[0]]

        for i in 1..<marks.count {
            let prev = kept[kept.count - 1]
            let cur = marks[i]

            let emptyGap = bodyLength(from: prev, to: cur) < 40
            let sameChapter: Bool = {
                guard let a = chapterKey(lines[prev]),
                      let b = chapterKey(lines[cur]) else { return false }
                return a == b
            }()

            if emptyGap && sameChapter {
                // 前一条是"卷名+章号"的重复标记，丢它，改用当前这条
                kept[kept.count - 1] = cur
            } else {
                kept.append(cur)
            }
        }
        return kept
    }
}
