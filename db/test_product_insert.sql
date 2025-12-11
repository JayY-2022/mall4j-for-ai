-- 测试商品插入语句
-- 商品：iPhone 15 Pro
-- 图片：2024/01/手机数码_cat01_prod001_iPhone_15_Pro_kus2c32y.jpg
-- 商品ID：78（下一个可用ID）
-- SKU ID：405（下一个可用ID）

-- 设置字符集为utf8mb4，确保中文正确显示
SET NAMES utf8mb4;

-- 1. 插入商品主表 tz_prod
INSERT INTO `tz_prod` (
    `prod_id`,
    `prod_name`,
    `shop_id`,
    `ori_price`,
    `price`,
    `brief`,
    `content`,
    `pic`,
    `imgs`,
    `status`,
    `category_id`,
    `sold_num`,
    `total_stocks`,
    `delivery_mode`,
    `delivery_template_id`,
    `create_time`,
    `update_time`,
    `putaway_time`,
    `version`
) VALUES (
    78,
    'Apple iPhone 15 Pro 移动联通电信5G手机',
    1,
    9999.00,
    8999.00,
    '6.1英寸超视网膜XDR显示屏，A17 Pro芯片，钛金属设计',
    '<div style="margin: 0px; padding: 0px; color: #666666; font-family: tahoma, arial, \'Microsoft YaHei\', \'Hiragino Sans GB\', u5b8bu4f53, sans-serif; font-size: 12px;" align="center">
        <p><img src="2024/01/手机数码_cat01_prod001_iPhone_15_Pro_kus2c32y.jpg" alt="iPhone 15 Pro" width="750" height="750" /></p>
        <p>iPhone 15 Pro 采用钛金属设计，配备A17 Pro芯片，支持5G网络，拥有强大的拍照和视频功能。</p>
    </div>',
    '2024/01/手机数码_cat01_prod001_iPhone_15_Pro_kus2c32y.jpg',
    '2024/01/手机数码_cat01_prod001_iPhone_15_Pro_kus2c32y.jpg',
    1,
    93,
    0,
    100,
    '{"hasUserPickUp": false, "hasShopDelivery": true}',
    47,
    NOW(),
    NOW(),
    NOW(),
    0
);

-- 2. 插入SKU表 tz_sku（至少需要一个SKU）
INSERT INTO `tz_sku` (
    `sku_id`,
    `prod_id`,
    `properties`,
    `ori_price`,
    `price`,
    `stocks`,
    `actual_stocks`,
    `update_time`,
    `rec_time`,
    `party_code`,
    `model_id`,
    `pic`,
    `sku_name`,
    `prod_name`,
    `version`,
    `weight`,
    `volume`,
    `status`,
    `is_delete`
) VALUES (
    405,
    78,
    '',
    9999.00,
    8999.00,
    0,
    100,
    NOW(),
    NOW(),
    NULL,
    NULL,
    '2024/01/手机数码_cat01_prod001_iPhone_15_Pro_kus2c32y.jpg',
    '',
    'Apple iPhone 15 Pro 移动联通电信5G手机',
    0,
    NULL,
    NULL,
    1,
    0
);

