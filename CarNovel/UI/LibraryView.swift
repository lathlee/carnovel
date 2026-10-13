import SwiftData
import SwiftUI
import UniformTypeIdentifiers

// ═══════════════════════════════════════════════════════════════════
//  书架
// ═══════════════════════════════════════════════════════════════════

struct LibraryView: View {

    @Environment(\.modelContext) private var context
    @Query(sort: \ShelfBook.lastReadAt, order: .reverse) private var books: [ShelfBook]

    @State private var importing = false
    @State private var showSearch = false
    @State private var errorMessage: String?
    @State private var busy = false

    var body: some View {
        NavigationStack {
            Group {
                if books.isEmpty {
                    emptyState
                } else {
                    list
                }
            }
            .navigationTitle("书架")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        showSearch = true
                    } label: {
                        Label("搜书", systemImage: "magnifyingglass")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        importing = true
                    } label: {
                        Label("导入", systemImage: "plus")
                    }
                }
            }
            .fileImporter(
                isPresented: $importing,
                allowedContentTypes: importTypes,
                allowsMultipleSelection: false
            ) { result in
                handleImport(result)
            }
            .sheet(isPresented: $showSearch) {
                SearchView()
            }
            .alert("出错了", isPresented: .constant(errorMessage != nil)) {
                Button("好") { errorMessage = nil }
            } message: {
                Text(errorMessage ?? "")
            }
            .overlay {
                if busy {
                    ProgressView("正在解析…")
                        .padding(24)
                        .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 14))
                }
            }
        }
    }

    // MARK: - 列表

    /// 允许导入的类型。
    /// 「epub」和「txt」用 UTType(filenameExtension:) 现造 ——
    /// UTType 里没有 .epub 这个静态成员，写 .epub 会直接编译不过。
    private var importTypes: [UTType] {
        var types: [UTType] = [.plainText, .text]
        if let epub = UTType(filenameExtension: "epub") { types.append(epub) }
        if let txt = UTType(filenameExtension: "txt") { types.append(txt) }
        return types
    }

    private var list: some View {
        List {
            ForEach(books) { book in
                NavigationLink {
                    ChapterListView(book: book)
                } label: {
                    row(book)
                }
            }
            .onDelete(perform: delete)
        }
    }

    private func row(_ book: ShelfBook) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(alignment: .firstTextBaseline) {
                Text(book.title)
                    .font(.headline)
                    .lineLimit(1)

                Spacer()

                if book.chapterList.isEmpty {
                    Text("待解析")
                        .font(.caption2)
                        .foregroundStyle(.tertiary)
                } else {
                    Text("\(book.chapterList.count) 章")
                        .font(.caption2)
                        .foregroundStyle(.tertiary)
                }
            }

            Text(book.author.isEmpty ? book.sourceID : book.author)
                .font(.caption)
                .foregroundStyle(.secondary)

            if !book.chapterList.isEmpty {
                ProgressView(value: book.progress)
                    .tint(.accentColor)

                Text("读到 \(book.currentChapter + 1) / \(book.chapterList.count) 章")
                    .font(.caption2)
                    .foregroundStyle(.tertiary)
            }
        }
        .padding(.vertical, 4)
    }

    private var emptyState: some View {
        ContentUnavailableView {
            Label("书架是空的", systemImage: "books.vertical")
        } description: {
            Text("导入本地 TXT/EPUB，或者搜索公版书")
        } actions: {
            HStack(spacing: 12) {
                Button("导入文件") { importing = true }
                    .buttonStyle(.borderedProminent)
                Button("搜书") { showSearch = true }
                    .buttonStyle(.bordered)
            }
        }
    }

    // MARK: - 导入

    private func handleImport(_ result: Result<[URL], Error>) {
        switch result {
        case .success(let urls):
            guard let url = urls.first else { return }
            Task { await importFile(url) }
        case .failure(let error):
            errorMessage = error.localizedDescription
        }
    }

    @MainActor
    private func importFile(_ url: URL) async {
        busy = true
        defer { busy = false }

        let ext = url.pathExtension.lowercased()

        do {
            if ext == "epub" {
                let parsed = try EPUBParser.parse(url: url)
                try storeEPUB(parsed, sourceURL: url)
            } else {
                let source = LocalBookSource()
                let result = try await source.importTXT(from: url)
                try store(result)
            }
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    /// 把导入结果写进书架
    private func store(_ result: LocalBookSource.ImportResult) throws {
        // 已经导过同一本就覆盖，避免重复。
        // 注意：必须先把值取到局部常量再进 #Predicate —— 直接写
        // `$0.bookID == result.bookID` 会被宏展开成对 ImportResult 的
        // keyPath，SwiftData 无法把它当值处理，编译直接报错。
        let bookID = result.bookID
        let descriptor = FetchDescriptor<ShelfBook>(
            predicate: #Predicate { $0.bookID == bookID }
        )
        if let existing = try? context.fetch(descriptor).first {
            existing.title = result.title
            existing.chapterList = result.chapters
            return
        }

        let book = ShelfBook(
            bookID: result.bookID,
            title: result.title,
            author: result.author,
            sourceID: "local",
            remoteID: result.bookID,
            localPath: result.textPath,
            chapters: result.chapters
        )
        context.insert(book)
        try context.save()
    }

    /// EPUB 走同一套落盘结构，只是解析器不同
    private func storeEPUB(_ parsed: EPUBParser.ParsedBook, sourceURL: URL) throws {
        let source = LocalBookSource()
        let result = try source.storeParsed(
            title: parsed.title,
            author: parsed.author,
            chapters: parsed.chapters,
            originName: sourceURL.lastPathComponent
        )
        try store(result)
    }

    private func delete(at offsets: IndexSet) {
        for index in offsets {
            let book = books[index]
            if book.sourceID == "local" {
                LocalBookSource().delete(bookID: book.remoteID)
            }
            context.delete(book)
        }
        try? context.save()
    }
}
