---
theme: default
background: https://cover.sli.dev
class: text-center
highlighter: shiki
lineNumbers: false
info: |
  AI Skill 赋能：前端开发者的自助创新革命
drawings:
  persist: false
transition: fade
title: AI Skill 赋能
---

# AI Skill 赋能

## 前端开发者的自助创新革命

<div class="pt-12">
  <span @click="$slidev.nav.next" class="px-2 py-1 rounded cursor-pointer" hover="bg-white bg-opacity-10">
    Press Space for next page <carbon:arrow-right class="inline"/>
  </span>
</div>

---

# 🎯 为什么需要 AI Skill？

<v-clicks>

## 前端开发者日常痛点
- **重复性工作**: 环境配置、文档生成、代码模板
- **上下文切换**: 在多个工具和平台间切换  
- **知识孤岛**: 团队经验无法有效沉淀和复用
- **创新瓶颈**: 被日常需求束缚，缺乏时间探索新技术

## AI Skill 的价值
- **自动化**: 将重复工作交给 AI 自动完成
- **集成化**: 统一的交互界面，减少上下文切换
- **知识化**: 将团队经验封装成可复用的 Skill
- **赋能化**: 让每个开发者都能成为解决方案提供者

</v-clicks>

---

# 🧠 AI 基础概念科普（前端视角）

<v-clicks>

## 大模型 (LLM) = 超级智能函数
- **传统函数**: `function(input) → output`
- **大模型**: `LLM(prompt) → intelligent_output`
- **类比**: 就像你调用一个超级智能的 API，它能理解自然语言并返回有用的结果

## RAG (检索增强生成) = 数据库查询 + 智能处理
- **传统方式**: `SELECT * FROM docs WHERE keyword = 'AI'`
- **RAG 方式**: "请基于我们的技术文档，解释 AI Skill 的概念"
- **优势**: 结合了精确检索和智能生成

## Agent = 自主任务执行器
- **传统脚本**: 线性执行预定义步骤
- **Agent**: 能够自主规划、调用工具、处理异常
- **类比**: 就像一个智能的 CI/CD 流水线，但能根据情况动态调整

</v-clicks>

---

# 🛠️ 核心概念详解（前端类比）

<v-clicks>

## Skill = 可复用的智能组件
- **React Component**: 封装 UI 逻辑和状态
- **AI Skill**: 封装业务逻辑和 AI 调用
- **共同点**: 高内聚、低耦合、可组合

## MCP (Model Context Protocol) = AI 通信协议
- **HTTP/REST**: 客户端-服务器通信标准
- **MCP**: AI Agent 与工具之间的通信标准
- **作用**: 让不同 AI 工具能够互相协作

## Command = 用户交互接口
- **CLI Command**: `git commit -m "message"`
- **AI Command**: `skill create-knowledge-theme "主题名"`
- **设计原则**: 简单、一致、可预测

</v-clicks>

---

# 🌟 优秀 Skill 实践案例

<v-clicks>

## 1. Slidev 演示文稿生成
- **场景**: 技术分享需要制作演示文稿
- **Skill**: 自动生成 Slidev 模板 + 内容框架
- **价值**: 节省 80% 的演示文稿制作时间

## 2. GitHub 仓库管理  
- **场景**: 新项目需要标准化的仓库结构
- **Skill**: 自动创建 README、Rules、目录结构
- **价值**: 确保团队项目的一致性和规范性

## 3. 大模型应用洞察
- **场景**: 需要了解最新 AI 技术趋势
- **Skill**: 自动生成大模型发展脉络和对比分析
- **价值**: 快速掌握复杂技术领域的核心信息

## 4. 前端工具链集成
- **场景**: 项目初始化需要配置开发环境
- **Skill**: 自动安装依赖、配置 ESLint、Prettier 等
- **价值**: 新成员快速上手，减少配置错误

</v-clicks>

---

# 🚀 如何开发你的第一个 Skill？

<v-clicks>

## 步骤 1: 识别适合的场景
- **重复性**: 是否经常做同样的事情？
- **规则性**: 是否有明确的输入输出规则？
- **价值性**: 自动化后能带来多少时间节省？

## 步骤 2: 设计 Skill 结构
```bash
my-skill/
├── SKILL.md          # 技能说明文档
├── scripts/          # 核心脚本
│   └── main.sh       # 主执行脚本
└── templates/        # 模板文件
```

## 步骤 3: 实现核心逻辑
- 使用 Shell/Python/Node.js 编写脚本
- 集成 AI 调用（如果需要）
- 处理用户输入和错误情况

## 步骤 4: 测试和优化
- 本地测试功能完整性
- 验证用户体验流畅性  
- 收集反馈并迭代改进

</v-clicks>

---

# 🔍 如何验证 Skill 的效果？

<v-clicks>

## 功能验证
- **正确性**: Skill 是否按预期工作？
- **稳定性**: 在不同环境下是否都能正常运行？
- **健壮性**: 能否处理各种异常情况？

## 用户体验验证  
- **易用性**: 命令是否直观易懂？
- **反馈**: 执行过程中是否有清晰的进度提示？
- **文档**: 是否有完整的使用说明？

## 价值验证
- **时间节省**: 相比手动操作节省了多少时间？
- **质量提升**: 输出结果的质量是否更稳定？
- **采用率**: 团队成员是否愿意使用这个 Skill？

## 持续优化
- **监控**: 跟踪 Skill 的使用情况
- **反馈**: 收集用户建议和问题
- **迭代**: 定期更新和改进 Skill

</v-clicks>

---

# 🎯 行动号召

<v-clicks>

## 今天就开始你的第一个 Skill！

### 选择一个痛点
- 文档生成？环境配置？代码模板？
- 任何让你觉得"又要做一遍"的事情

### 用 1 小时创建 MVP
- 不需要完美，先让它能工作
- 使用我们提供的模板和最佳实践

### 分享给团队
- 在团队内展示你的 Skill
- 收集反馈并持续改进

### 成为 AI 创新者
- 从需求消费者变成解决方案提供者
- 用 AI Skill 放大你的影响力

</v-clicks>

---

# 💡 Q&A

## 常见问题解答

<v-clicks>

- **Q: 我需要懂机器学习吗？**
  - A: 不需要！就像使用 React 不需要懂浏览器渲染原理

- **Q: Skill 会替代我的工作吗？**  
  - A: 不会！Skill 是你的助手，帮你从重复工作中解放出来

- **Q: 如何开始学习？**
  - A: 从模仿开始！参考现有的 Skill，然后创造自己的

- **Q: 团队如何协作？**
  - A: 通过 Git 管理 Skill，建立共享的知识库

</v-click>

---

# 🙏 感谢大家！

## 让我们一起开启 AI Skill 创新之旅

### 联系方式
- **GitHub**: teeeemoji/claw
- **文档**: 查看 knowledge/ 目录下的详细指南

### 下一步行动
1. **克隆仓库**: `git clone https://github.com/teeeemoji/claw.git`
2. **探索现有 Skill**: 查看 skills/ 目录
3. **创建你的第一个 Skill**: 从解决一个小痛点开始

<div class="pt-8">
  <span class="text-sm opacity-75">AI Skill 赋能 · 前端开发者的自助创新革命</span>
</div>