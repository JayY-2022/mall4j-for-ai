/*
MCP Server 相关表结构
用于支持 MCP (Model Context Protocol) 工具接入
*/

-- 设置字符集为utf8mb4，确保中文正确显示
SET NAMES utf8mb4;

USE yami_shops;

/* 表结构：MCP 服务器注册表 */
DROP TABLE IF EXISTS `mcp_servers`;

CREATE TABLE `mcp_servers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `server_id` varchar(100) NOT NULL COMMENT '服务器唯一标识',
  `server_name` varchar(200) DEFAULT NULL COMMENT '服务器名称',
  `sse_url` varchar(500) NOT NULL COMMENT 'SSE连接端点URL',
  `auth_header` text COMMENT '认证信息（JSON格式：{header_name, token}）',
  `proxy` varchar(500) DEFAULT NULL COMMENT '代理配置（可选）',
  `timeout_ms` int(11) DEFAULT 5000 COMMENT '超时时间（毫秒）',
  `status` tinyint(4) DEFAULT 0 COMMENT '状态：1-UP，0-DOWN',
  `last_checked` datetime DEFAULT NULL COMMENT '最后健康检查时间',
  `retry_backoff` int(11) DEFAULT 1 COMMENT '重试退避系数（秒）',
  `description` varchar(500) DEFAULT NULL COMMENT '服务器描述',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_server_id` (`server_id`),
  KEY `idx_status` (`status`),
  KEY `idx_last_checked` (`last_checked`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='MCP服务器注册表';

/* 表结构：MCP 工具目录表 */
DROP TABLE IF EXISTS `mcp_tools`;

CREATE TABLE `mcp_tools` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `server_id` varchar(100) NOT NULL COMMENT '所属服务器ID',
  `tool_name` varchar(200) NOT NULL COMMENT '工具名称',
  `tool_description` text COMMENT '工具描述',
  `version` varchar(50) DEFAULT NULL COMMENT '工具版本',
  `input_schema` text COMMENT '输入参数Schema（JSON）',
  `output_schema` text COMMENT '输出结果Schema（JSON）',
  `category` varchar(100) DEFAULT NULL COMMENT '工具分类',
  `timeout_ms` int(11) DEFAULT 5000 COMMENT '调用超时时间（毫秒）',
  `retryable` tinyint(4) DEFAULT 0 COMMENT '是否可重试：1-是，0-否',
  `last_seen` datetime DEFAULT NULL COMMENT '最后发现时间',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_server_tool` (`server_id`,`tool_name`),
  KEY `idx_server_id` (`server_id`),
  KEY `idx_tool_name` (`tool_name`),
  KEY `idx_category` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='MCP工具目录表';

/* 表结构：MCP 工具绑定关系表 */
DROP TABLE IF EXISTS `mcp_bindings`;

CREATE TABLE `mcp_bindings` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `principal_type` varchar(50) NOT NULL COMMENT '主体类型：agent/api_key/tenant',
  `principal_id` varchar(200) NOT NULL COMMENT '主体ID（agent_id/api_key/tenant_id）',
  `server_id` varchar(100) NOT NULL COMMENT 'MCP服务器ID',
  `tool_name` varchar(200) NOT NULL COMMENT '工具名称',
  `alias` varchar(200) DEFAULT NULL COMMENT '工具别名（可选）',
  `status` tinyint(4) DEFAULT 1 COMMENT '状态：1-启用，0-禁用',
  `shop_id` bigint(20) DEFAULT NULL COMMENT '店铺ID（多租户隔离）',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_principal_server_tool` (`principal_type`,`principal_id`,`server_id`,`tool_name`),
  KEY `idx_principal` (`principal_type`,`principal_id`),
  KEY `idx_server_tool` (`server_id`,`tool_name`),
  KEY `idx_status` (`status`),
  KEY `idx_shop_id` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='MCP工具绑定关系表';

/* 表结构：MCP 工具调用日志表 */
DROP TABLE IF EXISTS `mcp_tool_call_log`;

CREATE TABLE `mcp_tool_call_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `trace_id` varchar(64) NOT NULL COMMENT '追踪ID',
  `session_id` varchar(64) DEFAULT NULL COMMENT '会话ID',
  `tool_call_id` varchar(64) NOT NULL COMMENT '工具调用ID',
  `parent_call_id` varchar(64) DEFAULT NULL COMMENT '父调用ID',
  `server_id` varchar(100) NOT NULL COMMENT 'MCP服务器ID',
  `tool_name` varchar(200) NOT NULL COMMENT '工具名称',
  `user_id` varchar(64) DEFAULT NULL COMMENT '用户ID',
  `shop_id` bigint(20) DEFAULT NULL COMMENT '店铺ID',
  `agent_id` varchar(100) DEFAULT NULL COMMENT 'Agent标识',
  `input_params` text COMMENT '输入参数（JSON）',
  `output_result` text COMMENT '输出结果（JSON）',
  `status` tinyint(4) NOT NULL COMMENT '状态：1-成功，0-失败，2-超时',
  `error_code` varchar(50) DEFAULT NULL COMMENT '错误码',
  `error_message` text DEFAULT NULL COMMENT '错误信息',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `duration` int(11) DEFAULT NULL COMMENT '耗时（毫秒）',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_trace_id` (`trace_id`),
  KEY `idx_tool_call_id` (`tool_call_id`),
  KEY `idx_server_tool` (`server_id`,`tool_name`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_create_time` (`create_time`),
  KEY `idx_agent_id` (`agent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='MCP工具调用日志表';

/* 表结构：MCP API Key 管理表 */
DROP TABLE IF EXISTS `mcp_api_keys`;

CREATE TABLE `mcp_api_keys` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `api_key` varchar(200) NOT NULL COMMENT 'API Key（加密存储）',
  `api_key_name` varchar(200) DEFAULT NULL COMMENT 'API Key名称',
  `shop_id` bigint(20) DEFAULT NULL COMMENT '所属店铺ID',
  `allowed_tools` text COMMENT '允许调用的工具列表（JSON数组）',
  `rate_limit_rpm` int(11) DEFAULT 60 COMMENT '每分钟请求限制',
  `rate_limit_rph` int(11) DEFAULT 1000 COMMENT '每小时请求限制',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `status` tinyint(4) DEFAULT 1 COMMENT '状态：1-启用，0-禁用',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_api_key` (`api_key`),
  KEY `idx_shop_id` (`shop_id`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='MCP API Key管理表';

/* 插入示例数据 */
INSERT INTO `mcp_servers` (`server_id`, `server_name`, `sse_url`, `auth_header`, `timeout_ms`, `status`, `description`) 
VALUES 
('mall4j-main', 'Mall4j主服务器', 'http://localhost:8087/mcp/sse', '{"Authorization": "Bearer demo-token"}', 5000, 1, 'Mall4j电商系统MCP服务器');

INSERT INTO `mcp_tools` (`server_id`, `tool_name`, `tool_description`, `category`, `input_schema`, `retryable`) 
VALUES 
('mall4j-main', 'mall4j.product.search', '商品搜索', 'product', '{"type":"object","properties":{"keyword":{"type":"string"},"pageNum":{"type":"integer"},"pageSize":{"type":"integer"}}}', 1),
('mall4j-main', 'mall4j.order.get_detail', '获取订单详情', 'order', '{"type":"object","properties":{"orderId":{"type":"string","required":true}}}', 1);

