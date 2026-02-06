#!/bin/bash
# 每日更新脚本
# 运行发现脚本，如果有新 skills 则更新仓库

set -e

REPO_DIR="$HOME/devops-skills-collection"
DATE=$(date +%Y-%m-%d)

cd "$REPO_DIR"

echo "🚀 开始每日更新流程 - $DATE"
echo ""

# 1. 运行发现脚本
echo "📡 步骤 1: 运行 Skills 发现..."
./scripts/daily-discovery.sh

# 2. 检查是否有新发现
if [ ! -f "logs/new-skills-$DATE.txt" ]; then
    echo ""
    echo "✅ 没有新发现，无需更新"
    exit 0
fi

NEW_COUNT=$(sort -u "logs/new-skills-$DATE.txt" | wc -l)

if [ "$NEW_COUNT" -eq 0 ]; then
    echo ""
    echo "✅ 没有新发现，无需更新"
    exit 0
fi

echo ""
echo "📊 发现 $NEW_COUNT 个新的官方 skills"
echo ""

# 3. 手动审查提示
echo "⚠️  请手动审查新发现的 skills："
echo ""
cat "logs/new-skills-$DATE.txt" | sort -u
echo ""
echo "审查步骤："
echo "1. 访问 GitHub 仓库查看代码"
echo "2. 确认是官方/大厂维护"
echo "3. 检查 SKILL.md 和 scripts/"
echo "4. 确认安全后，手动更新 OFFICIAL_SKILLS.md"
echo ""
echo "💡 提示：运行以下命令查看 skill 详情："
echo "   npx skills info <owner/repo@skill>"
echo ""

# 4. 提交日志
git add logs/
git commit -m "每日 Skills 发现 - $DATE

发现 $NEW_COUNT 个新的官方 skills
详见 logs/new-skills-$DATE.txt" || true

git push || true

echo ""
echo "✅ 日志已提交到仓库"
echo "📝 查看日志: logs/discovery-$DATE.log"
