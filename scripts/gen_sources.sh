#!/usr/bin/env bash
set -euo pipefail

# 生成 SideStore / AltStore 源文件 source.json
# 用法: gen_sources.sh <VERSION> <BASE_URL> <IDENTIFIER> <OUT_FILE>
#   VERSION    例如 1.4
#   BASE_URL   源根地址，例如 https://lathlee.github.io/carnovel 或
#              https://raw.githubusercontent.com/lathlee/carnovel/carnotify-build/ci-logs
#   IDENTIFIER 源的 identifier，例如 com.lath.carnotify.sidestore
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
  "name": "CarNotify",
  "identifier": "$IDENT",
  "sourceURL": "$BASE/source.json",
  "apps": [
    {
      "name": "CarNotify",
      "bundleIdentifier": "com.lath.carnotify",
      "version": "$VER",
      "versionDate": "$DATE",
      "downloadURL": "$BASE/CarNotify-$VER-unsigned.ipa",
      "localizedDescription": "iPhone 本地通知服务器：在 CarPlay / APTV 浏览器实时显示微信与短信通知，无需安装车机软件。",
      "iconURL": "$BASE/icon.png",
      "tintColor": "34C759",
      "size": $IPA_SIZE,
      "permissions": []
    }
  ],
  "news": [
    {
      "title": "CarNotify $VER",
      "date": "$DATE",
      "caption": "SideStore 自动更新源已就绪，添加源后可一键安装 / 更新。"
    }
  ]
}
JSON

echo "已生成 $OUTFILE"
