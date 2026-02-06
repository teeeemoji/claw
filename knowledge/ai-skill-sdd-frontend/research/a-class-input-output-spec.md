# A类需求 SDD 流程详细输入输出规范

## 1. 需求智能分类 (Demand Classification)

### 输入
- **原始需求描述**: 
  ```json
  {
    "type": "text",
    "content": "将登录页面的'立即注册'按钮文字改为'马上加入'",
    "source": "jira/PRD/document",
    "priority": "normal",
    "deadline": "2024-02-10"
  }
  ```

- **上下文信息**:
  ```json
  {
    "project": "web-app",
    "branch": "main",
    "existing_codebase": "/path/to/code",
    "tech_stack": ["react", "typescript", "tailwind"],
    "i18n_enabled": true
  }
  ```

### 输出
- **需求分类结果**:
  ```json
  {
    "demand_type": "A",
    "subtype": "copy_text_update",
    "complexity": "low",
    "estimated_time": "5m",
    "required_skills": ["copy-replacement", "i18n-update"],
    "impact_analysis": {
      "files_affected": ["src/pages/Login.tsx", "locales/zh-CN.json"],
      "risk_level": "minimal",
      "testing_required": false
    }
  }
  ```

## 2. 文案定位 (Copy Localization)

### 输入
- **分类结果**: 上述需求分类输出
- **代码库快照**: 当前代码库的文件结构和内容

### 输出
- **文案定位结果**:
  ```json
  {
    "target_files": [
      {
        "path": "src/pages/Login.tsx",
        "line_number": 45,
        "current_text": "立即注册",
        "context": "<Button>立即注册</Button>",
        "file_type": "tsx"
      },
      {
        "path": "locales/zh-CN.json", 
        "key": "login.register_button",
        "current_value": "立即注册",
        "file_type": "json"
      }
    ],
    "replacement_strategy": "exact_match",
    "backup_required": true
  }
  ```

## 3. 智能替换 (Intelligent Replacement)

### 输入
- **文案定位结果**: 上述定位输出
- **新文案内容**: "马上加入"

### 输出
- **替换执行结果**:
  ```json
  {
    "modifications": [
      {
        "file": "src/pages/Login.tsx",
        "original": "立即注册",
        "replaced": "马上加入",
        "status": "success",
        "diff": "@@ -42,7 +42,7 @@\n <Button>\n-  立即注册\n+  马上加入\n </Button>"
      },
      {
        "file": "locales/zh-CN.json",
        "original": "\"login.register_button\": \"立即注册\"",
        "replaced": "\"login.register_button\": \"马上加入\"",
        "status": "success",
        "diff": "-\"login.register_button\": \"立即注册\",\n+\"login.register_button\": \"马上加入\","
      }
    ],
    "backup_created": true,
    "backup_path": ".ai-skill-backup/20240205-copy-replacement/"
  }
  ```

## 4. 差异验证 (Difference Validation)

### 输入
- **替换执行结果**: 上述替换输出
- **验证规则配置**:
  ```json
  {
    "syntax_check": true,
    "i18n_consistency": true,
    "length_validation": true,
    "breaking_change_detection": true
  }
  ```

### 输出
- **验证结果**:
  ```json
  {
    "validation_passed": true,
    "checks": {
      "syntax_check": {
        "passed": true,
        "details": "All modified files pass syntax validation"
      },
      "i18n_consistency": {
        "passed": true, 
        "details": "All language files updated consistently"
      },
      "length_validation": {
        "passed": true,
        "details": "Text length within acceptable range (4 chars → 4 chars)"
      },
      "breaking_change_detection": {
        "passed": true,
        "details": "No breaking changes detected"
      }
    },
    "warnings": [],
    "errors": []
  }
  ```

## 5. 自动提交 (Auto Commit)

### 输入
- **验证结果**: 上述验证输出
- **提交配置**:
  ```json
  {
    "commit_convention": "conventional-commits",
    "auto_push": false,
    "create_pr": true,
    "reviewers": ["frontend-team"],
    "labels": ["automated-change", "copy-update"]
  }
  ```

### 输出
- **提交结果**:
  ```json
  {
    "commit_hash": "a1b2c3d4e5f6...",
    "commit_message": "feat(login): update register button text to '马上加入'",
    "branch_created": "feature/auto-copy-update-20240205",
    "pr_created": true,
    "pr_url": "https://github.com/teeeemoji/claw/pull/123",
    "status": "ready_for_review",
    "next_steps": [
      "Wait for team review",
      "Merge after approval",
      "Deploy to staging"
    ]
  }
  ```

## 错误处理和回滚机制

### 异常情况处理
- **语法错误**: 自动回滚到备份，生成错误报告
- **验证失败**: 停止流程，通知开发者手动处理  
- **权限问题**: 降级为生成补丁文件，供手动应用
- **冲突检测**: 检测到 Git 冲突时暂停并通知

### 回滚机制
- **自动备份**: 每次修改前创建完整备份
- **一键回滚**: 提供回滚脚本和命令
- **状态恢复**: 确保回滚后系统状态完全一致

## 性能和安全考虑

### 性能指标
- **处理时间**: 单个 A 类需求平均处理时间 < 2 分钟
- **资源消耗**: CPU < 10%, Memory < 100MB
- **并发支持**: 支持同时处理多个 A 类需求

### 安全保障
- **权限控制**: 只能修改指定类型的文件
- **内容过滤**: 防止注入恶意代码或不当内容
- **审计日志**: 完整记录所有操作和变更
- **人工审核**: 关键修改需要人工确认