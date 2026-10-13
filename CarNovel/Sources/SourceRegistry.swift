import Foundation
import SwiftData

// ═══════════════════════════════════════════════════════════════════
//  源注册表
// ═══════════════════════════════════════════════════════════════════
//
//  集中管理所有可用的 BookSource。加新源只要在 registerAll() 里加一行。
//
//  ⚠️ 关于"只找国内免费小说源"这件事，我把话说清楚：
//
//  国内绝大多数免费小说站的正文都受版权保护（包括《凡人修仙传》这类起点作品），
//  抓取和再分发有明确的法律风险。而且这类站点的反爬策略几周就变一次，
//  硬编码的解析规则维护成本极高，随时可能整体失联。
//
//  所以本工程**刻意不内置任何第三方站点爬虫**，而是：
//    1. 把「本地导入」做成一等公民 —— TXT/EPUB，离线可用，零风险
//    2. 留出干净的 BookSource 协议，你自己有权限的源照着实现即可
//    3. 公版书可以直接接（作品已过版权保护期）
//
//  这不是工程能力问题，是我不替你做那个选择。

@MainActor
final class SourceRegistry {

    static let shared = SourceRegistry()

    private(set) var sources: [BookSource] = []

    private init() {
        registerAll()
    }

    private func registerAll() {
        sources = [
            LocalBookSource(),        // 本地导入的 TXT / EPUB，推荐主力
            PublicDomainSource(),     // 公版书（内置书目，无版权风险）
            // 你有权限的其他源，在这里加：
            // MyAuthorizedSource(),
        ]
    }

    func source(id: String) -> BookSource? {
        sources.first { $0.id == id }
    }

    /// 聚合搜索：并行问所有支持搜索的源，结果合并。
    /// 单个源失败不影响其他源 —— 这类外部依赖必须容错。
    func searchAll(_ keyword: String) async -> [(source: BookSource, hits: [BookHit], error: String?)] {
        let searchable = sources.filter(\.supportsSearch)

        return await withTaskGroup(of: (BookSource, [BookHit], String?).self) { group in
            for source in searchable {
                group.addTask {
                    do {
                        let hits = try await source.search(keyword)
                        return (source, hits, nil)
                    } catch {
                        return (source, [], error.localizedDescription)
                    }
                }
            }

            var collected: [(BookSource, [BookHit], String?)] = []
            for await result in group {
                collected.append(result)
            }
            // 保持 registry 里的顺序，避免每次搜索顺序乱跳
            return searchable.compactMap { s in
                collected.first { $0.0.id == s.id }
            }
        }
    }
}
