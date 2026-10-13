# CarNovel — CarPlay 小说阅读器

> 自用，不上架。iPhone(iOS 27) 在线搜小说 → 实时生成分页视频 → 投到车机屏，
> **用方向盘「上一曲 / 下一曲」翻页，车机屏上不出现任何控件**。
> 状态：方案已核实，Windows 侧流水线已跑通，Swift 骨架完成。

---

## 一、核心结论（三条，都是实测或官方文档确认过的）

**1. 不要申请 CarPlay 权限 —— 这是「UI 不遮挡」的关键。**

你要做的不是「CarPlay 应用」，而是一个**支持 AirPlay 视频投屏的普通 iOS 应用**。
正因为不是 CarPlay 应用，它不会出现在车机首页，车机屏上就不会有
上一曲/下一曲/播放暂停那一排控件覆盖你的文字 —— 屏幕里只有一个纯视频画面。

> APTV / CarTV 那些之所以有控件，正是因为它们是 CarPlay 应用。
> 你这个需求下，「不是 CarPlay 应用」反而是优势。

**2. 翻页必须靠「每页一个文件」，不能靠一个长视频。**

Apple 官方文档原文：

> 短按 = **跳到下一首歌曲**；长按 = 快进

方向盘那两个键操作的是**播放列表里的媒体项**，不是视频内的时间点。
一整章塞进一个 mp4 = 一个媒体项 = 没有「下一项」可跳，按键自然没反应。

**3. 「短按和长按对换」在应用层做不到。**

`MPRemoteCommandCenter` 的回调**没有长按参数**：

```
nextTrackCommand      ← 只告诉你"下一曲"
previousTrackCommand  ← 只告诉你"上一曲"
```

短按/长按是**车机固件**读按键时长后自己判断的 —— 短按翻译成 `NextTrack` 指令发给你，
长按则车机内部直接做快进/快退，**不一定发指令给 App**。App 拿到的是已经翻译好的成品，
看不到原始按键动作。所以这个交换不存在，也换不了。

**但目标已经达成**：每页一个文件 → 「下一曲」= 翻下一页。系统原生行为，零 hack。

---

## 二、两条技术路线（已选定 A）

| | 路线 A：AirPlay 镜像 ✅ | 路线 B：CarPlay video app |
|---|---|---|
| 需要 CarPlay entitlement | **不需要** | 必须申请，Apple 人工审，以月计 |
| 车机屏有 UI 控件 | **没有** ← 正是你要的 | 有，会遮挡 |
| 车机能触摸交互 | 车机只是显示器 | 完整 UI |
| 起步难度 | 低 | 高 |

**走 A。** 理由：你要的是「屏幕上只有文字」，那就不该做 CarPlay 应用。

---

## 三、翻页方案：单页文件 + 播放列表

```
ch01_p001.mp4   ← 第 1 页，1 秒
ch01_p002.mp4   ← 第 2 页，1 秒
ch01_p003.mp4   ← 第 3 页，1 秒
      …
ch01_p018.mp4   ← 第 18 页，1 秒
```

- 方向盘 **下一曲** → 翻下一页（`nextTrackCommand`）
- 方向盘 **上一曲** → 回上一页（`previousTrackCommand`）
- **播完停住，不连播** → `player.actionAtItemEnd = .pause`
- 单页只有 1 秒，所以「翻页」是主动动作，不是等它播完

文件名补零排序（`p001`…`p018`），保证 `sorted()` 出来就是页序。

---

## 四、源码一览

```
CarNovel/
├── CarNovelApp.swift        App 入口（★ beginReceivingRemoteControlEvents + SwiftData 容器）
├── Info.plist               ★ 刻意不含任何 CarPlay 键 —— 这是零控件的关键
│
├── Sources/                 ★ 源适配层（可插拔）
│   ├── BookSource.swift         源协议：搜索 / 详情 / 取正文
│   ├── SourceRegistry.swift     源注册表 + 聚合搜索（并行、容错）
│   ├── TXTParser.swift      ★ TXT 编码探测 + 章节切分（见下方"最硬的一块"）
│   ├── EPUBParser.swift         纯 Foundation 实现的 EPUB 解析（含 raw deflate 解压）
│   ├── LocalBookSource.swift    本地导入（推荐主力，离线零风险）
│   └── PublicDomainSource.swift 公版书（在线、免费、无版权风险）
│
├── Library/
│   └── ShelfBook.swift      书架数据模型（SwiftData）+ 阅读进度
│
├── Paginator.swift          CoreText 分页 + 1080p 位图渲染
├── PageStore.swift          单页 mp4 生成与缓存
├── PageTurnPlayer.swift     ★ 方向盘翻页 + 不连播 + 遥控指令接管
│
└── UI/
    ├── LibraryView.swift        书架（列表 / 进度 / 导入 / 删除）
    ├── SearchView.swift         搜书（多源聚合）
    ├── ChapterListView.swift    章节目录
    └── ReadView.swift           阅读页（排版进度 → AirPlay 投屏）

project.yml                XcodeGen 工程描述（Windows 上也能改工程结构）
.github/workflows/         免费 macOS runner 编译未签名 .ipa
docs/构建与安装.md          ★ 无付费开发者账号的侧载完整方案
tools/make_pages_video.py  Python 版流水线（与 Swift 逻辑一一对应，用于快速验证）
```

### 关于小说源

**本工程刻意不内置任何第三方站点爬虫。** 这不是技术问题，是两条现实：

1. 国内绝大多数免费小说站的正文受版权保护（含《凡人修仙传》这类起点作品），抓取和再分发有法律风险
2. 这类站点反爬策略几周变一次，硬编码规则维护成本极高，随时可能整体失联

所以给的是**可插拔的协议 + 两个正经实现**：

| 源 | 说明 |
|---|---|
| **本地导入** | TXT / EPUB，离线可用、零风险、最快。**推荐主力** |
| **公版书** | 内置 12 本（四大名著、聊斋、三言、儒林外史…），在线搜、免费、无版权问题 |
| 你自己的源 | 实现 `BookSource` 协议，在 `SourceRegistry.registerAll()` 加一行即可 |

公版书的判断标准：作者逝世满 50 年。所以鲁迅（1936 年逝世）及更早的都可用。

---

## 五、最硬的一块：TXT 章节切分

中文小说 TXT 的脏法远超想象。拿《凡人修仙传》那个 15MB 文件实测，
一共踩出四个坑，每个都会让阅读断掉：

| 坑 | 现象 | 修法 |
|---|---|---|
| **编码** | GB18030 而非 UTF-8，直读全是乱码 | BOM 探测 + 多编码试解，取"替换字符最少"的那个 |
| **章/卷混用** | `第十卷` 也独立成行，被当成章节 | 章标记与卷标记**分开扫描**，优先用章；实测 2495 → 1554 条 |
| **重复标记** | 同一章出现两次：`第六卷通天灵宝第九百九十一章紫雾` + `第九百九十一章紫雾`，中间夹的内容成了空章 | 提取**最后一个**「第X章」的章号做比对，只保留最后一条 |
| **超长块** | 源文件有整段缺标记，最大一"章" 94.9 万字 | 超过 12000 字按段落再切，后续标「（续 N）」 |

**最终实测结果：**

```
空章      97 → 0        （去重 + 残渣合并两道兜底）
章数      2592 → 1765    （章/卷分流后收敛到真实结构）
单章字数  319 ~ 12000    （超长块封顶，不会一章渲染几千页）
第 1 章   第一章山边小村 (2452 字)   ← 章序正确
```

> 关键认知：**不追求切得完美，只保证阅读不断。**
> 源文件脏法无法用正则穷举（换本书又是新花样），所以加了「正文 < 80 字并进上一章」的兜底 ——
> 切错一章只是目录难看，但阅读不会断。

### 为什么用 XcodeGen 而不是提交 .xcodeproj

因为本机是 Windows，没法手点出 `.xcodeproj`。
`project.yml` 是纯文本，改起来放心，CI 上一条 `xcodegen generate` 就出工程。

### 三个关键实现点

**`PageTurnPlayer.swift` — 遥控指令接管**

```swift
center.nextTrackCommand.addTarget { self.nextPage(); return .success }
center.previousTrackCommand.addTarget { self.previousPage(); return .success }

// 显式关掉播放/暂停和进度拖动 —— 我们要的是"静止的一页纸"
center.playCommand.isEnabled = false
center.pauseCommand.isEnabled = false
center.changePlaybackPositionCommand.isEnabled = false
```

还额外绑了 `skipForward` / `skipBackward`，因为**部分车型方向盘只有快进/快退键，
没有上一曲/下一曲**，绑上更保险。

**⚠️ 别忘了 `beginReceivingRemoteControlEvents()`**

在 `UIApplicationDelegate` 或 Scene 启动时装：

```swift
UIApplication.shared.beginReceivingRemoteControlEvents()
```

不加这一句，方向盘媒体键事件可能收不到。这是最容易漏的一步。

**`PageTurnPlayer.nextPage()` — 前进并停在末帧**

`AVQueuePlayer.advanceToNextItem()` 只能往前推进，回退要重建队列。
每页 1 秒，所以直接 seek 到末帧再 `pause()`，画面就静止显示。

---

## 五、已跑通的 Windows 验证流水线

因为本机没有 Xcode，这套逻辑先用 Python 走通了一遍，产出的视频可以直接拿去车上试。
Python 版与 Swift 版逻辑一一对应。

```bash
# 整章合成一个文件（早期版本，供对比）
python tools/make_pages_video.py --input "D:/D/Personal/凡人修仙传.txt" \
  --chapter 1 --pages 18 --seconds 20 --fps 2 --preview

# ★ 每页一个文件（方向盘翻页用）
python tools/make_pages_video.py --input "D:/D/Personal/凡人修仙传.txt" \
  --chapter 1 --pages 18 --seconds 1 --fps 2 --per-page
```

依赖：`pillow` + `imageio-ffmpeg`（自带静态 ffmpeg，含 libx265）。
装在隔离 venv：`~/.workbuddy/binaries/python/envs/default`。

### 实测结果（《凡人修仙传》第 1 章）

```
输入：GB18030，797 万字，1554 章
      第 1 章「山边小村」2452 字 → 125 行 → 18 页

单页模式：18 个文件，合计 3.26 MB，每个 1 秒
整章模式：1 个文件 6.0 分钟 2.9 MB（1920x1080 HEVC hvc1 2fps 59kb/s）
          seek 校验 4/4 页命中正确画面
```

---

## 六、踩过的坑（都在代码里修掉了）

**1. 全关键帧会让文件膨胀 20 倍。**
`keyint=1` 时 6 分钟视频编到 **66 MB**；改成 `keyint = fps × 每页秒数`
（一页一个关键帧）→ **2.9 MB**，seek 精度不变。
> 单页文件只有 1 秒、2 帧，全关键帧反而没成本，所以单页模式保留 `keyint=1`。

**2. 避头尾修正会让行宽溢出屏幕。**
把标点从下一行拉回上一行后那行会变长，实测有两行顶到 1728px（上限 1700px）。
修法：折行按 96% 宽度切留余量 + 修正后跑溢出重排。现溢出 0 行。

**3. `-tag:v hvc1` 不能省。**
HEVC 的 MP4 默认 tag 是 `hev1`，**Apple 系设备（AVFoundation / AirPlay）不认**，必然黑屏。

**4. 静音 AAC 音轨是必须的。**
没有音轨时，AirPlay 视频路由和方向盘媒体键都可能不生效。
而方向盘翻页是这套方案里唯一的翻页手段。

**5. `prioritizesVideoDevices = true` 必须设。**
不设的话，`AVRoutePickerView` 的候选列表里不一定出现车机。

---

## 七、版面参数

```
画布        1920 × 1080（横屏）
背景/文字   纯黑 #000000 / 纯白 #FFFFFF
字体        微软雅黑 Bold（msyhbd.ttc）
正文字号    72px        ← 1080p 上约等于手机 22pt 的观感
行距        114px（1.58×）
每页        7 行 × 约 23 字 ≈ 161 字
页边距      左右 110 / 上 62（章节名）/ 下 60（页码安全区）
```

调整入口：`make_pages_video.py` 顶部的 `SIZE_BODY` / `LINES_PER_PAGE`，
或 Swift 侧的 `PageStyle`。

> 纯白字在纯黑底上长时间看有光晕感。觉得刺眼就把 `FG` 改成 `(232,232,232)`，
> 但车上首要是辨识度，建议先按纯白。

---

## 八、下一步

1. **上车验证单页模式** —— 把 `out/凡人修仙传_ch01_单页/` 里的 18 个文件传到 iPhone，
   用现成播放器当列表播，确认方向盘能不能切、切了会不会自动往下播
2. **搭 Xcode 工程** —— 走 GitHub Actions 免费 macOS runner 编译未签名 .ipa
3. **侧载安装** —— SideStore + 免费 Apple ID，每 7 天续签一次
4. **接文本源** —— 在线源适配 + TXT/EPUB 本地导入（本地导入最稳，建议优先）
5. **加 TTS** —— 每页时长改成朗读时长，就变成「停车看、行车听」的无缝闭环

> 关于「没有付费开发者账号」：详见 **[docs/构建与安装.md](docs/构建与安装.md)**。
> 简短结论 —— 侧载能解决**安装**，但**编译**仍需要 macOS（可用 GitHub Actions 免费跑）。
> 免费 Apple ID 的硬限制是：**7 天签名有效期**、最多 3 个侧载 App。

---

## 九、安全与法律边界

- 行车中看视频**违法**（分心驾驶），系统也会强制切断画面。别试图绕过。
- 免费车机娱乐的本质是「停车等人和充电时消磨时间」，不是行车娱乐。
- 别用改硬件、刷车机的方式绕过驻车检测 —— 责任和保险后果全在你自己身上。
- 在线小说源请自行确认合规；**本地 TXT/EPUB 导入是最稳、最无风险的入口**。
