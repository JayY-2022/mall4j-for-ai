-- ============================================
-- 修复数据库字符集为 utf8mb4（安全版本，只修复存在的表）
-- 解决中文乱码问题
-- ============================================

-- 1. 修复数据库默认字符集
ALTER DATABASE `yami_shops` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 2. 修复产品表 tz_prod 的字符集（如果存在）
SET @table_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'yami_shops' AND table_name = 'tz_prod');
SET @sql = IF(@table_exists > 0, 'ALTER TABLE `tz_prod` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci', 'SELECT "Table tz_prod does not exist, skipping"');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 3. 修复其他相关表的字符集（如果存在）
SET @table_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'yami_shops' AND table_name = 'tz_prod_comm');
SET @sql = IF(@table_exists > 0, 'ALTER TABLE `tz_prod_comm` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci', 'SELECT "Table tz_prod_comm does not exist, skipping"');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @table_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'yami_shops' AND table_name = 'tz_prod_favorite');
SET @sql = IF(@table_exists > 0, 'ALTER TABLE `tz_prod_favorite` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci', 'SELECT "Table tz_prod_favorite does not exist, skipping"');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @table_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'yami_shops' AND table_name = 'tz_prod_tag');
SET @sql = IF(@table_exists > 0, 'ALTER TABLE `tz_prod_tag` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci', 'SELECT "Table tz_prod_tag does not exist, skipping"');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @table_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'yami_shops' AND table_name = 'tz_prod_tag_reference');
SET @sql = IF(@table_exists > 0, 'ALTER TABLE `tz_prod_tag_reference` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci', 'SELECT "Table tz_prod_tag_reference does not exist, skipping"');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @table_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'yami_shops' AND table_name = 'tz_prod_prop');
SET @sql = IF(@table_exists > 0, 'ALTER TABLE `tz_prod_prop` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci', 'SELECT "Table tz_prod_prop does not exist, skipping"');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @table_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'yami_shops' AND table_name = 'tz_prod_prop_value');
SET @sql = IF(@table_exists > 0, 'ALTER TABLE `tz_prod_prop_value` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci', 'SELECT "Table tz_prod_prop_value does not exist, skipping"');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @table_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'yami_shops' AND table_name = 'tz_sku');
SET @sql = IF(@table_exists > 0, 'ALTER TABLE `tz_sku` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci', 'SELECT "Table tz_sku does not exist, skipping"');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @table_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'yami_shops' AND table_name = 'tz_order');
SET @sql = IF(@table_exists > 0, 'ALTER TABLE `tz_order` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci', 'SELECT "Table tz_order does not exist, skipping"');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @table_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'yami_shops' AND table_name = 'tz_order_item');
SET @sql = IF(@table_exists > 0, 'ALTER TABLE `tz_order_item` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci', 'SELECT "Table tz_order_item does not exist, skipping"');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @table_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'yami_shops' AND table_name = 'tz_user');
SET @sql = IF(@table_exists > 0, 'ALTER TABLE `tz_user` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci', 'SELECT "Table tz_user does not exist, skipping"');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @table_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'yami_shops' AND table_name = 'tz_user_addr');
SET @sql = IF(@table_exists > 0, 'ALTER TABLE `tz_user_addr` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci', 'SELECT "Table tz_user_addr does not exist, skipping"');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @table_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'yami_shops' AND table_name = 'tz_shop_cart');
SET @sql = IF(@table_exists > 0, 'ALTER TABLE `tz_shop_cart` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci', 'SELECT "Table tz_shop_cart does not exist, skipping"');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @table_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'yami_shops' AND table_name = 'tz_category');
SET @sql = IF(@table_exists > 0, 'ALTER TABLE `tz_category` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci', 'SELECT "Table tz_category does not exist, skipping"');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @table_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'yami_shops' AND table_name = 'tz_brand');
SET @sql = IF(@table_exists > 0, 'ALTER TABLE `tz_brand` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci', 'SELECT "Table tz_brand does not exist, skipping"');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

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

