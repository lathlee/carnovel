import SwiftData
import SwiftUI

// ═══════════════════════════════════════════════════════════════════
//  章节目录
// ═══════════════════════════════════════════════════════════════════

struct ChapterListView: View {

    @Environment(\.modelContext) private var context
    @Bindable var book: ShelfBook

    @State private var loading = false
    @State private var errorMessage: String?

    var body: some View {
        List {
            if !book.chapterList.isEmpty {
                Section {
                    HStack {
                        ProgressView(value: book.progress)
                        Text("\(Int(book.progress * 100))%")
                            .font(.caption)
                            .monospacedDigit()
                            .foregroundStyle(.secondary)
                    }
                }
            }

            Section {
                ForEach(Array(book.chapterList.enumerated()), id: \.element.id) { index, chapter in
                    NavigationLink {
                        ReadView(book: book, chapterIndex: index)
                    } label: {
                        HStack(spacing: 8) {
                            if index == book.currentChapter {
                                Image(systemName: "book.fill")
                                    .font(.caption2)
                                    .foregroundStyle(.tint)
                            }
                            Text(chapter.title)
                                .lineLimit(2)
                            Spacer()
                            if index == book.currentChapter, book.currentPage > 0 {
                                Text("第 \(book.currentPage + 1) 页")
                                    .font(.caption2)
                                    .foregroundStyle(.tertiary)
                            }
                        }
                    }
                }
            } header: {
                Text("\(book.chapterList.count) 章")
            }
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Menu {
                    Button {
                        book.currentPage = 0
                        try? context.save()
                    } label: {
                        Label("重读本章", systemImage: "arrow.counterclockwise")
                    }
                    Button(role: .destructive) {
                        book.isFinished = true
                        try? context.save()
                    } label: {
                        Label("标记为已读完", systemImage: "checkmark.circle")
                    }
                } label: {
                    Image(systemName: "ellipsis.circle")
                }
            }
        }
        .overlay {
            if loading { ProgressView() }
        }
        .alert("出错了", isPresented: .constant(errorMessage != nil)) {
            Button("好") { errorMessage = nil }
        } message: {
            Text(errorMessage ?? "")
        }
        .task {
            await ensureChapters()
        }
    }

    /// 在线书的目录可能是空的（比如加书架时网络失败），进详情页补拉一次
    private func ensureChapters() async {
        guard book.chapterList.isEmpty,
              let source = SourceRegistry.shared.source(id: book.sourceID)
        else { return }

        loading = true
        defer { loading = false }

        do {
            let hit = BookHit(sourceID: book.sourceID, bookID: book.remoteID,
                              title: book.title, author: book.author)
            let detail = try await source.detail(for: hit)
            book.chapterList = detail.chapters
            try? context.save()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
