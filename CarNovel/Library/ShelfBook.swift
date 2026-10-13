import Foundation
import SwiftData

// ═══════════════════════════════════════════════════════════════════
//  书架数据模型（SwiftData）
// ═══════════════════════════════════════════════════════════════════

/// 书架上的书
@Model
final class ShelfBook {

    /// 稳定主键。本地导入的用文件路径哈希，在线源用 sourceID::bookID
    @Attribute(.unique) var bookID: String

    var title: String
    var author: String
    var intro: String?

    /// 来自哪个源（BookSource.id）。本地导入是 "local"
    var sourceID: String

    /// 源内部的书 ID
    var remoteID: String

    /// 本地 TXT 的相对路径（仅本地导入的书有）
    var localPath: String?

    var addedAt: Date

    /// 最近一次阅读时间。
    /// 刻意**不用可选类型** —— 书架的 @Query 按它倒序排，
    /// 而 SwiftData 的 @Query(sort:) 要求 keyPath 的值类型满足 Comparable，
    /// `Date?` 不满足，写成可选会直接编译不过。
    /// 语义上"从没读过"就等于"加入时间"，所以用 addedAt 兜底没有信息损失。
    var lastReadAt: Date

    /// 当前读到第几章（章节目录的索引）
    var currentChapter: Int
    /// 当前章读到第几页
    var currentPage: Int

    /// 章节目录缓存。存 JSON 字符串，避免为目录单独建表。
    var chaptersJSON: String

    /// 是否读完
    var isFinished: Bool

    /// 阅读进度百分比（0–1），列表里显示用
    var progress: Double {
        guard !chapterList.isEmpty else { return 0 }
        let done = Double(currentChapter)
        let partial = Double(currentPage) / 100.0
        return min(1.0, (done + partial) / Double(chapterList.count))
    }

    var chapterList: [ChapterRef] {
        get {
            guard let data = chaptersJSON.data(using: .utf8) else { return [] }
            return (try? JSONDecoder().decode([ChapterRef].self, from: data)) ?? []
        }
        set {
            chaptersJSON = (try? JSONEncoder().encode(newValue))
                .flatMap { String(data: $0, encoding: .utf8) } ?? "[]"
        }
    }

    init(bookID: String, title: String, author: String = "", intro: String? = nil,
         sourceID: String, remoteID: String, localPath: String? = nil,
         chapters: [ChapterRef] = []) {
        self.bookID = bookID
        self.title = title
        self.author = author
        self.intro = intro
        self.sourceID = sourceID
        self.remoteID = remoteID
        self.localPath = localPath
        self.addedAt = Date()
        self.lastReadAt = Date()
        self.currentChapter = 0
        self.currentPage = 0
        self.isFinished = false
        self.chaptersJSON = (try? JSONEncoder().encode(chapters))
            .flatMap { String(data: $0, encoding: .utf8) } ?? "[]"
    }
}

/// 阅读历史（每章一条，用于"最近阅读"和统计）
@Model
final class ReadingRecord {
    @Attribute(.unique) var key: String       // "\(bookID)::\(chapterIndex)"
    var bookID: String
    var chapterIndex: Int
    var chapterTitle: String
    var pageIndex: Int
    var updatedAt: Date

    init(bookID: String, chapterIndex: Int, chapterTitle: String, pageIndex: Int) {
        self.key = "\(bookID)::\(chapterIndex)"
        self.bookID = bookID
        self.chapterIndex = chapterIndex
        self.chapterTitle = chapterTitle
        self.pageIndex = pageIndex
        self.updatedAt = Date()
    }
}
