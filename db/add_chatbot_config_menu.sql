/*
 * 添加智能客服配置菜单项
 */

-- 设置字符集为utf8mb4，确保中文正确显示
SET NAMES utf8mb4;

-- 添加菜单项（如果不存在）
INSERT INTO `tz_sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
SELECT 317, 1, '智能客服配置', 'admin/chatbot-config', 'sys:chatbot:config', 1, 'service', 8
WHERE NOT EXISTS (SELECT 1 FROM `tz_sys_menu` WHERE `menu_id` = 317);

-- 为超级管理员角色添加菜单权限（如果不存在）
INSERT INTO `tz_sys_role_menu` (`role_id`, `menu_id`)
SELECT 1, 317
WHERE NOT EXISTS (SELECT 1 FROM `tz_sys_role_menu` WHERE `role_id` = 1 AND `menu_id` = 317);

