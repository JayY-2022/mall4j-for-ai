/*
 * Chatbot configuration table
 */
CREATE TABLE IF NOT EXISTS `chatbot_config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `url` varchar(255) DEFAULT NULL COMMENT 'Agent 服务地址',
  `timeout` int DEFAULT 30000 COMMENT '请求超时时间（毫秒）',
  `session_timeout` bigint DEFAULT 300000 COMMENT '会话超时时间（毫秒）',
  `enabled` tinyint(1) DEFAULT 1 COMMENT '是否启用',
  `memory_enable` tinyint(1) DEFAULT 1 COMMENT '是否启用记忆功能',
  `api_path` varchar(255) DEFAULT '/api/chat/stream' COMMENT 'API 路径',
  `api_key` varchar(255) DEFAULT NULL COMMENT 'API Key（用于外部接口认证）',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='智能客服配置表';

-- 插入默认配置（如果不存在）
INSERT INTO `chatbot_config` (`url`, `timeout`, `session_timeout`, `enabled`, `memory_enable`, `api_path`)
SELECT 'http://localhost:8000', 30000, 300000, 1, 1, '/api/chat/stream'
WHERE NOT EXISTS (SELECT 1 FROM `chatbot_config` LIMIT 1);

