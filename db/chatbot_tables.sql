/*
 * Chatbot conversation history table
 */
CREATE TABLE IF NOT EXISTS `chatbot_conversation` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` varchar(64) NOT NULL COMMENT '用户ID',
  `session_id` varchar(64) NOT NULL COMMENT '会话ID',
  `message` text NOT NULL COMMENT '用户消息',
  `response` text COMMENT '客服回复',
  `status` tinyint DEFAULT 1 COMMENT '状态：1-成功，0-失败',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_session_id` (`session_id`),
  KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='智能客服聊天记录表';

