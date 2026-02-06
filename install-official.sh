#!/bin/bash
# 官方/大厂 Skills 安装脚本
# 只安装官方和知名组织的 skills

set -e

echo "🏢 DevOps Skills Collection - 安装官方 Skills"
echo "================================================"
echo ""

# 检查 npx 是否可用
if ! command -v npx &> /dev/null; then
    echo "❌ 错误：未找到 npx 命令"
    echo "请先安装 Node.js: https://nodejs.org/"
    exit 1
fi

echo "📦 开始安装官方 Skills..."
echo ""

# Anthropic 官方
echo "🤖 安装 Anthropic 官方 Skills..."
npx skills add -g -y anthropics/skills@webapp-testing

# HashiCorp 官方
echo ""
echo "🔧 安装 HashiCorp 官方 Skills..."
npx skills add -g -y hashicorp/agent-skills@terraform-style-guide
npx skills add -g -y hashicorp/agent-skills@terraform-test
npx skills add -g -y hashicorp/agent-skills@terraform-stacks

# Redis 官方
echo ""
echo "🗄️  安装 Redis 官方 Skills..."
npx skills add -g -y redis/agent-skills@redis-development

# GitHub 官方
echo ""
echo "🐙 安装 GitHub 官方 Skills..."
npx skills add -g -y github/awesome-copilot@azure-devops-cli

echo ""
echo "✅ 安装完成！"
echo ""
echo "📝 已安装的官方 Skills："
echo "  - webapp-testing (Anthropic)"
echo "  - terraform-style-guide (HashiCorp)"
echo "  - terraform-test (HashiCorp)"
echo "  - terraform-stacks (HashiCorp)"
echo "  - redis-development (Redis)"
echo "  - azure-devops-cli (GitHub)"
echo ""
echo "⚠️  注意："
echo "  - 这些是唯一的官方/大厂 skills"
echo "  - 其他运维领域需要自建 skills"
echo "  - 查看 OFFICIAL_SKILLS.md 了解详情"
