/*
 * 为 chatbot_config 表添加 api_key 字段
 */
ALTER TABLE `chatbot_config` 
ADD COLUMN `api_key` varchar(255) DEFAULT NULL COMMENT 'API Key（用于外部接口认证）' AFTER `api_path`;

