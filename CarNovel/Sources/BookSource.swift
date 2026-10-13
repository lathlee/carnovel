import Foundation

// ═══════════════════════════════════════════════════════════════════
//  BookSource —— 小说源适配协议
// ═══════════════════════════════════════════════════════════════════
//
//  设计目标：源是可插拔的。加一个站点 = 加一个实现，不动其他代码。
//
//  ⚠️ 关于源本身的取舍（写在这里，免得以后忘）：
//
//  本项目**不内置任何第三方站点爬虫**。原因不是技术，是两条现实：
//    1. 国内绝大多数小说站的正文都受版权保护，抓取/分发有法律风险；
//    2. 这类站点的反爬策略变化极快，硬编码的选择器几周就失效，
//       维护成本远超收益，而且随时可能整体失联。
//
//  所以推荐的使用姿势是：
//    - **本地导入**（TXT / EPUB）—— 最稳、离线可用、零法律风险，推荐优先
//    - **自己有权访问的源** —— 公版书站点、自建服务器、有授权的接口
//
//  下面仍然给了两个能直接跑的实现：LocalBookSource（本地文件）和
//  PublicDomainSource（公版书）。这两个覆盖了绝大多数正当使用场景。
//  要接其他源，照着 BookSource 实现一个即可。

// MARK: - 数据结构

/// 搜索结果里的一本书
struct BookHit: Identifiable, Hashable, Codable {
    var id: String { "\(sourceID)::\(bookID)" }
    /// 来源标识，用于回查用哪个 source 取详情
    var sourceID: String
    /// 源内部的书 ID（可能是 URL、数字、slug）
    var bookID: String
    var title: String
    var author: String
    var intro: String?
    var coverURL: String?
}

/// 书目详情
struct BookDetail: Codable {
    var hit: BookHit
    var chapters: [ChapterRef]
}

/// 章节引用
struct ChapterRef: Identifiable, Hashable, Codable {
    var id: String { chapterID }
    var chapterID: String
    var index: Int
    var title: String
}

// MARK: - 协议

protocol BookSource: AnyObject {

    /// 稳定标识，存进书架用它回查
    var id: String { get }
    /// 显示名
    var name: String { get }
    /// 是否支持搜索（本地导入源不搜索）
    var supportsSearch: Bool { get }

    /// 搜索。返回空数组表示没结果，不是错误。
    func search(_ keyword: String) async throws -> [BookHit]

    /// 取书目详情 + 章节目录
    func detail(for hit: BookHit) async throws -> BookDetail

    /// 取某一章正文（纯文本，段落用 \n 分隔）
    func content(bookID: String, chapterID: String) async throws -> String
}

extension BookSource {
    var supportsSearch: Bool { true }
}

enum BookSourceError: LocalizedError {
    case notFound
    case badResponse(String)
    case notSupported

    var errorDescription: String? {
        switch self {
        case .notFound: "没找到这本书"
        case .badResponse(let why): "源返回异常：\(why)"
        case .notSupported: "这个源不支持该操作"
        }
    }
}
