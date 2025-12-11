# 智能客服 API Key 字段迁移说明

## 概述
为 `chatbot_config` 表添加 `api_key` 字段，用于存储第三方 Agent 服务的 API Key。

## 迁移步骤

### 1. 检查表结构
```sql
DESCRIBE chatbot_config;
```

### 2. 执行迁移脚本
如果表中没有 `api_key` 字段，执行以下 SQL：

```sql
ALTER TABLE `chatbot_config` 
ADD COLUMN `api_key` varchar(255) DEFAULT NULL COMMENT 'API Key（用于外部接口认证）' AFTER `api_path`;
```

或者直接执行迁移脚本：
```bash
mysql -h${MYSQL_HOST} -P${MYSQL_PORT} -u${MYSQL_USERNAME} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE} < db/add_chatbot_api_key.sql
```

### 3. 验证
```sql
DESCRIBE chatbot_config;
-- 应该能看到 api_key 字段
```

## 功能说明

### 前端配置
- 位置：管理后台 -> 智能客服配置
- 字段：API Key（密码输入框，支持显示/隐藏）
- 说明：用于认证外部接口，如果第三方 Agent 服务需要 API Key 认证，请在此填写

### 后端使用
- API Key 优先级：数据库配置 > 配置文件（`chatbot.api.api-key`）
- 请求头：`X-API-Key: {apiKey}`
- 使用场景：调用 `/ext/v1/chat/stream` 等需要认证的外部接口

## 注意事项
1. API Key 是可选字段，如果第三方服务不需要认证，可以留空
2. 前端使用密码输入框，输入时会被隐藏
3. API Key 存储在数据库中，建议定期更换

