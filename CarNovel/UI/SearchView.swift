import SwiftData
import SwiftUI

// ═══════════════════════════════════════════════════════════════════
//  搜书
// ═══════════════════════════════════════════════════════════════════

struct SearchView: View {

    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss

    @State private var keyword = ""
    @State private var results: [(source: BookSource, hits: [BookHit], error: String?)] = []
    @State private var searching = false
    @State private var addedIDs: Set<String> = []
    @State private var message: String?

    var body: some View {
        NavigationStack {
            List {
                if results.isEmpty && !searching {
                    Section {
                        hint
                    }
                }

                ForEach(results, id: \.source.id) { group in
                    if let error = group.error {
                        Section(group.source.name) {
                            Label(error, systemImage: "exclamationmark.triangle")
                                .font(.footnote)
                                .foregroundStyle(.secondary)
                        }
                    } else if !group.hits.isEmpty {
                        Section(group.source.name) {
                            ForEach(group.hits) { hit in
                                row(hit, source: group.source)
                            }
                        }
                    }
                }
            }
            .navigationTitle("搜书")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $keyword, prompt: "书名或作者")
            .onSubmit(of: .search) { Task { await runSearch() } }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("完成") { dismiss() }
                }
            }
            .overlay {
                if searching {
                    ProgressView("搜索中…")
                }
            }
            .alert("提示", isPresented: .constant(message != nil)) {
                Button("好") { message = nil }
            } message: {
                Text(message ?? "")
            }
        }
    }

    private var hint: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("可以搜什么")
                .font(.headline)
            Text("· 公版书：红楼梦、三国演义、聊斋志异、儒林外史…")
            Text("· 作者名：曹雪芹、蒲松龄、冯梦龙…")
            Text("· 主题词：四大名著、志怪、讽刺小说…")
        }
        .font(.footnote)
        .foregroundStyle(.secondary)
    }

    private func row(_ hit: BookHit, source: BookSource) -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(hit.title).font(.body)
                Text(hit.author.isEmpty ? source.name : hit.author)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                if let intro = hit.intro {
                    Text(intro).font(.caption2).foregroundStyle(.tertiary)
                }
            }

            Spacer()

            if addedIDs.contains(hit.id) {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundStyle(.green)
            } else {
                Button {
                    Task { await add(hit, source: source) }
                } label: {
                    Image(systemName: "plus.circle")
                }
                .buttonStyle(.borderless)
            }
        }
    }

    // MARK: - 动作

    @MainActor
    private func runSearch() async {
        let query = keyword.trimmingCharacters(in: .whitespaces)
        guard !query.isEmpty else { return }

        searching = true
        defer { searching = false }

        results = await SourceRegistry.shared.searchAll(query)

        if results.allSatisfy({ $0.hits.isEmpty && $0.error == nil }) {
            message = "没有找到「\(query)」"
        }
    }

    /// 加入书架。在线书要先把章节目录拉下来。
    @MainActor
    private func add(_ hit: BookHit, source: BookSource) async {
        guard let impl = SourceRegistry.shared.source(id: hit.sourceID) else { return }

        addedIDs.insert(hit.id)

        do {
            let detail = try await impl.detail(for: hit)

            let book = ShelfBook(
                bookID: hit.bookID,
                title: hit.title,
                author: hit.author,
                intro: hit.intro,
                sourceID: hit.sourceID,
                remoteID: hit.bookID,
                chapters: detail.chapters
            )
            context.insert(book)
            try context.save()
        } catch {
            addedIDs.remove(hit.id)
            message = "加入失败：\(error.localizedDescription)"
        }
    }
}
