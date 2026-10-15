# CarNotify

iPhone 上的一个本地小程序：**自己起 HTTP + WebSocket 服务器，给 CarPlay 里的浏览器用**，
接收快捷指令推来的短信 / 邮件通知，实时显示在车机屏幕上。

它是 a-Shell 方案的替代品。a-Shell 是终端模拟器，一到后台就被 iOS 冻结，
Python 服务器跟着停，快捷指令 POST 直接超时 —— 这是原型的天花板。
自己的 App 可以在 `Info.plist` 里声明 `UIBackgroundModes`，系统就得按后台 App 的规则对待它。

---

## 架构

```
   短信 / 邮件
       │
       ▼
  快捷指令自动化  ──POST http://127.0.0.1:8081/push──▶  CarNotify（本 App）
                                                          ├─ NWListener 里的 HTTP 服务器
                                                          ├─ 手写 WebSocket（RFC 6455）
                                                          └─ 静音音频保活
                                                                  │
                                                    WS 推送 /（页面也是它给的）
                                                                  ▼
                                              APTV 的 WKWebView（跑在 iPhone 上）
                                                                  │
                                                          车机屏幕 1578×1286
```

关键前提：**APTV 的 WebView 跑在 iPhone 上**，所以 `127.0.0.1` 指的就是 iPhone 自己。
不需要热点、不需要局域网、不需要 TLS、不需要在车机上装任何东西。

---

## 用起来

1. 装好 App，打开一次（它会自动起服务器 + 起保活），然后就可以切走 / 息屏。
2. CarPlay 里打开 APTV，浏览器地址栏输：

   ```
   http://127.0.0.1:8081/
   ```

   **`http://` 前缀不能省** —— 不带的话会被当成 `https://127.0.0.1:8081/`，连不上。

3. 快捷指令里建自动化：

   | 项 | 值 |
   |---|---|
   | 触发条件 | 信息 / 电子邮件 |
   | 动作 | 获取 URL 内容 |
   | URL | `http://127.0.0.1:8081/push` |
   | 方法 | POST |
   | 请求体 | JSON |

   ```json
   {"app":"短信","title":"【发件人】","body":"【信息】"}
   ```

   方括号里插入快捷指令提供的变量。

> 短信触发器**必须指定联系人**，这是 iOS 的硬限制（没有"任何人"选项）。
> 对行车场景反而合理 —— 白名单联系人之外的短信本来也不该往车机上推。

---

## 端点

| 方法 | 路径 | 说明 |
|---|---|---|
| GET | `/` | 通知界面（`index.html`） |
| GET | `/rtos.wasm` | RTOS 内核，页面用它做优先级调度 |
| GET | `/ws` | WebSocket，页面连上后实时收通知 |
| POST | `/push` | `{"app","title","body"}` → 广播给所有页面 |
| POST | `/clear` | 清空历史并广播清屏 |
| GET | `/status` | 自检用：`{"ok","port","clients","history"}` |

WebSocket 上跑的三条消息：

```json
{"type":"hello","items":[...]}          // 刚连上时回填历史
{"type":"notify","item":{...}}          // 新通知
{"type":"clear"}                        // 清屏
```

---

## 热替换页面

服务器给 `/` 和 `/rtos.wasm` 时，**先看 Documents 目录，没有才回落到 App 包内**。
所以改版式不用重新编译 —— 用「文件」App 或 Finder 往 CarNotify 的文档目录里丢一个
新的 `index.html` 就行（同名覆盖）。想改回去，删掉 Documents 里的那份即可。

---

## 编译

本机是 Windows，没有 Xcode，所以走 GitHub Actions 云端编译：

- workflow：`.github/workflows/carnotify.yml`
- 产物（未签名 ipa + 构建日志）推到 `carnotify-build` 分支，匿名可下：

  ```
  https://raw.githubusercontent.com/lathlee/carnovel/carnotify-build/ci-logs/last-build.md
  https://raw.githubusercontent.com/lathlee/carnovel/carnotify-build/ci-logs/CarNotify.ipa
  ```

- 签名用 SideStore / AltStore 拿免费 Apple ID 做，见 `../docs/构建与安装.md`。

---

## 已知边界

- **微信**拿不到。iOS 没有读第三方通知的 API，也没有对应触发器。
  短信 / 邮件能拿到是因为快捷指令有这两个通信触发器。微信只剩 BLE ANCS 一条路（第二阶段）。
- 保活靠静音音频。控制中心 / CarPlay 的「正在播放」里会出现 CarNotify，
  用 `.mixWithOthers` 让车机上的音乐照常放，不抢播放权。
- 端口默认固定 8081（快捷指令里存的地址就是它）。8081 被占才会退到随机端口，
  那时页面地址要重新看 App 里显示的。
