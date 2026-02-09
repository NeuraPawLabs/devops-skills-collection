#!/bin/bash
# 每日 Skills 发现脚本
# 搜索新的官方/大厂运维 skills
# v2: 并行执行 + 精简关键词 + 减少等待时间
#
# 优化记录 (2026-02-09):
#   - 关键词从 19 个精简到 16 个（去掉 sysadmin/incident/monitoring）
#   - sleep 从 2s 降到 0.5s
#   - 串行改为并行（最多 4 个同时执行）
#   - 预计总耗时从 ~5min 降到 ~1min

set -euo pipefail

REPO_DIR="$HOME/devops-skills-collection"
DATE=$(date +%Y-%m-%d)
LOG_FILE="$REPO_DIR/logs/discovery-$DATE.log"
MAX_PARALLEL=4
TMPDIR_SEARCH=$(mktemp -d "/tmp/skills-discovery-XXXXXX")

trap 'rm -rf "$TMPDIR_SEARCH"' EXIT

mkdir -p "$REPO_DIR/logs"

log() { echo "$*" | tee -a "$LOG_FILE"; }

log "🔍 开始每日 Skills 发现 - $DATE"
log "================================================"
log ""

# 官方组织白名单（用 | 分隔，供 grep -E 使用）
TRUSTED_ORGS_RE="^(anthropics|hashicorp|redis|microsoft|github|vercel-labs|docker|kubernetes|prometheus|grafana|elastic|mongodb|postgresql|nginx|apache|mysql|ansible|puppet|chef|terraform|aws|google|azure)$"

# 运维相关关键词（精简版）
# 去掉了:
#   sysadmin  → 被 devops + linux 覆盖
#   incident  → 被 troubleshooting 覆盖
#   monitoring → 被 prometheus + grafana 覆盖
KEYWORDS=(
    "devops"
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
    "security"
    "backup"
    "troubleshooting"
)

log "📋 共 ${#KEYWORDS[@]} 个关键词，最多 $MAX_PARALLEL 个并行"
log ""

# 单个关键词搜索（在子进程中运行，输出写入临时文件）
search_one() {
    local keyword=$1
    local outlog="$TMPDIR_SEARCH/$keyword.log"
    local outskills="$TMPDIR_SEARCH/$keyword.skills"

    echo "🔎 搜索关键词: $keyword" > "$outlog"

    # 执行搜索（< /dev/null 防止交互式挂起）
    npx skills find "$keyword" < /dev/null > "$TMPDIR_SEARCH/raw-$keyword.txt" 2>&1 || true

    # 提取 skills（格式：owner/repo@skill）— 先去除 ANSI 颜色码
    sed 's/\x1b\[[0-9;]*m//g' "$TMPDIR_SEARCH/raw-$keyword.txt" \
        | grep -oE '[a-zA-Z0-9_-]+/[a-zA-Z0-9_.-]+@[a-zA-Z0-9_-]+' \
        | while read -r line; do
            owner=$(echo "$line" | cut -d'/' -f1)
            if echo "$owner" | grep -qxE "$TRUSTED_ORGS_RE"; then
                echo "  ✅ 发现官方 skill: $line" >> "$outlog"
                echo "$line" >> "$outskills"
            fi
        done

    sleep 0.5  # 短暂延迟避免请求过快
}

# 并行执行（信号量控制并发数）
running=0
for keyword in "${KEYWORDS[@]}"; do
    search_one "$keyword" &
    running=$((running + 1))

    # 达到并行上限时，等待任意一个完成再继续
    if [ "$running" -ge "$MAX_PARALLEL" ]; then
        wait -n 2>/dev/null || true
        running=$((running - 1))
    fi
done
wait  # 等待所有剩余任务完成

# 按关键词顺序合并结果到日志
for keyword in "${KEYWORDS[@]}"; do
    [ -f "$TMPDIR_SEARCH/$keyword.log" ] && cat "$TMPDIR_SEARCH/$keyword.log" >> "$LOG_FILE"
    [ -f "$TMPDIR_SEARCH/$keyword.skills" ] && cat "$TMPDIR_SEARCH/$keyword.skills" >> "$REPO_DIR/logs/new-skills-$DATE.txt"
done

log ""
log "✅ 搜索完成！"

# 汇总结果
if [ -f "$REPO_DIR/logs/new-skills-$DATE.txt" ]; then
    # 去重
    sort -u "$REPO_DIR/logs/new-skills-$DATE.txt" -o "$REPO_DIR/logs/new-skills-$DATE.txt"
    NEW_COUNT=$(wc -l < "$REPO_DIR/logs/new-skills-$DATE.txt")
    log "📊 发现 $NEW_COUNT 个官方 skills"
    log ""
    log "新发现的 skills："
    cat "$REPO_DIR/logs/new-skills-$DATE.txt" | tee -a "$LOG_FILE"
else
    log "📊 未发现新的官方 skills"
fi

log ""
log "📝 日志保存在: $LOG_FILE"
