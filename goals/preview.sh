#!/bin/bash
# 本地预览脚本 - 不需要 GitHub

cd ~/.openclaw/workspace/goals

echo "🚀 启动本地服务器预览目标地图..."
echo ""
echo "📱 请在浏览器打开:"
echo "   http://$(hostname -I | awk '{print $1}'):8080"
echo ""
echo "🛑 按 Ctrl+C 停止服务器"
echo ""

python3 -m http.server 8080
