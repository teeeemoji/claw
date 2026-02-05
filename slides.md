---
theme: seriph
title: Claw 知识库使用指南
background: '#f0f0f0'
class: 'text-center'
highlighter: shiki
lineNumbers: true
monaco: true
mdc: true
---

# Claw 知识库

## 个人知识管理的最佳实践

<div class="abs-b-r m-4">
  <span>teeeemoji</span>
</div>

---

## 目录

<v-clicks>

- 知识库架构
- 贡献流程  
- 技术栈介绍
- 最佳实践
- Q&A

</v-clicks>

---

## 知识库架构

```tree
claw/
├── README.md
├── Rules.md
├── slides.md          <!-- 当前演示文稿 -->
├── presentations/     <!-- 所有演示文稿 -->
│   └── ai-applications-talk/
├── ai-applications-for-frontend-devs/
├── programming/
├── devops/
└── personal-notes/
```

<v-click>

每个知识领域都有独立的目录，便于组织和维护。

</v-click>

---

## 贡献流程

### 1. 创建分支
```bash
git checkout -b knowledge/topic-name
```

### 2. 创建知识目录
```bash
mkdir topic-name-for-knowledge
```

### 3. 开发内容
- 编写文档
- 创建代码示例  
- 添加演示文稿

### 4. 提交评审
```bash
git add .
git commit -m "Add knowledge about topic"
git push origin knowledge/topic-name
```

<v-click>

**重要**: 每个知识任务必须在独立分支开发！

</v-click>

---

## 技术栈

### 核心工具
- **Git**: 版本控制和协作
- **Markdown**: 文档编写标准
- **Slidev**: 演示文稿制作

### 开发环境
- **Node.js**: 运行 Slidev 和其他工具
- **VS Code**: 推荐编辑器（支持 Slidev 插件）
- **Moltbot**: AI 助手，协助知识整理

### 自动化
- **GitHub Actions**: CI/CD（可选）
- **Prettier**: 代码格式化
- **ESLint**: JavaScript 代码检查

---

## Slidev 演示文稿规范

### 文件命名
- 主演示文稿: `slides.md`
- 子演示文稿: `presentations/topic/slides.md`

### 目录结构
```
topic-name/
├── README.md      # 知识概述
├── index.md       # 学习路径索引  
├── concepts.md    # 核心概念
├── examples/      # 代码示例
└── presentations/ # 演示文稿
    └── slides.md
```

### 前端友好特性
<v-clicks>

- 实时预览（热重载）
- 代码高亮和执行
- 响应式设计
- 导出 PDF/PPTX
- GitHub Pages 部署

</v-clicks>

---

## 最佳实践

### 文档编写
- 使用简洁明了的语言
- 包含实际代码示例
- 添加可视化图表
- 保持一致性

### 代码示例
- 可运行的完整示例
- 适当的注释说明
- 错误处理示例
- 性能优化建议

### 演示文稿
- 重点突出关键概念
- 使用动画逐步展示
- 包含互动元素
- 适配不同设备

---

## 开始你的第一个贡献

### 步骤 1: 克隆仓库
```bash
git clone git@github.com:teeeemoji/claw.git
cd claw
```

### 步骤 2: 安装依赖
```bash
npm install
```

### 步骤 3: 启动演示文稿
```bash
npm run dev
```

### 步骤 4: 创建新知识
```bash
# 创建新分支
git checkout -b knowledge/my-topic

# 创建目录和内容
mkdir my-topic-for-knowledge
```

---

# 谢谢！

## 开始构建你的知识库吧 🚀

<div class="grid grid-cols-2 gap-4 mt-10">
  <div>
    <h3>GitHub</h3>
    <a href="https://github.com/teeeemoji/claw" target="_blank">github.com/teeeemoji/claw</a>
  </div>
  <div>
    <h3>联系方式</h3>
    <span>@teeeemoji</span>
  </div>
</div>