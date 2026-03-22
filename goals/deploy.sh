#!/bin/bash
# GitHub Pages 部署脚本 for Goal Tracker
# 用法: ./deploy.sh <你的GitHub用户名>

set -e

USERNAME=$1

if [ -z "$USERNAME" ]; then
    echo "❌ 请提供 GitHub 用户名"
    echo "用法: ./deploy.sh LandyLee-gdut"
    exit 1
fi

echo "🚀 开始部署 Goal Tracker 到 GitHub Pages..."

# 创建临时目录
TEMP_DIR=$(mktemp -d)
cd "$TEMP_DIR"

# 克隆仓库
echo "📦 克隆仓库..."
git clone "https://github.com/$USERNAME/my-goals.git" 2>/dev/null || {
    echo "⚠️  仓库不存在，请先手动创建:"
    echo "   1. 访问 https://github.com/new"
    echo "   2. Repository name: my-goals"
    echo "   3. 选择 Public, 勾选 Add README"
    echo "   4. 创建后重试"
    rm -rf "$TEMP_DIR"
    exit 1
}

cd my-goals

# 清空旧文件（保留 README）
find . -maxdepth 1 -name "*.html" -delete 2>/dev/null || true
find . -maxdepth 1 -name "*.json" -delete 2>/dev/null || true

# 复制新文件
echo "📋 复制目标文件..."
cp ~/.openclaw/workspace/goals/*.html .
cp ~/.openclaw/workspace/goals/*.json . 2>/dev/null || true

# 提交更改
echo "💾 提交更改..."
git add .
git commit -m "Update goals dashboard - $(date '+%Y-%m-%d %H:%M')" || echo "没有更改需要提交"

# 推送
echo "⬆️  推送到 GitHub..."
git push origin main

# 清理
rm -rf "$TEMP_DIR"

echo ""
echo "✅ 部署完成！"
echo ""
echo "📝 请确认已开启 GitHub Pages:"
echo "   1. 访问 https://github.com/$USERNAME/my-goals/settings/pages"
echo "   2. Source 选择 'Deploy from a branch'"
echo "   3. Branch 选择 'main' → '/ (root)'"
echo "   4. 点击 Save"
echo ""
echo "🌐 你的目标地图将在几分钟后可用:"
echo "   https://$USERNAME.github.io/my-goals/"
echo ""
