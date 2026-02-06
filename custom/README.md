# Custom Skills

这个目录用于存放我们自己创建的 skills，主要填补现有生态的空白领域。

## 📋 计划创建的 Skills

### 高优先级（传统运维核心）

- [ ] **mysql-ops** - MySQL 数据库运维
  - 备份恢复、主从配置、性能优化、慢查询分析
  
- [ ] **redis-ops** - Redis 运维
  - 持久化配置、主从/哨兵/集群、性能调优
  
- [ ] **nginx-ops** - Nginx 运维
  - 配置管理、性能调优、日志分析、SSL 证书
  
- [ ] **linux-troubleshooting** - Linux 故障排查
  - 系统性能分析、日志分析、网络诊断

### 中优先级

- [ ] **kafka-ops** - Kafka 运维
- [ ] **elasticsearch-ops** - Elasticsearch 运维
- [ ] **postgresql-ops** - PostgreSQL 运维
- [ ] **mongodb-ops** - MongoDB 运维

### 低优先级

- [ ] **backup-automation** - 备份自动化
- [ ] **log-analysis** - 日志分析
- [ ] **capacity-planning** - 容量规划

## 🔧 创建新 Skill

使用 OpenClaw 的 skill-creator skill：

```bash
# 初始化新 skill
cd custom/
npx skills init <skill-name>

# 或者手动创建
mkdir <skill-name>
cd <skill-name>
touch SKILL.md
mkdir scripts
```

## 📝 Skill 模板

参考 OpenClaw 的 AgentSkill 格式：

```markdown
---
name: skill-name
description: 简短描述
---

# Skill Name

## When to Use This Skill

描述使用场景...

## Prerequisites

依赖的工具和环境...

## Usage

使用方法和示例...
```

---

**注意：** 创建 skill 前，先搜索确认现有生态中没有类似的 skill。
