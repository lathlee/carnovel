# GlassNotify

iPhone 上的本地小程序，给一副安卓眼镜（Glass-view launcher）用：

- 自己起 **HTTP + WebSocket 服务器**（端口 **8090**，避开 CarNotify 车机版的 8081）
- 眼镜连上 iPhone 个人热点后，原生 WS 客户端连 `ws://172.20.10.1:8090/ws` 实时收通知
- iPhone 还能当**触控板**遥控眼镜光标（点哪走哪）
- 调试页可手动发测试通知，来源选 微信/短信/QQ/抖音/邮件 时眼镜按对应配色显示

与 CarNotify 是**两个独立 IPA**，可共存：CarNotify 管车机（8081），GlassNotify 管眼镜（8090）。

---

## 架构

```
   短信 / 邮件 / 调试按钮
        │  POST http://127.0.0.1:8090/push（本机）
        ▼
   GlassNotify（iPhone）
        ├─ NWListener HTTP 服务器（端口 8090，绑所有网卡）
        ├─ 手写 WebSocket（RFC 6455）
        └─ 静音音频后台保活
                │  WS 推送 / 触控板指令
                ▼
   眼镜（Glass-view，连 iPhone 热点）
        └─ 通知全屏弹出 + 系统级遥控光标
```

---

## 用起来

1. iPhone 打开 GlassNotify，点「启动服务器」（自动起音频保活）。让 iPhone 开**个人热点**。
2. 眼镜连上这个热点。GlassNotify 监听 `172.20.10.1:8090`，眼镜端 WS 自动连。
3. 「状态」页能看到「已连眼镜 N 副」。
4. 「调试」页选来源 + 填内容 → 发测试通知，眼镜全屏弹出。
5. 「触控板」页在区域里拖动移光标，轻点 = 点击；下方按钮：返回 / 桌面 / 多任务 / 点击。

> 短信触发器必须指定联系人（iOS 限制）。微信等第三方 App 走 BLE ANCS 是下一阶段。

---

## WebSocket 协议（iPhone ↔ 眼镜）

眼镜是 WS 客户端，iPhone 是 WS 服务端。`Sec-WebSocket-Key` 握手同 RFC6455。

**iPhone → 眼镜**

| type | 字段 | 说明 |
|---|---|---|
| `latest` | `items:[{app,title,body,ts}]` | 连上时回填历史 |
| `notify` | `item:{app,title,body,ts}` | 新通知 |
| `clear` | — | 清屏 |
| `pointer` | `x:0..1, y:0..1` | 移动光标（归一化，左上原点） |
| `tap` | `x:0..1, y:0..1` | 在坐标处点击 |
| `action` | `name: back\|home\|recents` | 系统导航 |

**眼镜 → iPhone**

| type | 说明 |
|---|---|
| `ping` | 心跳，iPhone 回 `pong` |

---

## 编译（本机无 Xcode，走云端）

workflow：`.github/workflows/glassnotify.yml`

产物（未签名 ipa + 构建日志）推到 `glassnotify-build` 分支，匿名可下：

```
https://raw.githubusercontent.com/lathlee/carnovel/glassnotify-build/ci-logs/last-build.md
https://raw.githubusercontent.com/lathlee/carnovel/glassnotify-build/ci-logs/GlassNotify-<版本>-unsigned.ipa
```

签名用 SideStore / AltStore + 免费 Apple ID（同 CarNotify 流程）。

把 `GlassNotify/` 目录和 `.github/workflows/glassnotify.yml` 加进 `lathlee/carnovel` 仓库根目录，
push 到 `main` 即触发构建。
