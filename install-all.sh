#!/bin/bash
# DevOps Skills Collection - 一键安装脚本
# 安装推荐的核心 skills

set -e

echo "🚀 DevOps Skills Collection - 安装推荐核心 Skills"
echo "================================================"
echo ""

# 检查 npx 是否可用
if ! command -v npx &> /dev/null; then
    echo "❌ 错误：未找到 npx 命令"
    echo "请先安装 Node.js: https://nodejs.org/"
    exit 1
fi

echo "📦 开始安装..."
echo ""

# Linux 基础
echo "🐧 安装 Linux 系统管理 Skills..."
npx skills add -g -y sickn33/antigravity-awesome-skills@bash-linux
npx skills add -g -y sickn33/antigravity-awesome-skills@linux-production-shell-scripts

# 数据库
echo ""
echo "🗄️  安装数据库运维 Skills..."
npx skills add -g -y mindrally/skills@mysql-best-practices
npx skills add -g -y mindrally/skills@redis-best-practices

# 网络
echo ""
echo "🌐 安装网络管理 Skills..."
npx skills add -g -y aj-geddes/useful-ai-prompts@nginx-configuration
npx skills add -g -y patricio0312rev/skills@nginx-config-optimizer

# 自动化
echo ""
echo "🔄 安装自动化 Skills..."
npx skills add -g -y aj-geddes/useful-ai-prompts@ansible-automation
npx skills add -g -y jeremylongshore/claude-code-plugins-plus-skills@ansible-playbook-generator

echo ""
echo "✅ 安装完成！"
echo ""
echo "📝 已安装的 Skills："
echo "  - bash-linux (Linux 基础)"
echo "  - linux-production-shell-scripts (生产环境脚本)"
echo "  - mysql-best-practices (MySQL 最佳实践)"
echo "  - redis-best-practices (Redis 最佳实践)"
echo "  - nginx-configuration (Nginx 配置)"
echo "  - nginx-config-optimizer (Nginx 优化)"
echo "  - ansible-automation (Ansible 自动化)"
echo "  - ansible-playbook-generator (Ansible Playbook 生成)"
echo ""
echo "🔍 查看更多 Skills："
echo "  cat skills-index.md"
echo ""
echo "📚 查看分类详情："
echo "  ls categories/"
