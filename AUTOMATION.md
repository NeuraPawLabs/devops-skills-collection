# DevOps Skills Collection - 每日自动发现

## 📅 定时任务设置

### 方案 A：使用 OpenClaw Cron（推荐）

OpenClaw 内置 cron 功能，可以在 Gateway 重启后自动恢复。

**设置方法：**
```bash
# 添加每日 10:00 执行的任务
openclaw cron add --schedule "0 10 * * *" \
  --payload '{"kind":"systemEvent","text":"运行 DevOps Skills 每日发现脚本"}' \
  --session-target main \
  --name "daily-skills-discovery"
```

**查看任务：**
```bash
openclaw cron list
```

**手动触发：**
```bash
openclaw cron run <jobId>
```

### 方案 B：使用系统 Crontab

**添加 crontab：**
```bash
crontab -e
```

**添加以下行（每天 10:00 执行）：**
```
0 10 * * * cd $HOME/devops-skills-collection && ./scripts/daily-update.sh >> logs/cron.log 2>&1
```

**查看 crontab：**
```bash
crontab -l
```

## 🔄 工作流程

1. **每天 10:00 自动执行**
2. **搜索 20+ 个运维关键词**
3. **筛选官方/大厂 skills**
4. **保存到日志文件**
5. **如果有新发现，提交到 Git**
6. **提示手动审查**

## 📁 日志文件

- `logs/discovery-YYYY-MM-DD.log` - 每日搜索日志
- `logs/new-skills-YYYY-MM-DD.txt` - 新发现的 skills
- `logs/cron.log` - Cron 执行日志

## 🔍 手动运行

```bash
cd ~/devops-skills-collection
./scripts/daily-update.sh
```

## 📊 审查新 Skills

当发现新的官方 skills 时：

1. **查看详情：**
   ```bash
   npx skills info <owner/repo@skill>
   ```

2. **访问 GitHub 仓库：**
   ```
   https://github.com/<owner>/<repo>
   ```

3. **审查代码：**
   - 查看 SKILL.md
   - 检查 scripts/ 目录
   - 确认维护者身份

4. **更新文档：**
   - 如果确认安全，添加到 `OFFICIAL_SKILLS.md`
   - 更新 `install-official.sh`
   - 提交并推送

## 🏷️ 官方组织白名单

当前监控的官方组织：
- anthropics
- hashicorp
- redis
- microsoft
- github
- vercel-labs
- docker
- kubernetes
- prometheus
- grafana
- elastic
- mongodb
- postgresql
- nginx
- apache
- mysql
- ansible
- puppet
- chef
- terraform
- aws
- google
- azure

## 🔧 自定义

**添加新的关键词：**
编辑 `scripts/daily-discovery.sh`，在 `KEYWORDS` 数组中添加。

**添加新的官方组织：**
编辑 `scripts/daily-discovery.sh`，在 `TRUSTED_ORGS` 数组中添加。

---

**最后更新：** 2026-02-06
