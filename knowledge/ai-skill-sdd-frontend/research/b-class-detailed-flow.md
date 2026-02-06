# B 类需求：轻量级 UI 需求详细 SDD 流程

## 🎯 需求特征
- **样式微调**: 仅调整颜色、间距、字体等样式
- **布局优化**: 仅调整组件位置、响应式断点  
- **交互增强**: 仅添加简单动画、过渡效果
- **特点**: 有 UI 变更但无需完整设计稿，基于现有组件进行调整

## 🔍 详细流程节点

### 1. 需求解析与分类 (Demand Parsing & Classification)
**输入**: 
- 设计变更描述（Figma 评论、设计系统更新、口头需求）
- 现有组件库和样式系统
- 项目技术栈（CSS-in-JS、Tailwind、SCSS 等）

**输出**: 
- 需求类型标签（B类-样式微调/B类-布局优化/B类-交互增强）
- 影响的组件范围
- 所需的设计系统 token 或变量

### 2. 组件定位与依赖分析 (Component Localization & Dependency Analysis)
**输入**: 
- 分类后的需求
- 代码库中的组件结构
- 样式依赖关系图

**输出**: 
- 需要修改的具体组件文件路径
- 相关的样式文件和变量定义
- 可能受影响的其他组件列表

### 3. 设计系统映射 (Design System Mapping)
**输入**: 
- 设计变更要求（如 "primary color 改为 #007AFF"）
- 当前设计系统配置
- 样式 token 映射关系

**输出**: 
- 对应的设计系统 token 更新方案
- 需要修改的样式变量列表
- 跨平台一致性检查结果

### 4. 智能样式生成 (Intelligent Style Generation)
**输入**: 
- 设计系统映射结果
- 目标技术栈的样式规范
- 现有代码的样式模式

**输出**: 
- 生成的样式代码（CSS/SCSS/Tailwind classes 等）
- 样式差异对比
- 格式化后的代码文件

### 5. 视觉回归测试 (Visual Regression Testing)
**输入**: 
- 生成的样式代码
- 基准视觉快照
- 测试用例配置

**输出**: 
- 视觉差异报告
- 回归测试通过/失败状态
- 建议的人工审核区域

### 6. 自动化提交与部署 (Automated Commit & Deployment)
**输入**: 
- 通过视觉回归测试的代码
- 提交信息模板
- 部署策略配置

**输出**: 
- Git 提交记录
- Pull Request（包含视觉差异截图）
- 预览环境部署链接

## 🛠️ 具体 Skill 实现

### 样式微调 Skill
```bash
# 输入：需求 "将所有 primary 按钮的圆角从 4px 改为 8px"
./style-adjustment-skill.sh \
  --project-path ./my-project \
  --property "border-radius" \
  --old-value "4px" \
  --new-value "8px" \
  --component-type "primary-button"

# 输出：
# ✅ Found 12 primary button instances across 5 components
# ✅ Updated design tokens in src/tokens/button.json
# ✅ Generated CSS changes for all affected components
# ✅ Ran visual regression tests - 3 minor differences detected
# ✅ Created PR with visual comparison screenshots
```

### 布局优化 Skill
```bash
# 输入：需求 "在移动端将导航栏从水平布局改为垂直布局"
./layout-optimization-skill.sh \
  --project-path ./my-project \
  --component "navigation-bar" \
  --breakpoint "mobile" \
  --layout-change "horizontal-to-vertical"

# 输出：
# ✅ Analyzed current navigation layout structure
# ✅ Generated responsive CSS for mobile breakpoint
# ✅ Updated component logic for vertical layout
# ✅ Tested on multiple device sizes
# ✅ Created PR with mobile preview link
```