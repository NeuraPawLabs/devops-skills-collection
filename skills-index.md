# Skills 索引

> 最后更新：2026-02-06

## 📊 统计

- **已搜索分类**：13/13 ✅
- **发现 Skills**：80+
- **推荐安装**：50+
- **待自建 Skills**：30+

## 🗂️ 分类索引

### ✅ 已完成搜索（全部）

1. **[Linux 系统管理](categories/01-linux-sysadmin.md)**
   - ✅ Bash/Shell 脚本（3 个 skills）
   - ✅ 生产环境脚本
   - ✅ 权限管理
   - ❌ 性能调优、systemd、故障排查（待自建）

2. **[网络管理](categories/02-network.md)**
   - ✅ Nginx 配置和优化（5 个 skills）
   - ❌ Apache、HAProxy、DNS、VPN、防火墙（待自建）

3. **[存储管理](categories/03-storage.md)**
   - ❌ 完全空白（LVM、RAID、Ceph、NFS 等待自建）

4. **[安全与合规](categories/04-security.md)**
   - ✅ 安全审查、API 安全（6 个 skills）
   - ✅ K8s 安全策略
   - ✅ AWS 渗透测试
   - ❌ SSL/TLS、SSH、漏洞扫描、合规检查（待自建）

5. **[监控与告警](categories/05-monitoring.md)**
   - ✅ Prometheus（5 个 skills）
   - ✅ Grafana（5 个 skills）
   - ✅ 数据库监控、基础设施监控
   - ❌ Alertmanager、ELK、APM、链路追踪（待自建）

6. **[数据库运维](categories/06-database.md)**
   - ✅ MySQL 最佳实践（4 个 skills）
   - ✅ Redis 最佳实践（4 个 skills）
   - ❌ PostgreSQL、MongoDB、深度运维（待自建）

7. **[中间件管理](categories/07-middleware.md)**
   - ✅ Kafka（5 个 skills）
   - ✅ Elasticsearch（4 个 skills）
   - ❌ RabbitMQ、ZooKeeper、etcd（待自建）

8. **[自动化与配置管理](categories/08-automation.md)**
   - ✅ Ansible（6 个 skills，覆盖较全）
   - ❌ Puppet、Chef、SaltStack（待自建）

9. **[容器与编排](categories/09-container.md)**
   - ✅ Docker（5 个 skills）
   - ✅ Kubernetes（6 个 skills）
   - ❌ Helm、Istio、容器安全（待自建）

10. **[云原生与微服务](categories/10-cloud-native.md)**
    - ✅ DevOps 工程师（4 个 skills）
    - ✅ Terraform（5 个 skills，HashiCorp 官方）
    - ✅ CI/CD（4 个 skills）
    - ✅ AWS（4 个 skills）
    - ✅ Azure DevOps
    - ❌ GCP、服务网格、API 网关、微服务模式（待自建）

11. **[成本与容量](categories/11-cost.md)**
    - ✅ 基础设施成本优化（1 个 skill）
    - ❌ 云成本分析、容量规划、自动扩缩容（待自建）

12. **[故障处理](categories/12-incident.md)**
    - ✅ 事故响应（4 个 skills）
    - ✅ 运维手册模板
    - ✅ 备份恢复（2 个 skills）
    - ❌ 故障排查、高可用架构、事后复盘（待自建）

13. **[测试与验证](categories/13-testing.md)**
    - ✅ Web 应用测试（Anthropic 官方）
    - ✅ E2E 测试、单元测试
    - ✅ 性能测试（4 个 skills）
    - ❌ 压力测试、混沌工程、基础设施测试（待自建）

## 🚀 快速安装

### 核心 Skills 一键安装

```bash
# 使用安装脚本
./install-all.sh

# 或手动安装
bash install-all.sh
```

### 推荐核心 Skills（手动安装）

```bash
# Linux 基础
npx skills add -g -y sickn33/antigravity-awesome-skills@bash-linux
npx skills add -g -y sickn33/antigravity-awesome-skills@linux-production-shell-scripts

# 数据库
npx skills add -g -y mindrally/skills@mysql-best-practices
npx skills add -g -y mindrally/skills@redis-best-practices

# 网络
npx skills add -g -y aj-geddes/useful-ai-prompts@nginx-configuration
npx skills add -g -y patricio0312rev/skills@nginx-config-optimizer

# 自动化
npx skills add -g -y aj-geddes/useful-ai-prompts@ansible-automation
npx skills add -g -y jeremylongshore/claude-code-plugins-plus-skills@ansible-playbook-generator

# 监控
npx skills add -g -y aj-geddes/useful-ai-prompts@prometheus-monitoring
npx skills add -g -y sickn33/antigravity-awesome-skills@grafana-dashboards

# 容器
npx skills add -g -y sickn33/antigravity-awesome-skills@docker-expert
npx skills add -g -y jeffallan/claude-skills@kubernetes-specialist

# DevOps
npx skills add -g -y davila7/claude-code-templates@senior-devops
npx skills add -g -y hashicorp/agent-skills@terraform-style-guide

# CI/CD
npx skills add -g -y mindrally/skills@ci-cd-best-practices

# 安全
npx skills add -g -y sickn33/antigravity-awesome-skills@security-review
npx skills add -g -y wshobson/agents@k8s-security-policies
```

### 按分类安装

详见各分类文档：
- [01-linux-sysadmin.md](categories/01-linux-sysadmin.md)
- [02-network.md](categories/02-network.md)
- [03-storage.md](categories/03-storage.md)
- [04-security.md](categories/04-security.md)
- [05-monitoring.md](categories/05-monitoring.md)
- [06-database.md](categories/06-database.md)
- [07-middleware.md](categories/07-middleware.md)
- [08-automation.md](categories/08-automation.md)
- [09-container.md](categories/09-container.md)
- [10-cloud-native.md](categories/10-cloud-native.md)
- [11-cost.md](categories/11-cost.md)
- [12-incident.md](categories/12-incident.md)
- [13-testing.md](categories/13-testing.md)

## 📝 待自建 Skills 优先级

### 🔥 高优先级（传统运维核心）

1. **mysql-ops** - MySQL 运维完整工具包
2. **redis-ops** - Redis 运维完整工具包
3. **nginx-ops** - Nginx 深度运维
4. **linux-troubleshooting** - Linux 故障排查
5. **k8s-troubleshooting** - Kubernetes 故障排查

### 🔶 中优先级

6. **postgresql-ops** - PostgreSQL 运维
7. **mongodb-ops** - MongoDB 运维
8. **kafka-ops** - Kafka 运维
9. **elasticsearch-ops** - Elasticsearch 运维
10. **helm-ops** - Helm Chart 管理
11. **istio-ops** - Istio 服务网格
12. **alertmanager-ops** - Alertmanager 告警管理
13. **elk-stack-ops** - ELK Stack 日志系统

### 🔷 低优先级

14. **apache-ops** - Apache 运维
15. **haproxy-ops** - HAProxy 负载均衡
16. **dns-management** - DNS 管理
17. **vpn-setup** - VPN 配置
18. **lvm-management** - LVM 逻辑卷管理
19. **ceph-ops** - Ceph 分布式存储
20. **rabbitmq-ops** - RabbitMQ 运维
21. **load-testing** - 压力测试
22. **chaos-engineering** - 混沌工程

## 📈 覆盖情况分析

### 覆盖较好的领域（5+ skills）
- ✅ Ansible 自动化（6 个）
- ✅ Kubernetes（6 个）
- ✅ Nginx（5 个）
- ✅ Prometheus（5 个）
- ✅ Grafana（5 个）
- ✅ Terraform（5 个）
- ✅ Kafka（5 个）
- ✅ Docker（5 个）

### 部分覆盖的领域（1-4 skills）
- ⚠️ MySQL（4 个，但偏开发）
- ⚠️ Redis（4 个，但偏开发）
- ⚠️ Elasticsearch（4 个）
- ⚠️ DevOps 工程师（4 个）
- ⚠️ CI/CD（4 个）
- ⚠️ AWS（4 个）
- ⚠️ 安全审查（6 个）
- ⚠️ 事故响应（4 个）

### 完全空白的领域
- ❌ 存储管理（LVM、RAID、Ceph、NFS）
- ❌ PostgreSQL 运维
- ❌ MongoDB 运维
- ❌ RabbitMQ
- ❌ ZooKeeper
- ❌ etcd
- ❌ Helm
- ❌ Istio
- ❌ GCP
- ❌ 压力测试
- ❌ 混沌工程

## 🎯 下一步

1. ✅ 完成所有 13 个分类的搜索
2. ⏳ 发布到 GitHub
3. ⏳ 开始自建高优先级 skills
4. ⏳ 持续更新和维护

---

**进度：** 100% (13/13 分类已搜索) ✅
