#!/bin/bash
# 每日 Skills 发现脚本
# 搜索新的官方/大厂运维 skills

set -e

REPO_DIR="$HOME/devops-skills-collection"
DATE=$(date +%Y-%m-%d)
LOG_FILE="$REPO_DIR/logs/discovery-$DATE.log"

mkdir -p "$REPO_DIR/logs"

echo "🔍 开始每日 Skills 发现 - $DATE" | tee -a "$LOG_FILE"
echo "================================================" | tee -a "$LOG_FILE"
echo "" | tee -a "$LOG_FILE"

# 官方组织白名单
TRUSTED_ORGS=(
    "anthropics"
    "hashicorp"
    "redis"
    "microsoft"
    "github"
    "vercel-labs"
    "docker"
    "kubernetes"
    "prometheus"
    "grafana"
    "elastic"
    "mongodb"
    "postgresql"
    "nginx"
    "apache"
    "mysql"
    "ansible"
    "puppet"
    "chef"
    "terraform"
    "aws"
    "google"
    "azure"
)

# 运维相关关键词
KEYWORDS=(
    "devops"
    "sysadmin"
    "linux"
    "nginx"
    "mysql"
    "postgresql"
    "redis"
    "mongodb"
    "docker"
    "kubernetes"
    "ansible"
    "terraform"
    "prometheus"
    "grafana"
    "monitoring"
    "security"
    "backup"
    "incident"
    "troubleshooting"
)

# 搜索函数
search_skills() {
    local keyword=$1
    echo "🔎 搜索关键词: $keyword" | tee -a "$LOG_FILE"
    
    # 执行搜索（< /dev/null 防止交互式挂起）
    npx skills find "$keyword" < /dev/null > /tmp/skills-search-$keyword.txt 2>&1 || true
    
    # 提取 skills（格式：owner/repo@skill）— 先去除 ANSI 颜色码
    sed 's/\x1b\[[0-9;]*m//g' /tmp/skills-search-$keyword.txt | grep -oE "[a-zA-Z0-9_-]+/[a-zA-Z0-9_.-]+@[a-zA-Z0-9_-]+" | while read -r line; do
        # 提取 owner
        owner=$(echo "$line" | cut -d'/' -f1)
        
        # 检查是否在白名单
        for trusted in "${TRUSTED_ORGS[@]}"; do
            if [[ "$owner" == "$trusted" ]]; then
                echo "  ✅ 发现官方 skill: $line" | tee -a "$LOG_FILE"
                echo "$line" >> "$REPO_DIR/logs/new-skills-$DATE.txt"
            fi
        done
    done
    
    sleep 2  # 避免请求过快
}

# 遍历关键词搜索
for keyword in "${KEYWORDS[@]}"; do
    search_skills "$keyword"
done

echo "" | tee -a "$LOG_FILE"
echo "✅ 搜索完成！" | tee -a "$LOG_FILE"

# 检查是否有新发现
if [ -f "$REPO_DIR/logs/new-skills-$DATE.txt" ]; then
    NEW_COUNT=$(sort -u "$REPO_DIR/logs/new-skills-$DATE.txt" | wc -l)
    echo "📊 发现 $NEW_COUNT 个官方 skills" | tee -a "$LOG_FILE"
    echo "" | tee -a "$LOG_FILE"
    echo "新发现的 skills：" | tee -a "$LOG_FILE"
    sort -u "$REPO_DIR/logs/new-skills-$DATE.txt" | tee -a "$LOG_FILE"
else
    echo "📊 未发现新的官方 skills" | tee -a "$LOG_FILE"
fi

echo "" | tee -a "$LOG_FILE"
echo "📝 日志保存在: $LOG_FILE" | tee -a "$LOG_FILE"
