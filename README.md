# DevOps Skills Collection

> 🚀 精选的 DevOps/运维 Agent Skills 集合  
> 整合现有优质 skills + 补充传统运维领域空白

## 📋 项目目标

1. **整合现有**：收集和评估 skills.sh 生态中的优质 DevOps skills
2. **填补空白**：补充传统运维领域（Linux、数据库、中间件等）的 skills
3. **快速部署**：提供一键安装脚本，快速搭建运维工具链
4. **知识沉淀**：记录最佳实践和使用经验

## 🗂️ 目录结构

```
devops-skills-collection/
├── README.md                    # 本文件
├── skills-index.md              # 完整 skills 索引
├── install-all.sh               # 一键安装脚本
├── categories/                  # 按分类整理的 skills 清单
│   ├── 01-linux-sysadmin.md    # Linux 系统管理
│   ├── 02-network.md           # 网络管理
│   ├── 03-storage.md           # 存储管理
│   ├── 04-security.md          # 安全与合规
│   ├── 05-monitoring.md        # 监控与告警
│   ├── 06-database.md          # 数据库运维
│   ├── 07-middleware.md        # 中间件管理
│   ├── 08-automation.md        # 自动化与配置管理
│   ├── 09-container.md         # 容器与编排
│   ├── 10-cloud-native.md      # 云原生与微服务
│   ├── 11-cost.md              # 成本与容量
│   ├── 12-incident.md          # 故障处理
│   └── 13-testing.md           # 测试与验证
└── custom/                      # 自定义 skills（填补空白）
    └── README.md
```

## 🚀 快速开始

### ⚠️ 安全提示

本项目提供两种安装方式：

1. **官方 Skills（推荐）** - 只安装官方和大厂的 skills，安全可靠
2. **所有 Skills** - 包含个人开发者的 skills，需自行审查

### 安装官方 Skills（推荐）

```bash
# 克隆本仓库
git clone https://github.com/NeuraPawLabs/devops-skills-collection.git
cd devops-skills-collection

# 一键安装官方 skills（Anthropic、HashiCorp、Redis、GitHub）
./install-official.sh
```

查看官方 skills 清单：[OFFICIAL_SKILLS.md](OFFICIAL_SKILLS.md)

### 安装所有 Skills（包含个人开发者）

```bash
# ⚠️ 警告：包含个人开发者的 skills，请先审查代码
./install-all.sh
```

### 按分类安装

```bash
# 只安装监控相关 skills
./install-category.sh monitoring

# 只安装数据库相关 skills
./install-category.sh database
```

### 手动安装单个 skill

查看 `categories/` 目录下的分类文件，找到你需要的 skill，然后：

```bash
npx skills add <owner/repo@skill>
```

## 📊 当前状态

- ✅ 项目初始化
- 🔄 正在进行：系统性搜索和评估现有 skills
- ⏳ 待完成：识别空白领域
- ⏳ 待完成：创建自定义 skills

## 🤝 贡献

欢迎提交 PR 补充优质 skills 或改进文档！

## 📝 License

MIT

---

**维护者：** [@NeuraPawLabs](https://github.com/NeuraPawLabs)  
**最后更新：** 2026-02-06
