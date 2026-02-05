# 实际应用案例（前端开发者视角）

## 🎯 案例 1: 智能客服系统

### 需求场景
为电商网站添加智能客服，能够回答产品相关问题。

### 技术方案
```
用户提问 → RAG 系统 → 返回答案
```

### 前端实现要点
```javascript
// 1. 文档上传界面
const uploadDocuments = async (files) => {
  // 上传到向量数据库
  const response = await fetch('/api/documents', {
    method: 'POST',
    body: files
  });
};

// 2. 智能问答界面
const askQuestion = async (question) => {
  // 调用 RAG API
  const response = await fetch('/api/rag', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ question })
  });
  
  return response.json();
};

// 3. 对话历史管理
const conversationHistory = reactive([]);
```

### 关键技能
- 文件上传和处理
- 实时对话界面
- 错误处理和降级方案

## 🎯 案例 2: 代码助手插件

### 需求场景
在 IDE 中集成 AI 代码补全和解释功能。

### 技术方案
```
代码上下文 + 用户指令 → LLM → 生成代码/解释
```

### 前端实现要点
```javascript
// 1. 代码上下文提取
const getCurrentContext = () => {
  const currentFile = editor.getCurrentFile();
  const selectedCode = editor.getSelectedText();
  const cursorPosition = editor.getCursorPosition();
  
  return { currentFile, selectedCode, cursorPosition };
};

// 2. AI 功能调用
const generateCode = async (instruction) => {
  const context = getCurrentContext();
  const response = await fetch('/api/code-assist', {
    method: 'POST',
    body: JSON.stringify({ 
      instruction, 
      context 
    })
  });
  return response.json();
};

// 3. 结果展示
const showCodeSuggestion = (suggestion) => {
  editor.showPopup(suggestion.code, suggestion.explanation);
};
```

### 关键技能
- 编辑器 API 集成
- 上下文感知
- 安全的代码执行预览

## 🎯 案例 3: 内容创作工具

### 需求场景
帮助营销团队快速生成社交媒体内容。

### 技术方案
```
品牌指南 + 产品信息 + 创意方向 → LLM → 多种内容变体
```

### 前端实现要点
```javascript
// 1. 品牌资产管理系统
const BrandAssets = {
  tone: 'professional', // 语调
  keywords: ['innovative', 'reliable'], // 关键词
  examples: [...] // 示例内容
};

// 2. 内容生成界面
const ContentGenerator = () => {
  const [prompt, setPrompt] = useState('');
  const [variants, setVariants] = useState([]);
  
  const generateVariants = async () => {
    const response = await fetch('/api/content', {
      method: 'POST',
      body: JSON.stringify({
        prompt,
        brandAssets: BrandAssets,
        count: 3 // 生成3个变体
      })
    });
    setVariants(await response.json());
  };
  
  return (
    <div>
      <textarea value={prompt} onChange={(e) => setPrompt(e.target.value)} />
      <button onClick={generateVariants}>生成内容</button>
      {variants.map((variant, index) => (
        <ContentCard key={index} content={variant} />
      ))}
    </div>
  );
};
```

### 关键技能
- 表单和状态管理
- 内容预览和编辑
- A/B 测试框架

## 🎯 案例 4: AI Agent 控制面板

### 需求场景
构建一个能够协调多个 AI 工具的智能助手。

### 技术方案
```
用户目标 → Agent 规划 → 执行 Skills → 返回结果
```

### 前端实现要点
```javascript
// 1. Agent 状态管理
const agentState = reactive({
  status: 'idle', // idle, planning, executing, completed
  currentStep: null,
  executionLog: [],
  availableSkills: ['search', 'code', 'email', 'calendar']
});

// 2. 执行可视化
const ExecutionVisualizer = () => {
  return (
    <div className="agent-execution">
      {agentState.executionLog.map((step, index) => (
        <ExecutionStep 
          key={index}
          step={step}
          status={step.status}
        />
      ))}
    </div>
  );
};

// 3. 用户交互
const sendGoal = async (goal) => {
  agentState.status = 'planning';
  const response = await fetch('/api/agent', {
    method: 'POST',
    body: JSON.stringify({ goal })
  });
  
  // 监听执行进度
  const eventSource = new EventSource(`/api/agent/${response.id}/events`);
  eventSource.onmessage = (event) => {
    const update = JSON.parse(event.data);
    agentState.executionLog.push(update);
    agentState.status = update.status;
  };
};
```

### 关键技能
- 实时数据流处理
- 复杂状态管理
- 进度可视化

## 🔧 通用前端模式

### 1. Streaming Response 处理
```javascript
// 处理流式响应
const handleStream = async (response) => {
  const reader = response.body.getReader();
  const decoder = new TextDecoder();
  let result = '';
  
  while (true) {
    const { done, value } = await reader.read();
    if (done) break;
    
    result += decoder.decode(value);
    updateUI(result); // 实时更新 UI
  }
};
```

### 2. Error Handling & Fallback
```javascript
// AI 调用的错误处理
const safeAICall = async (apiCall) => {
  try {
    return await apiCall();
  } catch (error) {
    if (error.status === 429) {
      // 速率限制 - 显示友好提示
      showRateLimitMessage();
    } else if (error.status >= 500) {
      // 服务端错误 - 使用缓存或降级方案
      return getFallbackResponse();
    }
    throw error;
  }
};
```

### 3. Caching & Optimization
```javascript
// 智能缓存策略
const aiCache = new Map();

const getCachedResponse = (key, ttl = 3600000) => {
  const cached = aiCache.get(key);
  if (cached && Date.now() - cached.timestamp < ttl) {
    return cached.response;
  }
  return null;
};
```

## 💡 前端开发者的独特优势

1. **用户体验设计**: AI 应用的成功很大程度上取决于 UX
2. **实时交互**: 前端擅长处理实时数据流和用户反馈
3. **工具集成**: 前端天然适合集成多种工具和服务
4. **性能优化**: 前端知道如何优化加载和响应速度

记住：**你不是在替代 AI，而是在放大 AI 的价值！**