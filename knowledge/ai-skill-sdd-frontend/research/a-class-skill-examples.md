# A类需求 Skill 实现示例

## 1. 文案替换 Skill 示例

### 需求场景
将登录页面的 "Sign In" 按钮文字改为 "Login"

### Skill 实现
```javascript
// 文案替换 Skill 核心逻辑
async function replaceCopyText(projectPath, oldText, newText, context = {}) {
  // 1. 智能定位文件
  const targetFiles = await locateCopyFiles(projectPath, oldText, context);
  
  // 2. 分析上下文
  const analysis = await analyzeContext(targetFiles, oldText);
  
  // 3. 执行安全替换
  const changes = await safeReplaceText(targetFiles, oldText, newText, analysis);
  
  // 4. 生成变更报告
  const report = generateChangeReport(changes);
  
  return { success: true, changes, report };
}

// 智能文件定位
async function locateCopyFiles(projectPath, searchText, context) {
  // 基于项目结构的智能搜索
  const patterns = [
    `${projectPath}/**/*.{js,jsx,ts,tsx,vue}`,
    `${projectPath}/src/**/components/**/*.{js,jsx,ts,tsx,vue}`,
    `${projectPath}/locales/**/*.json`
  ];
  
  // 考虑上下文信息（如页面名称、组件类型等）
  if (context.pageName) {
    patterns.push(`${projectPath}/src/pages/${context.pageName}/**/*`);
  }
  
  return searchFiles(patterns, searchText);
}
```

### 输入输出规范
- **输入**: 
  - `projectPath`: 项目根路径
  - `oldText`: "Sign In"
  - `newText`: "Login"  
  - `context`: { pageName: "login", componentType: "button" }
- **输出**:
  - `changes`: [{ file: "LoginButton.jsx", line: 25, old: "Sign In", new: "Login" }]
  - `report`: 变更摘要和影响分析

## 2. 逻辑开关 Skill 示例

### 需求场景
开启新功能的 feature flag

### Skill 实现
```javascript
// 逻辑开关 Skill 核心逻辑
async function toggleFeatureFlag(configPath, featureName, enabled = true) {
  // 1. 定位配置文件
  const configFile = await findConfigFile(configPath, ['feature-flags', 'config']);
  
  // 2. 解析配置格式
  const configFormat = detectConfigFormat(configFile);
  const configData = parseConfig(configFile, configFormat);
  
  // 3. 安全修改配置
  const updatedConfig = updateFeatureFlag(configData, featureName, enabled);
  
  // 4. 验证配置有效性
  const isValid = await validateConfig(updatedConfig, configFormat);
  
  if (isValid) {
    // 5. 写入配置文件
    await writeConfig(configFile, updatedConfig, configFormat);
    return { success: true, configFile, featureName, enabled };
  } else {
    throw new Error('Invalid configuration after modification');
  }
}

// 特性开关更新
function updateFeatureFlag(config, featureName, enabled) {
  // 支持多种配置格式
  if (config.featureFlags) {
    config.featureFlags[featureName] = enabled;
  } else if (config.features) {
    config.features[featureName] = { enabled };
  } else {
    // 创建新的特性开关区域
    config.featureFlags = { [featureName]: enabled };
  }
  
  return config;
}
```

### 输入输出规范
- **输入**:
  - `configPath`: 配置文件路径或项目根路径
  - `featureName`: "newCheckoutFlow"
  - `enabled`: true
- **输出**:
  - `configFile`: "/src/config/feature-flags.js"
  - `featureName`: "newCheckoutFlow"  
  - `enabled`: true
  - `backupFile`: 配置文件备份路径

## 3. 配置变更 Skill 示例

### 需求场景
修改 API 超时时间从 5000ms 改为 10000ms

### Skill 实现
```javascript
// 配置变更 Skill 核心逻辑
async function updateApiTimeout(projectPath, newTimeout) {
  // 1. 定位 API 配置
  const apiConfigs = await findApiConfigFiles(projectPath);
  
  // 2. 提取当前超时配置
  const currentTimeouts = await extractCurrentTimeouts(apiConfigs);
  
  // 3. 验证新值合理性
  if (!validateTimeoutValue(newTimeout)) {
    throw new Error(`Invalid timeout value: ${newTimeout}`);
  }
  
  // 4. 执行配置更新
  const updates = await updateTimeoutConfig(apiConfigs, newTimeout);
  
  // 5. 生成回滚脚本
  const rollbackScript = generateRollbackScript(currentTimeouts);
  
  return { 
    success: true, 
    updates, 
    rollbackScript,
    validation: await testApiWithNewTimeout(newTimeout)
  };
}

// API 配置文件查找
async function findApiConfigFiles(projectPath) {
  const patterns = [
    `${projectPath}/src/config/api.js`,
    `${projectPath}/src/utils/api.js`, 
    `${projectPath}/src/services/**/*api*.js`,
    `${projectPath}/src/lib/axios.js`
  ];
  
  return findFilesByPatterns(patterns);
}
```

### 输入输出规范
- **输入**:
  - `projectPath`: 项目根路径
  - `newTimeout`: 10000
- **输出**:
  - `updates`: 修改的文件列表和具体变更
  - `rollbackScript`: 回滚脚本路径
  - `validation`: 验证测试结果

## 4. 数据调整 Skill 示例

### 需求场景
更新产品分类枚举值

### Skill 实现
```javascript
// 数据调整 Skill 核心逻辑
async function updateProductCategories(projectPath, categoryUpdates) {
  // 1. 定位数据文件
  const dataFiles = await findDataFiles(projectPath, ['categories', 'products']);
  
  // 2. 分析数据依赖
  const dependencies = await analyzeDataDependencies(dataFiles);
  
  // 3. 执行安全更新
  const changes = await applyCategoryUpdates(dataFiles, categoryUpdates);
  
  // 4. 验证数据一致性
  const consistencyCheck = await validateDataConsistency(changes, dependencies);
  
  // 5. 更新相关文档
  const docsUpdated = await updateRelatedDocs(projectPath, categoryUpdates);
  
  return {
    success: consistencyCheck.passed,
    changes,
    dependencies,
    docsUpdated,
    impactAnalysis: await analyzeImpactOnComponents(dependencies)
  };
}
```

### 输入输出规范
- **输入**:
  - `projectPath`: 项目根路径
  - `categoryUpdates`: { "electronics": "Electronics & Gadgets" }
- **输出**:
  - `changes`: 数据文件变更详情
  - `dependencies`: 相关组件和模块列表
  - `impactAnalysis`: 对现有功能的影响分析

## 技术实现要点

### 1. 安全性保障
- **变更预览**: 在实际修改前展示所有变更
- **自动备份**: 修改前自动创建备份文件
- **回滚机制**: 提供一键回滚功能
- **验证测试**: 自动运行相关测试用例

### 2. 智能定位
- **上下文感知**: 理解项目结构和代码语义
- **多格式支持**: 支持 JSON、YAML、JS、TS 等多种配置格式
- **模糊匹配**: 支持近似文本匹配和语义理解

### 3. 错误处理
- **详细日志**: 记录每一步的操作和结果
- **优雅降级**: 在失败时提供手动操作建议
- **冲突检测**: 检测并处理潜在的代码冲突

### 4. 集成能力
- **Git 集成**: 自动生成有意义的提交信息
- **CI/CD 集成**: 支持在 CI 流程中使用
- **IDE 集成**: 提供 VS Code 插件或其他 IDE 支持

这些具体的 Skill 实现示例展示了 A 类需求的自动化处理是完全可行的，并且能够保证安全性和可靠性。