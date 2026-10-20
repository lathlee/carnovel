#!/usr/bin/env bash
set -euo pipefail

# 生成 SideStore / AltStore 源文件 source.json
# 用法: gen_sources.sh <VERSION> <BASE_URL> <IDENTIFIER> <OUT_FILE>
#   VERSION    例如 1.4
#   BASE_URL   源根地址，例如 https://raw.githubusercontent.com/lathlee/carnovel/glassnotify-build/ci-logs
#   IDENTIFIER 源的 identifier，例如 com.lath.glassnotify.sidestore.raw
#   OUT_FILE   输出的 source.json 路径
# 环境变量 IPA_SIZE 可选，提供则写入 size 字段。

VER="$1"
BASE="$2"
IDENT="$3"
OUTFILE="$4"
IPA_SIZE="${IPA_SIZE:-0}"
DATE=$(date -u '+%Y-%m-%d')

mkdir -p "$(dirname "$OUTFILE")"

cat > "$OUTFILE" <<JSON
{
  "name": "GlassNotify",
  "identifier": "$IDENT",
  "sourceURL": "$BASE/source.json",
  "apps": [
    {
      "name": "GlassNotify",
      "bundleIdentifier": "com.lath.glassnotify",
      "version": "$VER",
      "versionDate": "$DATE",
      "downloadURL": "$BASE/GlassNotify-$VER-unsigned.ipa",
      "localizedDescription": "iPhone 本地服务器：给安卓眼镜实时推通知 + 当触控板。眼镜连 iPhone 个人热点后自动接收。",
      "iconURL": "$BASE/icon.png",
      "tintColor": "34C759",
      "size": $IPA_SIZE,
      "permissions": []
    }
  ],
  "news": [
    {
      "title": "GlassNotify $VER",
      "date": "$DATE",
      "caption": "SideStore 自动更新源已就绪，添加源后可一键安装 / 更新。"
    }
  ]
}
JSON

echo "已生成 $OUTFILE"
