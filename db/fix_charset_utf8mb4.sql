-- ============================================
-- 修复数据库字符集为 utf8mb4
-- 解决中文乱码问题
-- ============================================

-- 1. 修复数据库默认字符集
ALTER DATABASE `yami_shops` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 2. 修复产品表 tz_prod 的字符集
ALTER TABLE `tz_prod` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 3. 修复其他相关表的字符集（如果存在）
-- 商品评论表
ALTER TABLE `tz_prod_comm` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 商品收藏表
ALTER TABLE `tz_prod_favorite` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 商品分组表
ALTER TABLE `tz_prod_tag` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 商品分组关联表
ALTER TABLE `tz_prod_tag_reference` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 商品属性表（如果存在）
ALTER TABLE `tz_prod_prop` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 商品属性值表（如果存在）
ALTER TABLE `tz_prod_prop_value` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- SKU 表
ALTER TABLE `tz_sku` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 订单表
ALTER TABLE `tz_order` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 订单项表
ALTER TABLE `tz_order_item` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 用户表
ALTER TABLE `tz_user` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 用户地址表
ALTER TABLE `tz_user_addr` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 购物车表
ALTER TABLE `tz_shop_cart` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 类目表
ALTER TABLE `tz_category` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 品牌表
ALTER TABLE `tz_brand` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 验证修复结果
SELECT 
    TABLE_NAME,
    TABLE_COLLATION
FROM 
    information_schema.TABLES
WHERE 
    TABLE_SCHEMA = 'yami_shops'
    AND TABLE_NAME IN (
        'tz_prod', 'tz_prod_comm', 'tz_prod_favorite', 'tz_prod_tag',
        'tz_prod_tag_reference', 'tz_prod_prop', 'tz_prod_prop_value',
        'tz_sku', 'tz_order', 'tz_order_item', 'tz_user', 'tz_user_addr',
        'tz_shop_cart', 'tz_category', 'tz_brand'
    )
ORDER BY TABLE_NAME;

