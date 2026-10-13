import SwiftUI
import UIKit

//  CarPlay 浏览器入口 —— 告诉用户当前书/章/页的内网 URL，
//  方便在 APTV 等第三方 CarPlay App 的浏览器里粘贴打开。

struct BrowserURLSheet: View {

    @Environment(\.dismiss) private var dismiss
    @ObservedObject private var server = BookHTTPServer.shared

    let bookID: String
    let chapter: Int
    let page: Int

    /// 显式写 init：结构体里既有 `@Environment` 又有 `private` 存储属性时，
    /// 编译器合成的 memberwise init 会变成 private，外部就构造不了。
    init(bookID: String, chapter: Int, page: Int) {
        self.bookID = bookID
        self.chapter = chapter
        self.page = page
    }

    private var currentURL: URL? {
        URL(string: server.readURL(bookID: bookID, chapter: chapter, page: page))
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                if server.isRunning, let url = currentURL {
                    Image(systemName: "car.fill")
                        .font(.system(size: 48))
                        .foregroundColor(.green)

                    Text("在 CarPlay 浏览器中打开")
                        .font(.headline)

                    Text(url.absoluteString)
                        .font(.system(.callout, design: .monospaced))
                        .textSelection(.enabled)
                        .padding()
                        .background(Color(.secondarySystemBackground),
                                      in: RoundedRectangle(cornerRadius: 12))

                    Button {
                        UIPasteboard.general.url = url
                    } label: {
                        Label("复制链接", systemImage: "doc.on.doc")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.horizontal)

                    VStack(alignment: .leading, spacing: 10) {
                        Text("操作步骤：")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        Text("1. 点「复制链接」，把地址复制到剪贴板。")
                        Text("2. 在车机的 APTV / 车联投屏 浏览器地址栏粘贴。")
                        Text("3. 车机浏览器访问的是 iPhone 本机地址 127.0.0.1，无需网络。")
                    }
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                } else {
                    Image(systemName: "exclamationmark.triangle")
                        .font(.system(size: 48))
                        .foregroundColor(.orange)

                    Text(server.isRunning ? "服务器地址未生成" : "本地服务器未启动")
                        .font(.headline)

                    Text(server.isRunning
                         ? "请稍等片刻后重试。"
                         : "请确认 App 有网络权限，然后重新进入阅读页。")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }

                Spacer()
            }
            .padding()
            .navigationTitle("CarPlay 浏览器")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("完成") { dismiss() }
                }
            }
        }
    }
}
