---
theme: seriph
background: https://cdn.jsdelivr.net/gh/antfu/slidev-theme-seriph@master/backgrounds/gradient-1.svg
class: text-center
highlighter: shiki
lineNumbers: false
monaco: true
title: 大模型 AI 应用：前端开发者指南
mdc: true
---

# 大模型 AI 应用<br>前端开发者指南

<div class="pt-12">
  <span>@teeeemoji</span>
</div>

<div class="abs-b mx-auto px-4 py-2">
  <img src="https://github.com/teeeemoji.png" class="h-8 rounded-full inline-block align-middle" />
  <span class="inline-block align-middle ml-2">teeeemoji/claw</span>
</div>

---

## 前端开发者的新机遇

<v-clicks>

- **AI 不是威胁，而是放大器**
- **前端成为 AI 应用的"大脑协调器"**
- **用户体验决定 AI 应用成败**
- **你比任何人都懂用户交互**

</v-clicks>

<div class="abs-b mx-auto px-4 py-2">
  <img src="https://cdn.jsdelivr.net/gh/antfu/slidev-theme-seriph@master/backgrounds/gradient-1.svg" class="h-4 opacity-20" />
</div>

---

## 核心概念解析

### RAG (Retrieval-Augmented Generation)

<v-click>

**传统 LLM**: 用户问题 → 直接回答<br>
**RAG 系统**: 用户问题 + 知识库检索 → 生成答案

</v-click>

<v-click>

```ts {all|3-5|7-9|11-13}
// 前端实现 RAG
const ragQuery = async (question) => {
  // 1. 向量数据库检索
  const relevantDocs = await searchVectorDB(question);
  
  // 2. 构建增强提示词
  const prompt = `
    基于以下文档回答问题：
    ${relevantDocs.join('\n')}
    
    问题：${question}
  `;
  
  // 3. 调用 LLM API
  return await callLLM(prompt);
};
```

</v-click>

---

## 核心概念解析

### Skill（技能）

<v-click>

**Skill = 可重用的 AI 功能模块**

</v-click>

<v-click>

```ts {all|2-6|8-12|14-18}
// 定义 Skills
const skills = {
  searchWeb: async (query) => {
    // 网络搜索技能
    return await fetchSearchResults(query);
  },
  
  generateCode: async (description) => {
    // 代码生成技能
    return await llm.generateCode(description);
  },
  
  sendEmail: async (to, subject, body) => {
    // 邮件发送技能
    return await emailService.send(to, subject, body);
  }
};
```

</v-click>

<v-click>

**前端角色**: Skill 的调度者和协调者
</v-click>

---

## 核心概念解析

### Command（命令） & Rules（规则）

<v-click>

**Command**: 用户的具体指令<br>
**Rules**: 系统的行为约束

</v-click>

<v-click>

```ts {all|2-5|7-10}
// Command 处理
const handleCommand = (command) => {
  if (command.type === 'create_presentation') {
    return createSlidevPresentation(command.topic);
  }
};

// Rules 定义
const rules = {
  maxTokens: 2000,
  allowedDomains: ['github.com', 'npmjs.com'],
  safetyChecks: true
};
```

</v-click>

<v-click>

**前端实现**: 命令解析器 + 规则引擎
</v-click>

---

## 发展脉络

### 大模型演进

<v-clicks>

- **2017**: Transformer 革命 🔄
- **2018**: BERT 预训练范式 📚
- **2020**: GPT-3 API 优先时代 ⚡
- **2022**: ChatGPT 对话式交互 💬
- **2024+**: 多模态 & Agent 时代 🤖

</v-clicks>

### 应用架构演进

<v-clicks>

- **问答阶段**: 直接调用 LLM
- **上下文阶段**: 管理对话历史  
- **RAG 阶段**: 知识库增强
- **Agent 阶段**: 多工具协调

</v-clicks>

---

## 实际应用案例

### 案例 1: 智能客服系统

<v-click>

```ts
// 前端实现要点
const SmartCustomerService = () => {
  const [question, setQuestion] = useState('');
  const [answer, setAnswer] = useState('');
  
  const handleSubmit = async () => {
    // RAG 查询
    const response = await fetch('/api/rag', {
      method: 'POST',
      body: JSON.stringify({ question })
    });
    setAnswer(await response.text());
  };
  
  return (
    <div>
      <input value={question} onChange={(e) => setQuestion(e.target.value)} />
      <button onClick={handleSubmit}>提问</button>
      <div>{answer}</div>
    </div>
  );
};
```

</v-click>

---

## 实际应用案例

### 案例 2: AI Agent 控制面板

<v-click>

```ts
// Agent 状态管理
const agentState = reactive({
  status: 'idle',
  currentStep: null,
  executionLog: [],
  availableSkills: ['search', 'code', 'email']
});

// 执行可视化
const ExecutionVisualizer = () => {
  return (
    <div className="agent-execution">
      {agentState.executionLog.map((step, index) => (
        <ExecutionStep key={index} step={step} />
      ))}
    </div>
  );
};
```

</v-click>

<v-click>

**前端优势**: 实时数据流 + 复杂状态管理 + 进度可视化
</v-click>

---

## 前端开发者的独特价值

<v-clicks>

### 🎯 用户体验设计
- 设计合理的用户-AI 交互模式
- 处理 AI 的不确定性和错误
- 优化响应速度和加载体验

### ⚡ 实时交互能力  
- 处理流式响应 (Streaming)
- 实现实时进度反馈
- 管理复杂的状态转换

### 🔧 工具集成专家
- 协调多个 AI 工具
- 构建统一的操作界面
- 实现智能缓存和降级

</v-clicks>

---

## 快速开始

### 创建你的第一个 AI 应用

<v-clicks>

1. **选择应用场景**: 客服、代码助手、内容创作等
2. **设计交互流程**: 用户输入 → AI 处理 → 结果展示  
3. **选择技术栈**: RAG、Agent、还是简单问答？
4. **实现核心功能**: 使用现有的 AI API
5. **优化用户体验**: 错误处理、加载状态、缓存策略

</v-clicks>

<v-click>

```bash
# 使用你的 claw 知识库
git clone git@github.com:teeeemoji/claw.git
cd claw
npm run dev # 查看知识库演示
```

</v-click>

---

# 谢谢！

### 开始构建你的 AI 应用吧！🚀

<div class="pt-12">
  <a href="https://github.com/teeeemoji/claw" target="_blank" class="!text-xl !opacity-80">github.com/teeeemoji/claw</a>
</div>

<div class="abs-b mx-auto px-4 py-2">
  <img src="https://github.com/teeeemoji.png" class="h-8 rounded-full inline-block align-middle" />
  <span class="inline-block align-middle ml-2">@teeeemoji</span>
</div>