# Claw 知识库

个人知识整理中心，涵盖技术、学习、项目等各个领域的知识。

## 🌐 在线演示

**知识库演示文稿**: [https://teeeemoji.github.io/claw/](https://teeeemoji.github.io/claw/)

## 📚 知识库结构

- **按主题分类**：每个知识领域使用独立文件夹
- **命名规范**：小写中划线分割（如 `ai-applications-for-frontend-devs`）
- **演示文稿**：使用 Slidev 创建知识分享演示文稿（`slides.md`）

## 🎯 使用指南

### 1. 知识整理流程
1. 创建符合命名规范的文件夹
2. 在独立分支上进行开发
3. 完成后提交评审
4. 评审通过后合并到 main 分支

### 2. Slidev 演示文稿
本仓库根目录包含 `slides.md` 文件，用于创建知识库使用指南和重要概念的演示文稿。

**启动演示文稿**：
```bash
npm install
npm run dev
```

**构建生产版本**：
```bash
npm run build
```

**导出 PDF**：
```bash
npm run export
```

### 3. 目录约定
```
claw/
├── slides.md              # 知识库演示文稿
├── package.json           # Slidev 依赖
├── Rules.md               # 仓库管理规则
├── knowledge-topic-1/     # 知识主题 1
├── knowledge-topic-2/     # 知识主题 2
└── presentations/         # 独立演示文稿（可选）
```

## 🚀 开始贡献

1. **Fork 仓库** 或直接在本地克隆
2. **创建分支**：`git checkout -b knowledge/your-topic-name`
3. **添加内容**：创建文件夹并添加知识内容
4. **提交 PR**：推送分支并创建 Pull Request

## 📝 文档规范

- 使用 Markdown 格式
- 代码示例需要注释说明
- 保持内容简洁易懂
- 面向目标读者（如前端开发者）

## 🔧 技术栈

- **Slidev**：演示文稿框架
- **Markdown**：文档格式
- **Git**：版本控制
- **GitHub**：代码托管
- **GitHub Pages**：自动部署演示文稿

## 🤖 自动化部署

每次推送到 `main` 分支时，GitHub Actions 会自动：
1. 安装依赖并构建 Slidev 演示文稿
2. 部署到 GitHub Pages
3. 更新在线演示链接

---

> **提示**：前端开发者在 AI 时代的重要性不是降低，而是提升！你不仅是 UI 层，更是 AI 应用的"大脑协调器"。