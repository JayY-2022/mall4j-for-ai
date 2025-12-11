-- 批量插入测试商品数据
-- 生成时间: 2025-11-19 11:47:01
-- 商品数量: 47

-- 设置字符集为utf8mb4，确保中文正确显示
SET NAMES utf8mb4;

-- ============================================
-- 商品主表 tz_prod
-- ============================================

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
) VALUES
(
    78,
    'Apple iPhone 15 Pro 移动联通电信5G手机',
    1,
    9999.00,
    8999.00,
    '6.1英寸超视网膜XDR显示屏，A17 Pro芯片，钛金属设计',
    '<div style="margin: 0px; padding: 0px; color: #666666; font-family: tahoma, arial, ''Microsoft YaHei'', ''Hiragino Sans GB'', u5b8bu4f53, sans-serif; font-size: 12px;" align="center">
        <p><img src="2024/01/手机数码_cat01_prod001_iPhone_15_Pro_kus2c32y.jpg" alt="iPhone 15 Pro 采用钛金属设计，配备A17 Pro芯片，支持5G网络，拥有强大的拍照和视频功能。" width="750" height="750" /></p>
        <p><img src="2024/01/手机数码_cat01_prod010_小米14_crfzcodi.jpg" alt="iPhone 15 Pro 采用钛金属设计，配备A17 Pro芯片，支持5G网络，拥有强大的拍照和视频功能。" width="750" height="750" /></p>
        <p><img src="2024/01/手机数码_cat01_prod011_华为Mate_60_sjbdolqo.jpg" alt="iPhone 15 Pro 采用钛金属设计，配备A17 Pro芯片，支持5G网络，拥有强大的拍照和视频功能。" width="750" height="750" /></p>
        <p><img src="2024/01/手机数码_cat01_prod012_Samsung_Galaxy_S24_ysm6rswa.jpg" alt="iPhone 15 Pro 采用钛金属设计，配备A17 Pro芯片，支持5G网络，拥有强大的拍照和视频功能。" width="750" height="750" /></p>
        <p>iPhone 15 Pro 采用钛金属设计，配备A17 Pro芯片，支持5G网络，拥有强大的拍照和视频功能。</p>
    </div>',
    '2024/01/手机数码_cat01_prod001_iPhone_15_Pro_kus2c32y.jpg',
    '2024/01/手机数码_cat01_prod001_iPhone_15_Pro_kus2c32y.jpg,2024/01/手机数码_cat01_prod010_小米14_crfzcodi.jpg,2024/01/手机数码_cat01_prod011_华为Mate_60_sjbdolqo.jpg',
    1,
    93,
    0,
    309,
    '{"hasUserPickUp": false, "hasShopDelivery": true}',
    47,
    NOW(),
    NOW(),
    NOW(),
    0
),
(
    79,
    '小米14 5G智能手机',
    1,
    3999.00,
    3699.00,
    '徕卡光学镜头，骁龙8 Gen3处理器，120W快充',
    '<div style="margin: 0px; padding: 0px; color: #666666; font-family: tahoma, arial, ''Microsoft YaHei'', ''Hiragino Sans GB'', u5b8bu4f53, sans-serif; font-size: 12px;" align="center">
        <p><img src="2024/01/手机数码_cat01_prod002_小米14_ywt98pju.jpg" alt="小米14搭载徕卡光学镜头，配备骁龙8 Gen3处理器，支持120W快充，性能强劲。" width="750" height="750" /></p>
        <p><img src="2024/01/手机数码_cat01_prod020_华为Mate_60_4nbsfaa0.jpg" alt="小米14搭载徕卡光学镜头，配备骁龙8 Gen3处理器，支持120W快充，性能强劲。" width="750" height="750" /></p>
        <p><img src="2024/01/手机数码_cat01_prod021_Samsung_Galaxy_S24_ha5emuum.jpg" alt="小米14搭载徕卡光学镜头，配备骁龙8 Gen3处理器，支持120W快充，性能强劲。" width="750" height="750" /></p>
        <p><img src="2024/01/手机数码_cat01_prod022_iPad_Pro_fp9qm7if.jpg" alt="小米14搭载徕卡光学镜头，配备骁龙8 Gen3处理器，支持120W快充，性能强劲。" width="750" height="750" /></p>
        <p>小米14搭载徕卡光学镜头，配备骁龙8 Gen3处理器，支持120W快充，性能强劲。</p>
    </div>',
    '2024/01/手机数码_cat01_prod002_小米14_ywt98pju.jpg',
    '2024/01/手机数码_cat01_prod002_小米14_ywt98pju.jpg,2024/01/手机数码_cat01_prod020_华为Mate_60_4nbsfaa0.jpg,2024/01/手机数码_cat01_prod021_Samsung_Galaxy_S24_ha5emuum.jpg',
    1,
    93,
    0,
    159,
    '{"hasUserPickUp": false, "hasShopDelivery": true}',
    47,
    NOW(),
    NOW(),
    NOW(),
    0
),
(
    80,
    '华为Mate 60 Pro 5G手机',
    1,
    6999.00,
    6499.00,
    '麒麟9000S芯片，鸿蒙系统，超强拍照',
    '<div style="margin: 0px; padding: 0px; color: #666666; font-family: tahoma, arial, ''Microsoft YaHei'', ''Hiragino Sans GB'', u5b8bu4f53, sans-serif; font-size: 12px;" align="center">
        <p><img src="2024/01/手机数码_cat01_prod003_华为Mate_60_3umd03ae.jpg" alt="华为Mate 60 Pro搭载麒麟9000S芯片，运行鸿蒙系统，拥有超强的拍照能力。" width="750" height="750" /></p>
        <p><img src="2024/01/手机数码_cat01_prod030_Samsung_Galaxy_S24_v5mp6cnp.jpg" alt="华为Mate 60 Pro搭载麒麟9000S芯片，运行鸿蒙系统，拥有超强的拍照能力。" width="750" height="750" /></p>
        <p><img src="2024/01/手机数码_cat01_prod031_iPad_Pro_7bp1h71n.jpg" alt="华为Mate 60 Pro搭载麒麟9000S芯片，运行鸿蒙系统，拥有超强的拍照能力。" width="750" height="750" /></p>
        <p><img src="2024/01/手机数码_cat01_prod032_MacBook_Pro_cef4onzk.jpg" alt="华为Mate 60 Pro搭载麒麟9000S芯片，运行鸿蒙系统，拥有超强的拍照能力。" width="750" height="750" /></p>
        <p>华为Mate 60 Pro搭载麒麟9000S芯片，运行鸿蒙系统，拥有超强的拍照能力。</p>
    </div>',
    '2024/01/手机数码_cat01_prod003_华为Mate_60_3umd03ae.jpg',
    '2024/01/手机数码_cat01_prod003_华为Mate_60_3umd03ae.jpg,2024/01/手机数码_cat01_prod030_Samsung_Galaxy_S24_v5mp6cnp.jpg,2024/01/手机数码_cat01_prod031_iPad_Pro_7bp1h71n.jpg',
    1,
    93,
    0,
    206,
    '{"hasUserPickUp": false, "hasShopDelivery": true}',
    47,
    NOW(),
    NOW(),
    NOW(),
    0
),
(
    81,
    'Samsung Galaxy S24 Ultra 5G手机',
    1,
    8999.00,
    8499.00,
    '200MP主摄，S Pen手写笔，骁龙8 Gen3',
    '<div style="margin: 0px; padding: 0px; color: #666666; font-family: tahoma, arial, ''Microsoft YaHei'', ''Hiragino Sans GB'', u5b8bu4f53, sans-serif; font-size: 12px;" align="center">
        <p><img src="2024/01/手机数码_cat01_prod004_Samsung_Galaxy_S24_uasupvmv.jpg" alt="Samsung Galaxy S24 Ultra配备200MP主摄像头，支持S Pen手写笔，搭载骁龙8 Gen3处理器。" width="750" height="750" /></p>
        <p><img src="2024/01/手机数码_cat01_prod040_iPad_Pro_7z010z83.jpg" alt="Samsung Galaxy S24 Ultra配备200MP主摄像头，支持S Pen手写笔，搭载骁龙8 Gen3处理器。" width="750" height="750" /></p>
        <p><img src="2024/01/手机数码_cat01_prod041_MacBook_Pro_hihbizdq.jpg" alt="Samsung Galaxy S24 Ultra配备200MP主摄像头，支持S Pen手写笔，搭载骁龙8 Gen3处理器。" width="750" height="750" /></p>
        <p>Samsung Galaxy S24 Ultra配备200MP主摄像头，支持S Pen手写笔，搭载骁龙8 Gen3处理器。</p>
    </div>',
    '2024/01/手机数码_cat01_prod004_Samsung_Galaxy_S24_uasupvmv.jpg',
    '2024/01/手机数码_cat01_prod004_Samsung_Galaxy_S24_uasupvmv.jpg,2024/01/手机数码_cat01_prod040_iPad_Pro_7z010z83.jpg,2024/01/手机数码_cat01_prod041_MacBook_Pro_hihbizdq.jpg',
    1,
    93,
    0,
    143,
    '{"hasUserPickUp": false, "hasShopDelivery": true}',
    47,
    NOW(),
    NOW(),
    NOW(),
    0
),
(
    82,
    'Apple iPad Pro 12.9英寸平板电脑',
    1,
    8999.00,
    8499.00,
    'M2芯片，Liquid Retina XDR显示屏，支持Apple Pencil',
    '<div style="margin: 0px; padding: 0px; color: #666666; font-family: tahoma, arial, ''Microsoft YaHei'', ''Hiragino Sans GB'', u5b8bu4f53, sans-serif; font-size: 12px;" align="center">
        <p><img src="2024/01/手机数码_cat01_prod005_iPad_Pro_god0ale3.jpg" alt="iPad Pro搭载M2芯片，配备Liquid Retina XDR显示屏，支持Apple Pencil，性能卓越。" width="750" height="750" /></p>
        <p><img src="2024/01/手机数码_cat01_prod050_MacBook_Pro_obtyg5b9.jpg" alt="iPad Pro搭载M2芯片，配备Liquid Retina XDR显示屏，支持Apple Pencil，性能卓越。" width="750" height="750" /></p>
        <p><img src="2024/01/手机数码_cat01_prod051_AirPods_Pro_83x67z99.jpg" alt="iPad Pro搭载M2芯片，配备Liquid Retina XDR显示屏，支持Apple Pencil，性能卓越。" width="750" height="750" /></p>
        <p>iPad Pro搭载M2芯片，配备Liquid Retina XDR显示屏，支持Apple Pencil，性能卓越。</p>
    </div>',
    '2024/01/手机数码_cat01_prod005_iPad_Pro_god0ale3.jpg',
    '2024/01/手机数码_cat01_prod005_iPad_Pro_god0ale3.jpg,2024/01/手机数码_cat01_prod050_MacBook_Pro_obtyg5b9.jpg,2024/01/手机数码_cat01_prod051_AirPods_Pro_83x67z99.jpg',
    1,
    93,
    0,
    181,
    '{"hasUserPickUp": false, "hasShopDelivery": true}',
    47,
    NOW(),
    NOW(),
    NOW(),
    0
),
(
    83,
    'Apple MacBook Pro 14英寸笔记本电脑',
    1,
    15999.00,
    14999.00,
    'M3 Pro芯片，Liquid Retina XDR显示屏，18小时续航',
    '<div style="margin: 0px; padding: 0px; color: #666666; font-family: tahoma, arial, ''Microsoft YaHei'', ''Hiragino Sans GB'', u5b8bu4f53, sans-serif; font-size: 12px;" align="center">
        <p><img src="2024/01/手机数码_cat01_prod006_MacBook_Pro_b910zrsj.jpg" alt="MacBook Pro搭载M3 Pro芯片，配备Liquid Retina XDR显示屏，续航长达18小时。" width="750" height="750" /></p>
        <p><img src="2024/01/手机数码_cat01_prod060_AirPods_Pro_vwwkz8ri.jpg" alt="MacBook Pro搭载M3 Pro芯片，配备Liquid Retina XDR显示屏，续航长达18小时。" width="750" height="750" /></p>
        <p><img src="2024/01/手机数码_cat01_prod061_Apple_Watch_9vjy4qck.jpg" alt="MacBook Pro搭载M3 Pro芯片，配备Liquid Retina XDR显示屏，续航长达18小时。" width="750" height="750" /></p>
        <p><img src="2024/01/手机数码_cat01_prod062_iPhone_15_Pro_0wlwe015.jpg" alt="MacBook Pro搭载M3 Pro芯片，配备Liquid Retina XDR显示屏，续航长达18小时。" width="750" height="750" /></p>
        <p>MacBook Pro搭载M3 Pro芯片，配备Liquid Retina XDR显示屏，续航长达18小时。</p>
    </div>',
    '2024/01/手机数码_cat01_prod006_MacBook_Pro_b910zrsj.jpg',
    '2024/01/手机数码_cat01_prod006_MacBook_Pro_b910zrsj.jpg,2024/01/手机数码_cat01_prod060_AirPods_Pro_vwwkz8ri.jpg,2024/01/手机数码_cat01_prod061_Apple_Watch_9vjy4qck.jpg',
    1,
    93,
    0,
    481,
    '{"hasUserPickUp": false, "hasShopDelivery": true}',
    47,
    NOW(),
    NOW(),
    NOW(),
    0
),
(
    84,
    'Apple AirPods Pro 2 无线耳机',
    1,
    1899.00,
    1699.00,
    '主动降噪，空间音频，MagSafe充电盒',
    '<div style="margin: 0px; padding: 0px; color: #666666; font-family: tahoma, arial, ''Microsoft YaHei'', ''Hiragino Sans GB'', u5b8bu4f53, sans-serif; font-size: 12px;" align="center">
        <p><img src="2024/01/手机数码_cat01_prod007_AirPods_Pro_d2xr13rt.jpg" alt="AirPods Pro 2支持主动降噪和空间音频，配备MagSafe充电盒，音质出色。" width="750" height="750" /></p>
        <p><img src="2024/01/手机数码_cat01_prod070_Apple_Watch_q2sva3nh.jpg" alt="AirPods Pro 2支持主动降噪和空间音频，配备MagSafe充电盒，音质出色。" width="750" height="750" /></p>
        <p><img src="2024/01/手机数码_cat01_prod071_iPhone_15_Pro_b1n1n8vh.jpg" alt="AirPods Pro 2支持主动降噪和空间音频，配备MagSafe充电盒，音质出色。" width="750" height="750" /></p>
        <p>AirPods Pro 2支持主动降噪和空间音频，配备MagSafe充电盒，音质出色。</p>
    </div>',
    '2024/01/手机数码_cat01_prod007_AirPods_Pro_d2xr13rt.jpg',
    '2024/01/手机数码_cat01_prod007_AirPods_Pro_d2xr13rt.jpg,2024/01/手机数码_cat01_prod070_Apple_Watch_q2sva3nh.jpg,2024/01/手机数码_cat01_prod071_iPhone_15_Pro_b1n1n8vh.jpg',
    1,
    93,
    0,
    119,
    '{"hasUserPickUp": false, "hasShopDelivery": true}',
    47,
    NOW(),
    NOW(),
    NOW(),
    0
),
(
    85,
    'Apple Watch Series 9 智能手表',
    1,
    2999.00,
    2799.00,
    'S9芯片，全天候健康监测，GPS定位',
    '<div style="margin: 0px; padding: 0px; color: #666666; font-family: tahoma, arial, ''Microsoft YaHei'', ''Hiragino Sans GB'', u5b8bu4f53, sans-serif; font-size: 12px;" align="center">
        <p><img src="2024/01/手机数码_cat01_prod008_Apple_Watch_ma1awhu2.jpg" alt="Apple Watch Series 9搭载S9芯片，支持全天候健康监测和GPS定位。" width="750" height="750" /></p>
        <p><img src="2024/01/手机数码_cat01_prod080_iPhone_15_Pro_xwpum901.jpg" alt="Apple Watch Series 9搭载S9芯片，支持全天候健康监测和GPS定位。" width="750" height="750" /></p>
        <p><img src="2024/01/手机数码_cat01_prod081_小米14_4ovphs0h.jpg" alt="Apple Watch Series 9搭载S9芯片，支持全天候健康监测和GPS定位。" width="750" height="750" /></p>
        <p><img src="2024/01/手机数码_cat01_prod082_华为Mate_60_aefba3e2.jpg" alt="Apple Watch Series 9搭载S9芯片，支持全天候健康监测和GPS定位。" width="750" height="750" /></p>
        <p>Apple Watch Series 9搭载S9芯片，支持全天候健康监测和GPS定位。</p>
    </div>',
    '2024/01/手机数码_cat01_prod008_Apple_Watch_ma1awhu2.jpg',
    '2024/01/手机数码_cat01_prod008_Apple_Watch_ma1awhu2.jpg,2024/01/手机数码_cat01_prod080_iPhone_15_Pro_xwpum901.jpg,2024/01/手机数码_cat01_prod081_小米14_4ovphs0h.jpg',
    1,
    93,
    0,
    65,
    '{"hasUserPickUp": false, "hasShopDelivery": true}',
    47,
    NOW(),
    NOW(),
    NOW(),
    0
),
(
    86,
    'Dior 迪奥烈艳蓝金唇膏',
    1,
    380.00,
    350.00,
    '经典色号，持久显色，滋润不脱色',
    '<div style="margin: 0px; padding: 0px; color: #666666; font-family: tahoma, arial, ''Microsoft YaHei'', ''Hiragino Sans GB'', u5b8bu4f53, sans-serif; font-size: 12px;" align="center">
        <p><img src="2024/01/美妆护肤_cat02_prod001_Dior_口红_rfgmdvu6.jpg" alt="Dior烈艳蓝金唇膏采用经典配方，持久显色，滋润不脱色，打造完美唇妆。" width="750" height="750" /></p>
        <p><img src="2024/01/美妆护肤_cat02_prod010_Chanel_香水_8e99l99g.jpg" alt="Dior烈艳蓝金唇膏采用经典配方，持久显色，滋润不脱色，打造完美唇妆。" width="750" height="750" /></p>
        <p><img src="2024/01/美妆护肤_cat02_prod011_SK-II_神仙水_58fsm02n.jpg" alt="Dior烈艳蓝金唇膏采用经典配方，持久显色，滋润不脱色，打造完美唇妆。" width="750" height="750" /></p>
        <p><img src="2024/01/美妆护肤_cat02_prod012_LOreal_粉底_91ahks11.jpg" alt="Dior烈艳蓝金唇膏采用经典配方，持久显色，滋润不脱色，打造完美唇妆。" width="750" height="750" /></p>
        <p>Dior烈艳蓝金唇膏采用经典配方，持久显色，滋润不脱色，打造完美唇妆。</p>
    </div>',
    '2024/01/美妆护肤_cat02_prod001_Dior_口红_rfgmdvu6.jpg',
    '2024/01/美妆护肤_cat02_prod001_Dior_口红_rfgmdvu6.jpg,2024/01/美妆护肤_cat02_prod010_Chanel_香水_8e99l99g.jpg,2024/01/美妆护肤_cat02_prod011_SK-II_神仙水_58fsm02n.jpg',
    1,
    87,
    0,
    394,
    '{"hasUserPickUp": false, "hasShopDelivery": true}',
    47,
    NOW(),
    NOW(),
    NOW(),
    0
),
(
    87,
    'Chanel 香奈儿5号香水',
    1,
    1200.00,
    1100.00,
    '经典花香调，持久留香，优雅迷人',
    '<div style="margin: 0px; padding: 0px; color: #666666; font-family: tahoma, arial, ''Microsoft YaHei'', ''Hiragino Sans GB'', u5b8bu4f53, sans-serif; font-size: 12px;" align="center">
        <p><img src="2024/01/美妆护肤_cat02_prod002_Chanel_香水_4110q2vw.jpg" alt="Chanel 5号香水采用经典花香调，持久留香，优雅迷人，是永恒的经典。" width="750" height="750" /></p>
        <p><img src="2024/01/美妆护肤_cat02_prod020_SK-II_神仙水_992u2vec.jpg" alt="Chanel 5号香水采用经典花香调，持久留香，优雅迷人，是永恒的经典。" width="750" height="750" /></p>
        <p><img src="2024/01/美妆护肤_cat02_prod021_LOreal_粉底_fuma3aw7.jpg" alt="Chanel 5号香水采用经典花香调，持久留香，优雅迷人，是永恒的经典。" width="750" height="750" /></p>
        <p><img src="2024/01/美妆护肤_cat02_prod022_Dior_口红_3cf3cbaa.jpg" alt="Chanel 5号香水采用经典花香调，持久留香，优雅迷人，是永恒的经典。" width="750" height="750" /></p>
        <p>Chanel 5号香水采用经典花香调，持久留香，优雅迷人，是永恒的经典。</p>
    </div>',
    '2024/01/美妆护肤_cat02_prod002_Chanel_香水_4110q2vw.jpg',
    '2024/01/美妆护肤_cat02_prod002_Chanel_香水_4110q2vw.jpg,2024/01/美妆护肤_cat02_prod020_SK-II_神仙水_992u2vec.jpg,2024/01/美妆护肤_cat02_prod021_LOreal_粉底_fuma3aw7.jpg',
    1,
    87,
    0,
    408,
    '{"hasUserPickUp": false, "hasShopDelivery": true}',
    47,
    NOW(),
    NOW(),
    NOW(),
    0
),
(
    88,
    'SK-II 护肤精华露 神仙水',
    1,
    1590.00,
    1490.00,
    'Pitera精华，改善肌肤，提亮肤色',
    '<div style="margin: 0px; padding: 0px; color: #666666; font-family: tahoma, arial, ''Microsoft YaHei'', ''Hiragino Sans GB'', u5b8bu4f53, sans-serif; font-size: 12px;" align="center">
        <p><img src="2024/01/美妆护肤_cat02_prod003_SK-II_神仙水_kywwa4p9.jpg" alt="SK-II神仙水含有Pitera精华，能够改善肌肤状态，提亮肤色，让肌肤焕发光彩。" width="750" height="750" /></p>
        <p><img src="2024/01/美妆护肤_cat02_prod030_LOreal_粉底_15h6olra.jpg" alt="SK-II神仙水含有Pitera精华，能够改善肌肤状态，提亮肤色，让肌肤焕发光彩。" width="750" height="750" /></p>
        <p><img src="2024/01/美妆护肤_cat02_prod031_Dior_口红_97ieymi1.jpg" alt="SK-II神仙水含有Pitera精华，能够改善肌肤状态，提亮肤色，让肌肤焕发光彩。" width="750" height="750" /></p>
        <p>SK-II神仙水含有Pitera精华，能够改善肌肤状态，提亮肤色，让肌肤焕发光彩。</p>
    </div>',
    '2024/01/美妆护肤_cat02_prod003_SK-II_神仙水_kywwa4p9.jpg',
    '2024/01/美妆护肤_cat02_prod003_SK-II_神仙水_kywwa4p9.jpg,2024/01/美妆护肤_cat02_prod030_LOreal_粉底_15h6olra.jpg,2024/01/美妆护肤_cat02_prod031_Dior_口红_97ieymi1.jpg',
    1,
    87,
    0,
    381,
    '{"hasUserPickUp": false, "hasShopDelivery": true}',
    47,
    NOW(),
    NOW(),
    NOW(),
    0
),
(
    89,
    'L''Oreal 欧莱雅持妆粉底液',
    1,
    199.00,
    179.00,
    '24小时持妆，遮瑕不脱妆，自然贴合',
    '<div style="margin: 0px; padding: 0px; color: #666666; font-family: tahoma, arial, ''Microsoft YaHei'', ''Hiragino Sans GB'', u5b8bu4f53, sans-serif; font-size: 12px;" align="center">
        <p><img src="2024/01/美妆护肤_cat02_prod004_LOreal_粉底_14r751xy.jpg" alt="L''Oreal持妆粉底液能够24小时持妆，遮瑕不脱妆，自然贴合肌肤。" width="750" height="750" /></p>
        <p><img src="2024/01/美妆护肤_cat02_prod040_Dior_口红_7jbtudtv.jpg" alt="L''Oreal持妆粉底液能够24小时持妆，遮瑕不脱妆，自然贴合肌肤。" width="750" height="750" /></p>
        <p><img src="2024/01/美妆护肤_cat02_prod041_Chanel_香水_k8lhrwg5.jpg" alt="L''Oreal持妆粉底液能够24小时持妆，遮瑕不脱妆，自然贴合肌肤。" width="750" height="750" /></p>
        <p>L''Oreal持妆粉底液能够24小时持妆，遮瑕不脱妆，自然贴合肌肤。</p>
    </div>',
    '2024/01/美妆护肤_cat02_prod004_LOreal_粉底_14r751xy.jpg',
    '2024/01/美妆护肤_cat02_prod004_LOreal_粉底_14r751xy.jpg,2024/01/美妆护肤_cat02_prod040_Dior_口红_7jbtudtv.jpg,2024/01/美妆护肤_cat02_prod041_Chanel_香水_k8lhrwg5.jpg',
    1,
    87,
    0,
    404,
    '{"hasUserPickUp": false, "hasShopDelivery": true}',
    47,
    NOW(),
    NOW(),
    NOW(),
    0
),
(
    90,
    'Nike Air Max 270 运动鞋',
    1,
    899.00,
    799.00,
    '气垫缓震，舒适透气，时尚百搭',
    '<div style="margin: 0px; padding: 0px; color: #666666; font-family: tahoma, arial, ''Microsoft YaHei'', ''Hiragino Sans GB'', u5b8bu4f53, sans-serif; font-size: 12px;" align="center">
        <p><img src="2024/01/运动服饰_cat03_prod001_Nike_Air_Max_psujsdav.jpg" alt="Nike Air Max 270采用气垫缓震技术，舒适透气，时尚百搭，适合日常运动。" width="750" height="750" /></p>
        <p><img src="2024/01/运动服饰_cat03_prod010_Adidas_运动服_p2qoph3v.jpg" alt="Nike Air Max 270采用气垫缓震技术，舒适透气，时尚百搭，适合日常运动。" width="750" height="750" /></p>
        <p><img src="2024/01/运动服饰_cat03_prod011_Nike_篮球鞋_povufpxw.jpg" alt="Nike Air Max 270采用气垫缓震技术，舒适透气，时尚百搭，适合日常运动。" width="750" height="750" /></p>
        <p><img src="2024/01/运动服饰_cat03_prod012_Yoga_瑜伽垫_9a5sba6w.jpg" alt="Nike Air Max 270采用气垫缓震技术，舒适透气，时尚百搭，适合日常运动。" width="750" height="750" /></p>
        <p>Nike Air Max 270采用气垫缓震技术，舒适透气，时尚百搭，适合日常运动。</p>
    </div>',
    '2024/01/运动服饰_cat03_prod001_Nike_Air_Max_psujsdav.jpg',
    '2024/01/运动服饰_cat03_prod001_Nike_Air_Max_psujsdav.jpg,2024/01/运动服饰_cat03_prod010_Adidas_运动服_p2qoph3v.jpg,2024/01/运动服饰_cat03_prod011_Nike_篮球鞋_povufpxw.jpg',
    1,
    88,
    0,
    65,
    '{"hasUserPickUp": false, "hasShopDelivery": true}',
    47,
    NOW(),
    NOW(),
    NOW(),
    0
),
(
    91,
    'Adidas 阿迪达斯运动套装',
    1,
    599.00,
    549.00,
    '速干面料，舒适透气，运动必备',
    '<div style="margin: 0px; padding: 0px; color: #666666; font-family: tahoma, arial, ''Microsoft YaHei'', ''Hiragino Sans GB'', u5b8bu4f53, sans-serif; font-size: 12px;" align="center">
        <p><img src="2024/01/运动服饰_cat03_prod002_Adidas_运动服_b1cnt9ct.jpg" alt="Adidas运动套装采用速干面料，舒适透气，是运动健身的必备装备。" width="750" height="750" /></p>
        <p><img src="2024/01/运动服饰_cat03_prod020_Nike_篮球鞋_7gywrusp.jpg" alt="Adidas运动套装采用速干面料，舒适透气，是运动健身的必备装备。" width="750" height="750" /></p>
        <p><img src="2024/01/运动服饰_cat03_prod021_Yoga_瑜伽垫_h5vip33j.jpg" alt="Adidas运动套装采用速干面料，舒适透气，是运动健身的必备装备。" width="750" height="750" /></p>
        <p>Adidas运动套装采用速干面料，舒适透气，是运动健身的必备装备。</p>
    </div>',
    '2024/01/运动服饰_cat03_prod002_Adidas_运动服_b1cnt9ct.jpg',
    '2024/01/运动服饰_cat03_prod002_Adidas_运动服_b1cnt9ct.jpg,2024/01/运动服饰_cat03_prod020_Nike_篮球鞋_7gywrusp.jpg,2024/01/运动服饰_cat03_prod021_Yoga_瑜伽垫_h5vip33j.jpg',
    1,
    88,
    0,
    402,
    '{"hasUserPickUp": false, "hasShopDelivery": true}',
    47,
    NOW(),
    NOW(),
    NOW(),
    0
),
(
    92,
    'Nike LeBron 20 篮球鞋',
    1,
    1299.00,
    1199.00,
    '专业篮球鞋，缓震保护，抓地力强',
    '<div style="margin: 0px; padding: 0px; color: #666666; font-family: tahoma, arial, ''Microsoft YaHei'', ''Hiragino Sans GB'', u5b8bu4f53, sans-serif; font-size: 12px;" align="center">
        <p><img src="2024/01/运动服饰_cat03_prod003_Nike_篮球鞋_q19qylsp.jpg" alt="Nike LeBron 20是专业篮球鞋，具有出色的缓震保护和抓地力。" width="750" height="750" /></p>
        <p><img src="2024/01/运动服饰_cat03_prod030_Yoga_瑜伽垫_o9iqgaj9.jpg" alt="Nike LeBron 20是专业篮球鞋，具有出色的缓震保护和抓地力。" width="750" height="750" /></p>
        <p><img src="2024/01/运动服饰_cat03_prod031_Nike_Air_Max_zcf8ohl5.jpg" alt="Nike LeBron 20是专业篮球鞋，具有出色的缓震保护和抓地力。" width="750" height="750" /></p>
        <p><img src="2024/01/运动服饰_cat03_prod032_Adidas_运动服_q38lter8.jpg" alt="Nike LeBron 20是专业篮球鞋，具有出色的缓震保护和抓地力。" width="750" height="750" /></p>
        <p>Nike LeBron 20是专业篮球鞋，具有出色的缓震保护和抓地力。</p>
    </div>',
    '2024/01/运动服饰_cat03_prod003_Nike_篮球鞋_q19qylsp.jpg',
    '2024/01/运动服饰_cat03_prod003_Nike_篮球鞋_q19qylsp.jpg,2024/01/运动服饰_cat03_prod030_Yoga_瑜伽垫_o9iqgaj9.jpg,2024/01/运动服饰_cat03_prod031_Nike_Air_Max_zcf8ohl5.jpg',
    1,
    88,
    0,
    217,
    '{"hasUserPickUp": false, "hasShopDelivery": true}',
    47,
    NOW(),
    NOW(),
    NOW(),
    0
),
(
    93,
    '专业瑜伽垫 防滑加厚',
    1,
    199.00,
    179.00,
    '10mm加厚，防滑耐磨，环保材质',
    '<div style="margin: 0px; padding: 0px; color: #666666; font-family: tahoma, arial, ''Microsoft YaHei'', ''Hiragino Sans GB'', u5b8bu4f53, sans-serif; font-size: 12px;" align="center">
        <p><img src="2024/01/运动服饰_cat03_prod004_Yoga_瑜伽垫_ihtgbfn3.jpg" alt="专业瑜伽垫采用10mm加厚设计，防滑耐磨，使用环保材质，安全健康。" width="750" height="750" /></p>
        <p><img src="2024/01/运动服饰_cat03_prod040_Nike_Air_Max_dj82n584.jpg" alt="专业瑜伽垫采用10mm加厚设计，防滑耐磨，使用环保材质，安全健康。" width="750" height="750" /></p>
        <p><img src="2024/01/运动服饰_cat03_prod041_Adidas_运动服_glmnwpxg.jpg" alt="专业瑜伽垫采用10mm加厚设计，防滑耐磨，使用环保材质，安全健康。" width="750" height="750" /></p>
        <p>专业瑜伽垫采用10mm加厚设计，防滑耐磨，使用环保材质，安全健康。</p>
    </div>',
    '2024/01/运动服饰_cat03_prod004_Yoga_瑜伽垫_ihtgbfn3.jpg',
    '2024/01/运动服饰_cat03_prod004_Yoga_瑜伽垫_ihtgbfn3.jpg,2024/01/运动服饰_cat03_prod040_Nike_Air_Max_dj82n584.jpg,2024/01/运动服饰_cat03_prod041_Adidas_运动服_glmnwpxg.jpg',
    1,
    88,
    0,
    321,
    '{"hasUserPickUp": false, "hasShopDelivery": true}',
    47,
    NOW(),
    NOW(),
    NOW(),
    0
),
(
    94,
    '费列罗榛果威化巧克力',
    1,
    128.00,
    99.00,
    '意大利进口，榛果香浓，礼盒装',
    '<div style="margin: 0px; padding: 0px; color: #666666; font-family: tahoma, arial, ''Microsoft YaHei'', ''Hiragino Sans GB'', u5b8bu4f53, sans-serif; font-size: 12px;" align="center">
        <p><img src="2024/01/美味零食_cat04_prod001_费列罗巧克力_awvqty9o.jpg" alt="费列罗榛果威化巧克力来自意大利，榛果香浓，是送礼佳品。" width="750" height="750" /></p>
        <p><img src="2024/01/美味零食_cat04_prod010_乐事薯片_f8lk1l0b.jpg" alt="费列罗榛果威化巧克力来自意大利，榛果香浓，是送礼佳品。" width="750" height="750" /></p>
        <p><img src="2024/01/美味零食_cat04_prod011_奥利奥饼干_nrrfk0wi.jpg" alt="费列罗榛果威化巧克力来自意大利，榛果香浓，是送礼佳品。" width="750" height="750" /></p>
        <p>费列罗榛果威化巧克力来自意大利，榛果香浓，是送礼佳品。</p>
    </div>',
    '2024/01/美味零食_cat04_prod001_费列罗巧克力_awvqty9o.jpg',
    '2024/01/美味零食_cat04_prod001_费列罗巧克力_awvqty9o.jpg,2024/01/美味零食_cat04_prod010_乐事薯片_f8lk1l0b.jpg,2024/01/美味零食_cat04_prod011_奥利奥饼干_nrrfk0wi.jpg',
    1,
    95,
    0,
    447,
    '{"hasUserPickUp": false, "hasShopDelivery": true}',
    47,
    NOW(),
    NOW(),
    NOW(),
    0
),
(
    95,
    '乐事薯片 经典原味',
    1,
    15.00,
    12.00,
    '香脆可口，经典口味，休闲零食',
    '<div style="margin: 0px; padding: 0px; color: #666666; font-family: tahoma, arial, ''Microsoft YaHei'', ''Hiragino Sans GB'', u5b8bu4f53, sans-serif; font-size: 12px;" align="center">
        <p><img src="2024/01/美味零食_cat04_prod002_乐事薯片_jkxb0du0.jpg" alt="乐事薯片经典原味，香脆可口，是休闲时光的最佳伴侣。" width="750" height="750" /></p>
        <p><img src="2024/01/美味零食_cat04_prod020_奥利奥饼干_e7y2q2nv.jpg" alt="乐事薯片经典原味，香脆可口，是休闲时光的最佳伴侣。" width="750" height="750" /></p>
        <p><img src="2024/01/美味零食_cat04_prod021_可口可乐_4g987htl.jpg" alt="乐事薯片经典原味，香脆可口，是休闲时光的最佳伴侣。" width="750" height="750" /></p>
        <p>乐事薯片经典原味，香脆可口，是休闲时光的最佳伴侣。</p>
    </div>',
    '2024/01/美味零食_cat04_prod002_乐事薯片_jkxb0du0.jpg',
    '2024/01/美味零食_cat04_prod002_乐事薯片_jkxb0du0.jpg,2024/01/美味零食_cat04_prod020_奥利奥饼干_e7y2q2nv.jpg,2024/01/美味零食_cat04_prod021_可口可乐_4g987htl.jpg',
    1,
    95,
    0,
    301,
    '{"hasUserPickUp": false, "hasShopDelivery": true}',
    47,
    NOW(),
    NOW(),
    NOW(),
    0
),
(
    96,
    '奥利奥夹心饼干',
    1,
    18.00,
    15.00,
    '经典黑白配，香甜可口，童年回忆',
    '<div style="margin: 0px; padding: 0px; color: #666666; font-family: tahoma, arial, ''Microsoft YaHei'', ''Hiragino Sans GB'', u5b8bu4f53, sans-serif; font-size: 12px;" align="center">
        <p><img src="2024/01/美味零食_cat04_prod003_奥利奥饼干_3w6gr582.jpg" alt="奥利奥夹心饼干经典黑白配，香甜可口，是童年的美好回忆。" width="750" height="750" /></p>
        <p><img src="2024/01/美味零食_cat04_prod030_可口可乐_31gjxxkw.jpg" alt="奥利奥夹心饼干经典黑白配，香甜可口，是童年的美好回忆。" width="750" height="750" /></p>
        <p><img src="2024/01/美味零食_cat04_prod031_三只松鼠坚果_ypab1bz3.jpg" alt="奥利奥夹心饼干经典黑白配，香甜可口，是童年的美好回忆。" width="750" height="750" /></p>
        <p><img src="2024/01/美味零食_cat04_prod032_费列罗巧克力_hbj8ffts.jpg" alt="奥利奥夹心饼干经典黑白配，香甜可口，是童年的美好回忆。" width="750" height="750" /></p>
        <p>奥利奥夹心饼干经典黑白配，香甜可口，是童年的美好回忆。</p>
    </div>',
    '2024/01/美味零食_cat04_prod003_奥利奥饼干_3w6gr582.jpg',
    '2024/01/美味零食_cat04_prod003_奥利奥饼干_3w6gr582.jpg,2024/01/美味零食_cat04_prod030_可口可乐_31gjxxkw.jpg,2024/01/美味零食_cat04_prod031_三只松鼠坚果_ypab1bz3.jpg',
    1,
    95,
    0,
    441,
    '{"hasUserPickUp": false, "hasShopDelivery": true}',
    47,
    NOW(),
    NOW(),
    NOW(),
    0
),
(
    97,
    '可口可乐 经典汽水',
    1,
    5.00,
    4.50,
    '经典口味，冰镇更爽，解渴必备',
    '<div style="margin: 0px; padding: 0px; color: #666666; font-family: tahoma, arial, ''Microsoft YaHei'', ''Hiragino Sans GB'', u5b8bu4f53, sans-serif; font-size: 12px;" align="center">
        <p><img src="2024/01/美味零食_cat04_prod004_可口可乐_64lspopf.jpg" alt="可口可乐经典汽水，经典口味，冰镇更爽，是解渴的必备饮品。" width="750" height="750" /></p>
        <p><img src="2024/01/美味零食_cat04_prod040_三只松鼠坚果_ewlao71f.jpg" alt="可口可乐经典汽水，经典口味，冰镇更爽，是解渴的必备饮品。" width="750" height="750" /></p>
        <p><img src="2024/01/美味零食_cat04_prod041_费列罗巧克力_fhkbhwjc.jpg" alt="可口可乐经典汽水，经典口味，冰镇更爽，是解渴的必备饮品。" width="750" height="750" /></p>
        <p><img src="2024/01/美味零食_cat04_prod042_乐事薯片_8st9v3lo.jpg" alt="可口可乐经典汽水，经典口味，冰镇更爽，是解渴的必备饮品。" width="750" height="750" /></p>
        <p>可口可乐经典汽水，经典口味，冰镇更爽，是解渴的必备饮品。</p>
    </div>',
    '2024/01/美味零食_cat04_prod004_可口可乐_64lspopf.jpg',
    '2024/01/美味零食_cat04_prod004_可口可乐_64lspopf.jpg,2024/01/美味零食_cat04_prod040_三只松鼠坚果_ewlao71f.jpg,2024/01/美味零食_cat04_prod041_费列罗巧克力_fhkbhwjc.jpg',
    1,
    95,
    0,
    423,
    '{"hasUserPickUp": false, "hasShopDelivery": true}',
    47,
    NOW(),
    NOW(),
    NOW(),
    0
),
(
    98,
    '三只松鼠每日坚果',
    1,
    89.00,
    79.00,
    '混合坚果，营养丰富，健康零食',
    '<div style="margin: 0px; padding: 0px; color: #666666; font-family: tahoma, arial, ''Microsoft YaHei'', ''Hiragino Sans GB'', u5b8bu4f53, sans-serif; font-size: 12px;" align="center">
        <p><img src="2024/01/美味零食_cat04_prod005_三只松鼠坚果_6npe78a9.jpg" alt="三只松鼠每日坚果混合多种坚果，营养丰富，是健康的零食选择。" width="750" height="750" /></p>
        <p><img src="2024/01/美味零食_cat04_prod050_费列罗巧克力_wt631g7b.jpg" alt="三只松鼠每日坚果混合多种坚果，营养丰富，是健康的零食选择。" width="750" height="750" /></p>
        <p><img src="2024/01/美味零食_cat04_prod051_乐事薯片_ed5q8y4c.jpg" alt="三只松鼠每日坚果混合多种坚果，营养丰富，是健康的零食选择。" width="750" height="750" /></p>
        <p><img src="2024/01/美味零食_cat04_prod052_奥利奥饼干_q6m9zvij.jpg" alt="三只松鼠每日坚果混合多种坚果，营养丰富，是健康的零食选择。" width="750" height="750" /></p>
        <p>三只松鼠每日坚果混合多种坚果，营养丰富，是健康的零食选择。</p>
    </div>',
    '2024/01/美味零食_cat04_prod005_三只松鼠坚果_6npe78a9.jpg',
    '2024/01/美味零食_cat04_prod005_三只松鼠坚果_6npe78a9.jpg,2024/01/美味零食_cat04_prod050_费列罗巧克力_wt631g7b.jpg,2024/01/美味零食_cat04_prod051_乐事薯片_ed5q8y4c.jpg',
    1,
    95,
    0,
    461,
    '{"hasUserPickUp": false, "hasShopDelivery": true}',
    47,
    NOW(),
    NOW(),
    NOW(),
    0
),
(
    99,
    'IKEA 宜家三人沙发',
    1,
    2999.00,
    2699.00,
    '舒适坐感，简约设计，北欧风格',
    '<div style="margin: 0px; padding: 0px; color: #666666; font-family: tahoma, arial, ''Microsoft YaHei'', ''Hiragino Sans GB'', u5b8bu4f53, sans-serif; font-size: 12px;" align="center">
        <p><img src="2024/01/家居用品_cat05_prod001_IKEA_沙发_tm6dxhe1.jpg" alt="IKEA宜家三人沙发舒适坐感，简约设计，北欧风格，适合现代家居。" width="750" height="750" /></p>
        <p><img src="2024/01/家居用品_cat05_prod010_飞利浦台灯_nkrqkle3.jpg" alt="IKEA宜家三人沙发舒适坐感，简约设计，北欧风格，适合现代家居。" width="750" height="750" /></p>
        <p><img src="2024/01/家居用品_cat05_prod011_无印良品_花瓶_qag3fcmm.jpg" alt="IKEA宜家三人沙发舒适坐感，简约设计，北欧风格，适合现代家居。" width="750" height="750" /></p>
        <p><img src="2024/01/家居用品_cat05_prod012_宜家_床_rafk14c4.jpg" alt="IKEA宜家三人沙发舒适坐感，简约设计，北欧风格，适合现代家居。" width="750" height="750" /></p>
        <p>IKEA宜家三人沙发舒适坐感，简约设计，北欧风格，适合现代家居。</p>
    </div>',
    '2024/01/家居用品_cat05_prod001_IKEA_沙发_tm6dxhe1.jpg',
    '2024/01/家居用品_cat05_prod001_IKEA_沙发_tm6dxhe1.jpg,2024/01/家居用品_cat05_prod010_飞利浦台灯_nkrqkle3.jpg,2024/01/家居用品_cat05_prod011_无印良品_花瓶_qag3fcmm.jpg',
    1,
    96,
    0,
    464,
    '{"hasUserPickUp": false, "hasShopDelivery": true}',
    47,
    NOW(),
    NOW(),
    NOW(),
    0
),
(
    100,
    '飞利浦 LED护眼台灯',
    1,
    399.00,
    359.00,
    '无频闪，护眼设计，可调光',
    '<div style="margin: 0px; padding: 0px; color: #666666; font-family: tahoma, arial, ''Microsoft YaHei'', ''Hiragino Sans GB'', u5b8bu4f53, sans-serif; font-size: 12px;" align="center">
        <p><img src="2024/01/家居用品_cat05_prod002_飞利浦台灯_y0yxp5d8.jpg" alt="飞利浦LED护眼台灯无频闪，护眼设计，可调光，保护视力。" width="750" height="750" /></p>
        <p><img src="2024/01/家居用品_cat05_prod020_无印良品_花瓶_fkknndrj.jpg" alt="飞利浦LED护眼台灯无频闪，护眼设计，可调光，保护视力。" width="750" height="750" /></p>
        <p><img src="2024/01/家居用品_cat05_prod021_宜家_床_1u0b3es1.jpg" alt="飞利浦LED护眼台灯无频闪，护眼设计，可调光，保护视力。" width="750" height="750" /></p>
        <p><img src="2024/01/家居用品_cat05_prod022_IKEA_沙发_tpbrtycw.jpg" alt="飞利浦LED护眼台灯无频闪，护眼设计，可调光，保护视力。" width="750" height="750" /></p>
        <p>飞利浦LED护眼台灯无频闪，护眼设计，可调光，保护视力。</p>
    </div>',
    '2024/01/家居用品_cat05_prod002_飞利浦台灯_y0yxp5d8.jpg',
    '2024/01/家居用品_cat05_prod002_飞利浦台灯_y0yxp5d8.jpg,2024/01/家居用品_cat05_prod020_无印良品_花瓶_fkknndrj.jpg,2024/01/家居用品_cat05_prod021_宜家_床_1u0b3es1.jpg',
    1,
    96,
    0,
    258,
    '{"hasUserPickUp": false, "hasShopDelivery": true}',
    47,
    NOW(),
    NOW(),
    NOW(),
    0
),
(
    101,
    '无印良品 简约玻璃花瓶',
    1,
    89.00,
    79.00,
    '简约设计，透明玻璃，百搭装饰',
    '<div style="margin: 0px; padding: 0px; color: #666666; font-family: tahoma, arial, ''Microsoft YaHei'', ''Hiragino Sans GB'', u5b8bu4f53, sans-serif; font-size: 12px;" align="center">
        <p><img src="2024/01/家居用品_cat05_prod003_无印良品_花瓶_mdvsj89m.jpg" alt="无印良品简约玻璃花瓶采用简约设计，透明玻璃材质，百搭装饰。" width="750" height="750" /></p>
        <p><img src="2024/01/家居用品_cat05_prod030_宜家_床_lf12oybs.jpg" alt="无印良品简约玻璃花瓶采用简约设计，透明玻璃材质，百搭装饰。" width="750" height="750" /></p>
        <p><img src="2024/01/家居用品_cat05_prod031_IKEA_沙发_zvsxexym.jpg" alt="无印良品简约玻璃花瓶采用简约设计，透明玻璃材质，百搭装饰。" width="750" height="750" /></p>
        <p>无印良品简约玻璃花瓶采用简约设计，透明玻璃材质，百搭装饰。</p>
    </div>',
    '2024/01/家居用品_cat05_prod003_无印良品_花瓶_mdvsj89m.jpg',
    '2024/01/家居用品_cat05_prod003_无印良品_花瓶_mdvsj89m.jpg,2024/01/家居用品_cat05_prod030_宜家_床_lf12oybs.jpg,2024/01/家居用品_cat05_prod031_IKEA_沙发_zvsxexym.jpg',
    1,
    96,
    0,
    135,
    '{"hasUserPickUp": false, "hasShopDelivery": true}',
    47,
    NOW(),
    NOW(),
    NOW(),
    0
),
(
    102,
    'IKEA 宜家双人床',
    1,
    1999.00,
    1799.00,
    '实木材质，简约设计，舒适睡眠',
    '<div style="margin: 0px; padding: 0px; color: #666666; font-family: tahoma, arial, ''Microsoft YaHei'', ''Hiragino Sans GB'', u5b8bu4f53, sans-serif; font-size: 12px;" align="center">
        <p><img src="2024/01/家居用品_cat05_prod004_宜家_床_ow8rjeaa.jpg" alt="IKEA宜家双人床采用实木材质，简约设计，提供舒适睡眠体验。" width="750" height="750" /></p>
        <p><img src="2024/01/家居用品_cat05_prod040_IKEA_沙发_xgsq5cs1.jpg" alt="IKEA宜家双人床采用实木材质，简约设计，提供舒适睡眠体验。" width="750" height="750" /></p>
        <p><img src="2024/01/家居用品_cat05_prod041_飞利浦台灯_2p4r49i6.jpg" alt="IKEA宜家双人床采用实木材质，简约设计，提供舒适睡眠体验。" width="750" height="750" /></p>
        <p>IKEA宜家双人床采用实木材质，简约设计，提供舒适睡眠体验。</p>
    </div>',
    '2024/01/家居用品_cat05_prod004_宜家_床_ow8rjeaa.jpg',
    '2024/01/家居用品_cat05_prod004_宜家_床_ow8rjeaa.jpg,2024/01/家居用品_cat05_prod040_IKEA_沙发_xgsq5cs1.jpg,2024/01/家居用品_cat05_prod041_飞利浦台灯_2p4r49i6.jpg',
    1,
    96,
    0,
    64,
    '{"hasUserPickUp": false, "hasShopDelivery": true}',
    47,
    NOW(),
    NOW(),
    NOW(),
    0
),
(
    103,
    'Amazon Kindle Paperwhite 电子书阅读器',
    1,
    998.00,
    899.00,
    '6.8英寸屏幕，300PPI，防水设计',
    '<div style="margin: 0px; padding: 0px; color: #666666; font-family: tahoma, arial, ''Microsoft YaHei'', ''Hiragino Sans GB'', u5b8bu4f53, sans-serif; font-size: 12px;" align="center">
        <p><img src="2024/01/图书文具_cat06_prod001_Kindle_电子书_6c3ae3pz.jpg" alt="Kindle Paperwhite配备6.8英寸屏幕，300PPI清晰度，支持防水设计。" width="750" height="750" /></p>
        <p><img src="2024/01/图书文具_cat06_prod010_Moleskine_笔记本_7fupr5sq.jpg" alt="Kindle Paperwhite配备6.8英寸屏幕，300PPI清晰度，支持防水设计。" width="750" height="750" /></p>
        <p><img src="2024/01/图书文具_cat06_prod011_Pilot_钢笔_z5snfxbg.jpg" alt="Kindle Paperwhite配备6.8英寸屏幕，300PPI清晰度，支持防水设计。" width="750" height="750" /></p>
        <p>Kindle Paperwhite配备6.8英寸屏幕，300PPI清晰度，支持防水设计。</p>
    </div>',
    '2024/01/图书文具_cat06_prod001_Kindle_电子书_6c3ae3pz.jpg',
    '2024/01/图书文具_cat06_prod001_Kindle_电子书_6c3ae3pz.jpg,2024/01/图书文具_cat06_prod010_Moleskine_笔记本_7fupr5sq.jpg,2024/01/图书文具_cat06_prod011_Pilot_钢笔_z5snfxbg.jpg',
    1,
    96,
    0,
    126,
    '{"hasUserPickUp": false, "hasShopDelivery": true}',
    47,
    NOW(),
    NOW(),
    NOW(),
    0
),
(
    104,
    'Moleskine 经典笔记本',
    1,
    199.00,
    179.00,
    '硬质封面，优质纸张，经典设计',
    '<div style="margin: 0px; padding: 0px; color: #666666; font-family: tahoma, arial, ''Microsoft YaHei'', ''Hiragino Sans GB'', u5b8bu4f53, sans-serif; font-size: 12px;" align="center">
        <p><img src="2024/01/图书文具_cat06_prod002_Moleskine_笔记本_rtsiaht3.jpg" alt="Moleskine经典笔记本采用硬质封面，优质纸张，经典设计，适合记录。" width="750" height="750" /></p>
        <p><img src="2024/01/图书文具_cat06_prod020_Pilot_钢笔_029v9tr1.jpg" alt="Moleskine经典笔记本采用硬质封面，优质纸张，经典设计，适合记录。" width="750" height="750" /></p>
        <p><img src="2024/01/图书文具_cat06_prod021_得力_文具_ffveygw7.jpg" alt="Moleskine经典笔记本采用硬质封面，优质纸张，经典设计，适合记录。" width="750" height="750" /></p>
        <p><img src="2024/01/图书文具_cat06_prod022_Kindle_电子书_1hzuqyqx.jpg" alt="Moleskine经典笔记本采用硬质封面，优质纸张，经典设计，适合记录。" width="750" height="750" /></p>
        <p>Moleskine经典笔记本采用硬质封面，优质纸张，经典设计，适合记录。</p>
    </div>',
    '2024/01/图书文具_cat06_prod002_Moleskine_笔记本_rtsiaht3.jpg',
    '2024/01/图书文具_cat06_prod002_Moleskine_笔记本_rtsiaht3.jpg,2024/01/图书文具_cat06_prod020_Pilot_钢笔_029v9tr1.jpg,2024/01/图书文具_cat06_prod021_得力_文具_ffveygw7.jpg',
    1,
    96,
    0,
    344,
    '{"hasUserPickUp": false, "hasShopDelivery": true}',
    47,
    NOW(),
    NOW(),
    NOW(),
    0
),
(
    105,
    'Pilot 百乐钢笔',
    1,
    299.00,
    269.00,
    '流畅书写，经典设计，适合日常使用',
    '<div style="margin: 0px; padding: 0px; color: #666666; font-family: tahoma, arial, ''Microsoft YaHei'', ''Hiragino Sans GB'', u5b8bu4f53, sans-serif; font-size: 12px;" align="center">
        <p><img src="2024/01/图书文具_cat06_prod003_Pilot_钢笔_tzjc83fb.jpg" alt="Pilot百乐钢笔书写流畅，经典设计，适合日常使用。" width="750" height="750" /></p>
        <p><img src="2024/01/图书文具_cat06_prod030_得力_文具_kp6wn8kn.jpg" alt="Pilot百乐钢笔书写流畅，经典设计，适合日常使用。" width="750" height="750" /></p>
        <p><img src="2024/01/图书文具_cat06_prod031_Kindle_电子书_1mf1o8v0.jpg" alt="Pilot百乐钢笔书写流畅，经典设计，适合日常使用。" width="750" height="750" /></p>
        <p><img src="2024/01/图书文具_cat06_prod032_Moleskine_笔记本_1j8cnokz.jpg" alt="Pilot百乐钢笔书写流畅，经典设计，适合日常使用。" width="750" height="750" /></p>
        <p>Pilot百乐钢笔书写流畅，经典设计，适合日常使用。</p>
    </div>',
    '2024/01/图书文具_cat06_prod003_Pilot_钢笔_tzjc83fb.jpg',
    '2024/01/图书文具_cat06_prod003_Pilot_钢笔_tzjc83fb.jpg,2024/01/图书文具_cat06_prod030_得力_文具_kp6wn8kn.jpg,2024/01/图书文具_cat06_prod031_Kindle_电子书_1mf1o8v0.jpg',
    1,
    96,
    0,
    289,
    '{"hasUserPickUp": false, "hasShopDelivery": true}',
    47,
    NOW(),
    NOW(),
    NOW(),
    0
),
(
    106,
    '得力 办公文具套装',
    1,
    89.00,
    79.00,
    '多件套，实用齐全，办公必备',
    '<div style="margin: 0px; padding: 0px; color: #666666; font-family: tahoma, arial, ''Microsoft YaHei'', ''Hiragino Sans GB'', u5b8bu4f53, sans-serif; font-size: 12px;" align="center">
        <p><img src="2024/01/图书文具_cat06_prod004_得力_文具_azdvd0mn.jpg" alt="得力办公文具套装多件套，实用齐全，是办公的必备用品。" width="750" height="750" /></p>
        <p><img src="2024/01/图书文具_cat06_prod040_Kindle_电子书_ao3lypo8.jpg" alt="得力办公文具套装多件套，实用齐全，是办公的必备用品。" width="750" height="750" /></p>
        <p><img src="2024/01/图书文具_cat06_prod041_Moleskine_笔记本_xnqrejh8.jpg" alt="得力办公文具套装多件套，实用齐全，是办公的必备用品。" width="750" height="750" /></p>
        <p>得力办公文具套装多件套，实用齐全，是办公的必备用品。</p>
    </div>',
    '2024/01/图书文具_cat06_prod004_得力_文具_azdvd0mn.jpg',
    '2024/01/图书文具_cat06_prod004_得力_文具_azdvd0mn.jpg,2024/01/图书文具_cat06_prod040_Kindle_电子书_ao3lypo8.jpg,2024/01/图书文具_cat06_prod041_Moleskine_笔记本_xnqrejh8.jpg',
    1,
    96,
    0,
    238,
    '{"hasUserPickUp": false, "hasShopDelivery": true}',
    47,
    NOW(),
    NOW(),
    NOW(),
    0
),
(
    107,
    'Uniqlo 优衣库经典衬衫',
    1,
    199.00,
    179.00,
    '纯棉材质，舒适透气，商务休闲',
    '<div style="margin: 0px; padding: 0px; color: #666666; font-family: tahoma, arial, ''Microsoft YaHei'', ''Hiragino Sans GB'', u5b8bu4f53, sans-serif; font-size: 12px;" align="center">
        <p><img src="2024/01/服装配饰_cat07_prod001_Uniqlo_衬衫_9t945krq.jpg" alt="Uniqlo优衣库经典衬衫采用纯棉材质，舒适透气，适合商务休闲。" width="750" height="750" /></p>
        <p><img src="2024/01/服装配饰_cat07_prod010_Nike_运动鞋_4rawdqtr.jpg" alt="Uniqlo优衣库经典衬衫采用纯棉材质，舒适透气，适合商务休闲。" width="750" height="750" /></p>
        <p><img src="2024/01/服装配饰_cat07_prod011_Coach_包_g08ag6v2.jpg" alt="Uniqlo优衣库经典衬衫采用纯棉材质，舒适透气，适合商务休闲。" width="750" height="750" /></p>
        <p><img src="2024/01/服装配饰_cat07_prod012_Rolex_手表_nb7ab1oh.jpg" alt="Uniqlo优衣库经典衬衫采用纯棉材质，舒适透气，适合商务休闲。" width="750" height="750" /></p>
        <p>Uniqlo优衣库经典衬衫采用纯棉材质，舒适透气，适合商务休闲。</p>
    </div>',
    '2024/01/服装配饰_cat07_prod001_Uniqlo_衬衫_9t945krq.jpg',
    '2024/01/服装配饰_cat07_prod001_Uniqlo_衬衫_9t945krq.jpg,2024/01/服装配饰_cat07_prod010_Nike_运动鞋_4rawdqtr.jpg,2024/01/服装配饰_cat07_prod011_Coach_包_g08ag6v2.jpg',
    1,
    96,
    0,
    128,
    '{"hasUserPickUp": false, "hasShopDelivery": true}',
    47,
    NOW(),
    NOW(),
    NOW(),
    0
),
(
    108,
    'Nike 耐克运动鞋',
    1,
    699.00,
    649.00,
    '舒适缓震，透气设计，运动必备',
    '<div style="margin: 0px; padding: 0px; color: #666666; font-family: tahoma, arial, ''Microsoft YaHei'', ''Hiragino Sans GB'', u5b8bu4f53, sans-serif; font-size: 12px;" align="center">
        <p><img src="2024/01/服装配饰_cat07_prod002_Nike_运动鞋_cp7xm2l3.jpg" alt="Nike耐克运动鞋舒适缓震，透气设计，是运动的必备装备。" width="750" height="750" /></p>
        <p><img src="2024/01/服装配饰_cat07_prod020_Coach_包_b6g0z4w4.jpg" alt="Nike耐克运动鞋舒适缓震，透气设计，是运动的必备装备。" width="750" height="750" /></p>
        <p><img src="2024/01/服装配饰_cat07_prod021_Rolex_手表_6mwqtdt6.jpg" alt="Nike耐克运动鞋舒适缓震，透气设计，是运动的必备装备。" width="750" height="750" /></p>
        <p><img src="2024/01/服装配饰_cat07_prod022_Uniqlo_衬衫_ohinbqjb.jpg" alt="Nike耐克运动鞋舒适缓震，透气设计，是运动的必备装备。" width="750" height="750" /></p>
        <p>Nike耐克运动鞋舒适缓震，透气设计，是运动的必备装备。</p>
    </div>',
    '2024/01/服装配饰_cat07_prod002_Nike_运动鞋_cp7xm2l3.jpg',
    '2024/01/服装配饰_cat07_prod002_Nike_运动鞋_cp7xm2l3.jpg,2024/01/服装配饰_cat07_prod020_Coach_包_b6g0z4w4.jpg,2024/01/服装配饰_cat07_prod021_Rolex_手表_6mwqtdt6.jpg',
    1,
    96,
    0,
    303,
    '{"hasUserPickUp": false, "hasShopDelivery": true}',
    47,
    NOW(),
    NOW(),
    NOW(),
    0
),
(
    109,
    'Coach 蔻驰经典手提包',
    1,
    2999.00,
    2799.00,
    '真皮材质，经典设计，时尚百搭',
    '<div style="margin: 0px; padding: 0px; color: #666666; font-family: tahoma, arial, ''Microsoft YaHei'', ''Hiragino Sans GB'', u5b8bu4f53, sans-serif; font-size: 12px;" align="center">
        <p><img src="2024/01/服装配饰_cat07_prod003_Coach_包_f6tg85b8.jpg" alt="Coach蔻驰经典手提包采用真皮材质，经典设计，时尚百搭。" width="750" height="750" /></p>
        <p><img src="2024/01/服装配饰_cat07_prod030_Rolex_手表_87oasfr8.jpg" alt="Coach蔻驰经典手提包采用真皮材质，经典设计，时尚百搭。" width="750" height="750" /></p>
        <p><img src="2024/01/服装配饰_cat07_prod031_Uniqlo_衬衫_vbhceukg.jpg" alt="Coach蔻驰经典手提包采用真皮材质，经典设计，时尚百搭。" width="750" height="750" /></p>
        <p><img src="2024/01/服装配饰_cat07_prod032_Nike_运动鞋_tcwk89ln.jpg" alt="Coach蔻驰经典手提包采用真皮材质，经典设计，时尚百搭。" width="750" height="750" /></p>
        <p>Coach蔻驰经典手提包采用真皮材质，经典设计，时尚百搭。</p>
    </div>',
    '2024/01/服装配饰_cat07_prod003_Coach_包_f6tg85b8.jpg',
    '2024/01/服装配饰_cat07_prod003_Coach_包_f6tg85b8.jpg,2024/01/服装配饰_cat07_prod030_Rolex_手表_87oasfr8.jpg,2024/01/服装配饰_cat07_prod031_Uniqlo_衬衫_vbhceukg.jpg',
    1,
    96,
    0,
    384,
    '{"hasUserPickUp": false, "hasShopDelivery": true}',
    47,
    NOW(),
    NOW(),
    NOW(),
    0
),
(
    110,
    'Rolex 劳力士经典腕表',
    1,
    59999.00,
    56999.00,
    '瑞士制造，精工细作，经典传承',
    '<div style="margin: 0px; padding: 0px; color: #666666; font-family: tahoma, arial, ''Microsoft YaHei'', ''Hiragino Sans GB'', u5b8bu4f53, sans-serif; font-size: 12px;" align="center">
        <p><img src="2024/01/服装配饰_cat07_prod004_Rolex_手表_48l9w8yq.jpg" alt="Rolex劳力士经典腕表瑞士制造，精工细作，经典传承。" width="750" height="750" /></p>
        <p><img src="2024/01/服装配饰_cat07_prod040_Uniqlo_衬衫_p4j7nuy2.jpg" alt="Rolex劳力士经典腕表瑞士制造，精工细作，经典传承。" width="750" height="750" /></p>
        <p><img src="2024/01/服装配饰_cat07_prod041_Nike_运动鞋_henmat2b.jpg" alt="Rolex劳力士经典腕表瑞士制造，精工细作，经典传承。" width="750" height="750" /></p>
        <p>Rolex劳力士经典腕表瑞士制造，精工细作，经典传承。</p>
    </div>',
    '2024/01/服装配饰_cat07_prod004_Rolex_手表_48l9w8yq.jpg',
    '2024/01/服装配饰_cat07_prod004_Rolex_手表_48l9w8yq.jpg,2024/01/服装配饰_cat07_prod040_Uniqlo_衬衫_p4j7nuy2.jpg,2024/01/服装配饰_cat07_prod041_Nike_运动鞋_henmat2b.jpg',
    1,
    96,
    0,
    215,
    '{"hasUserPickUp": false, "hasShopDelivery": true}',
    47,
    NOW(),
    NOW(),
    NOW(),
    0
),
(
    111,
    '美赞臣 婴幼儿配方奶粉',
    1,
    299.00,
    279.00,
    '营养全面，易消化吸收，适合0-12个月',
    '<div style="margin: 0px; padding: 0px; color: #666666; font-family: tahoma, arial, ''Microsoft YaHei'', ''Hiragino Sans GB'', u5b8bu4f53, sans-serif; font-size: 12px;" align="center">
        <p><img src="2024/01/母婴用品_cat08_prod001_美赞臣_奶粉_cqka7n6k.jpg" alt="美赞臣婴幼儿配方奶粉营养全面，易消化吸收，适合0-12个月宝宝。" width="750" height="750" /></p>
        <p><img src="2024/01/母婴用品_cat08_prod010_费雪_玩具_tuy4hu5h.jpg" alt="美赞臣婴幼儿配方奶粉营养全面，易消化吸收，适合0-12个月宝宝。" width="750" height="750" /></p>
        <p><img src="2024/01/母婴用品_cat08_prod011_好孩子_婴儿车_20vd1kav.jpg" alt="美赞臣婴幼儿配方奶粉营养全面，易消化吸收，适合0-12个月宝宝。" width="750" height="750" /></p>
        <p><img src="2024/01/母婴用品_cat08_prod012_NUK_奶瓶_khzuzquo.jpg" alt="美赞臣婴幼儿配方奶粉营养全面，易消化吸收，适合0-12个月宝宝。" width="750" height="750" /></p>
        <p>美赞臣婴幼儿配方奶粉营养全面，易消化吸收，适合0-12个月宝宝。</p>
    </div>',
    '2024/01/母婴用品_cat08_prod001_美赞臣_奶粉_cqka7n6k.jpg',
    '2024/01/母婴用品_cat08_prod001_美赞臣_奶粉_cqka7n6k.jpg,2024/01/母婴用品_cat08_prod010_费雪_玩具_tuy4hu5h.jpg,2024/01/母婴用品_cat08_prod011_好孩子_婴儿车_20vd1kav.jpg',
    1,
    96,
    0,
    196,
    '{"hasUserPickUp": false, "hasShopDelivery": true}',
    47,
    NOW(),
    NOW(),
    NOW(),
    0
),
(
    112,
    '费雪 益智玩具',
    1,
    199.00,
    179.00,
    '安全材质，益智启蒙，适合婴幼儿',
    '<div style="margin: 0px; padding: 0px; color: #666666; font-family: tahoma, arial, ''Microsoft YaHei'', ''Hiragino Sans GB'', u5b8bu4f53, sans-serif; font-size: 12px;" align="center">
        <p><img src="2024/01/母婴用品_cat08_prod002_费雪_玩具_e6l6e1y9.jpg" alt="费雪益智玩具采用安全材质，益智启蒙，适合婴幼儿玩耍。" width="750" height="750" /></p>
        <p><img src="2024/01/母婴用品_cat08_prod020_好孩子_婴儿车_rjgtbtd4.jpg" alt="费雪益智玩具采用安全材质，益智启蒙，适合婴幼儿玩耍。" width="750" height="750" /></p>
        <p><img src="2024/01/母婴用品_cat08_prod021_NUK_奶瓶_3j4fkoc6.jpg" alt="费雪益智玩具采用安全材质，益智启蒙，适合婴幼儿玩耍。" width="750" height="750" /></p>
        <p>费雪益智玩具采用安全材质，益智启蒙，适合婴幼儿玩耍。</p>
    </div>',
    '2024/01/母婴用品_cat08_prod002_费雪_玩具_e6l6e1y9.jpg',
    '2024/01/母婴用品_cat08_prod002_费雪_玩具_e6l6e1y9.jpg,2024/01/母婴用品_cat08_prod020_好孩子_婴儿车_rjgtbtd4.jpg,2024/01/母婴用品_cat08_prod021_NUK_奶瓶_3j4fkoc6.jpg',
    1,
    96,
    0,
    460,
    '{"hasUserPickUp": false, "hasShopDelivery": true}',
    47,
    NOW(),
    NOW(),
    NOW(),
    0
),
(
    113,
    '好孩子 婴儿推车',
    1,
    899.00,
    799.00,
    '轻便折叠，安全舒适，出行必备',
    '<div style="margin: 0px; padding: 0px; color: #666666; font-family: tahoma, arial, ''Microsoft YaHei'', ''Hiragino Sans GB'', u5b8bu4f53, sans-serif; font-size: 12px;" align="center">
        <p><img src="2024/01/母婴用品_cat08_prod003_好孩子_婴儿车_gmxistng.jpg" alt="好孩子婴儿推车轻便折叠，安全舒适，是出行的必备用品。" width="750" height="750" /></p>
        <p><img src="2024/01/母婴用品_cat08_prod030_NUK_奶瓶_mz3zfs6b.jpg" alt="好孩子婴儿推车轻便折叠，安全舒适，是出行的必备用品。" width="750" height="750" /></p>
        <p><img src="2024/01/母婴用品_cat08_prod031_美赞臣_奶粉_veolmxrr.jpg" alt="好孩子婴儿推车轻便折叠，安全舒适，是出行的必备用品。" width="750" height="750" /></p>
        <p><img src="2024/01/母婴用品_cat08_prod032_费雪_玩具_ui6kheq7.jpg" alt="好孩子婴儿推车轻便折叠，安全舒适，是出行的必备用品。" width="750" height="750" /></p>
        <p>好孩子婴儿推车轻便折叠，安全舒适，是出行的必备用品。</p>
    </div>',
    '2024/01/母婴用品_cat08_prod003_好孩子_婴儿车_gmxistng.jpg',
    '2024/01/母婴用品_cat08_prod003_好孩子_婴儿车_gmxistng.jpg,2024/01/母婴用品_cat08_prod030_NUK_奶瓶_mz3zfs6b.jpg,2024/01/母婴用品_cat08_prod031_美赞臣_奶粉_veolmxrr.jpg',
    1,
    96,
    0,
    207,
    '{"hasUserPickUp": false, "hasShopDelivery": true}',
    47,
    NOW(),
    NOW(),
    NOW(),
    0
),
(
    114,
    'NUK 宽口奶瓶',
    1,
    89.00,
    79.00,
    '安全材质，防胀气设计，易清洗',
    '<div style="margin: 0px; padding: 0px; color: #666666; font-family: tahoma, arial, ''Microsoft YaHei'', ''Hiragino Sans GB'', u5b8bu4f53, sans-serif; font-size: 12px;" align="center">
        <p><img src="2024/01/母婴用品_cat08_prod004_NUK_奶瓶_nv7odck5.jpg" alt="NUK宽口奶瓶采用安全材质，防胀气设计，易清洗。" width="750" height="750" /></p>
        <p><img src="2024/01/母婴用品_cat08_prod040_美赞臣_奶粉_6sce8aud.jpg" alt="NUK宽口奶瓶采用安全材质，防胀气设计，易清洗。" width="750" height="750" /></p>
        <p><img src="2024/01/母婴用品_cat08_prod041_费雪_玩具_a8stbsg8.jpg" alt="NUK宽口奶瓶采用安全材质，防胀气设计，易清洗。" width="750" height="750" /></p>
        <p><img src="2024/01/母婴用品_cat08_prod042_好孩子_婴儿车_sjrkcdcj.jpg" alt="NUK宽口奶瓶采用安全材质，防胀气设计，易清洗。" width="750" height="750" /></p>
        <p>NUK宽口奶瓶采用安全材质，防胀气设计，易清洗。</p>
    </div>',
    '2024/01/母婴用品_cat08_prod004_NUK_奶瓶_nv7odck5.jpg',
    '2024/01/母婴用品_cat08_prod004_NUK_奶瓶_nv7odck5.jpg,2024/01/母婴用品_cat08_prod040_美赞臣_奶粉_6sce8aud.jpg,2024/01/母婴用品_cat08_prod041_费雪_玩具_a8stbsg8.jpg',
    1,
    96,
    0,
    143,
    '{"hasUserPickUp": false, "hasShopDelivery": true}',
    47,
    NOW(),
    NOW(),
    NOW(),
    0
),
(
    115,
    '3M 汽车隔热膜',
    1,
    1999.00,
    1799.00,
    '隔热防晒，隐私保护，专业施工',
    '<div style="margin: 0px; padding: 0px; color: #666666; font-family: tahoma, arial, ''Microsoft YaHei'', ''Hiragino Sans GB'', u5b8bu4f53, sans-serif; font-size: 12px;" align="center">
        <p><img src="2024/01/汽车用品_cat09_prod001_3M_汽车贴膜_h2jsnsv1.jpg" alt="3M汽车隔热膜具有隔热防晒功能，隐私保护，需要专业施工。" width="750" height="750" /></p>
        <p><img src="2024/01/汽车用品_cat09_prod010_米其林_轮胎_w53vr3ck.jpg" alt="3M汽车隔热膜具有隔热防晒功能，隐私保护，需要专业施工。" width="750" height="750" /></p>
        <p><img src="2024/01/汽车用品_cat09_prod011_汽车脚垫_n6g0528a.jpg" alt="3M汽车隔热膜具有隔热防晒功能，隐私保护，需要专业施工。" width="750" height="750" /></p>
        <p><img src="2024/01/汽车用品_cat09_prod012_行车记录仪_1xtx8upy.jpg" alt="3M汽车隔热膜具有隔热防晒功能，隐私保护，需要专业施工。" width="750" height="750" /></p>
        <p>3M汽车隔热膜具有隔热防晒功能，隐私保护，需要专业施工。</p>
    </div>',
    '2024/01/汽车用品_cat09_prod001_3M_汽车贴膜_h2jsnsv1.jpg',
    '2024/01/汽车用品_cat09_prod001_3M_汽车贴膜_h2jsnsv1.jpg,2024/01/汽车用品_cat09_prod010_米其林_轮胎_w53vr3ck.jpg,2024/01/汽车用品_cat09_prod011_汽车脚垫_n6g0528a.jpg',
    1,
    96,
    0,
    52,
    '{"hasUserPickUp": false, "hasShopDelivery": true}',
    47,
    NOW(),
    NOW(),
    NOW(),
    0
),
(
    116,
    '米其林 汽车轮胎',
    1,
    699.00,
    649.00,
    '静音舒适，抓地力强，安全可靠',
    '<div style="margin: 0px; padding: 0px; color: #666666; font-family: tahoma, arial, ''Microsoft YaHei'', ''Hiragino Sans GB'', u5b8bu4f53, sans-serif; font-size: 12px;" align="center">
        <p><img src="2024/01/汽车用品_cat09_prod002_米其林_轮胎_ujjatl5k.jpg" alt="米其林汽车轮胎静音舒适，抓地力强，安全可靠。" width="750" height="750" /></p>
        <p><img src="2024/01/汽车用品_cat09_prod020_汽车脚垫_qik6x18e.jpg" alt="米其林汽车轮胎静音舒适，抓地力强，安全可靠。" width="750" height="750" /></p>
        <p><img src="2024/01/汽车用品_cat09_prod021_行车记录仪_bexg0gld.jpg" alt="米其林汽车轮胎静音舒适，抓地力强，安全可靠。" width="750" height="750" /></p>
        <p>米其林汽车轮胎静音舒适，抓地力强，安全可靠。</p>
    </div>',
    '2024/01/汽车用品_cat09_prod002_米其林_轮胎_ujjatl5k.jpg',
    '2024/01/汽车用品_cat09_prod002_米其林_轮胎_ujjatl5k.jpg,2024/01/汽车用品_cat09_prod020_汽车脚垫_qik6x18e.jpg,2024/01/汽车用品_cat09_prod021_行车记录仪_bexg0gld.jpg',
    1,
    96,
    0,
    396,
    '{"hasUserPickUp": false, "hasShopDelivery": true}',
    47,
    NOW(),
    NOW(),
    NOW(),
    0
),
(
    117,
    '全包围汽车脚垫',
    1,
    299.00,
    269.00,
    '全包围设计，易清洗，保护原车地毯',
    '<div style="margin: 0px; padding: 0px; color: #666666; font-family: tahoma, arial, ''Microsoft YaHei'', ''Hiragino Sans GB'', u5b8bu4f53, sans-serif; font-size: 12px;" align="center">
        <p><img src="2024/01/汽车用品_cat09_prod003_汽车脚垫_5vak0w4h.jpg" alt="全包围汽车脚垫采用全包围设计，易清洗，保护原车地毯。" width="750" height="750" /></p>
        <p><img src="2024/01/汽车用品_cat09_prod030_行车记录仪_y4reho38.jpg" alt="全包围汽车脚垫采用全包围设计，易清洗，保护原车地毯。" width="750" height="750" /></p>
        <p><img src="2024/01/汽车用品_cat09_prod031_汽车香水_wduk8f8n.jpg" alt="全包围汽车脚垫采用全包围设计，易清洗，保护原车地毯。" width="750" height="750" /></p>
        <p><img src="2024/01/汽车用品_cat09_prod032_3M_汽车贴膜_ofigyq12.jpg" alt="全包围汽车脚垫采用全包围设计，易清洗，保护原车地毯。" width="750" height="750" /></p>
        <p>全包围汽车脚垫采用全包围设计，易清洗，保护原车地毯。</p>
    </div>',
    '2024/01/汽车用品_cat09_prod003_汽车脚垫_5vak0w4h.jpg',
    '2024/01/汽车用品_cat09_prod003_汽车脚垫_5vak0w4h.jpg,2024/01/汽车用品_cat09_prod030_行车记录仪_y4reho38.jpg,2024/01/汽车用品_cat09_prod031_汽车香水_wduk8f8n.jpg',
    1,
    96,
    0,
    318,
    '{"hasUserPickUp": false, "hasShopDelivery": true}',
    47,
    NOW(),
    NOW(),
    NOW(),
    0
),
(
    118,
    '高清行车记录仪',
    1,
    399.00,
    359.00,
    '1080P高清，夜视功能，循环录像',
    '<div style="margin: 0px; padding: 0px; color: #666666; font-family: tahoma, arial, ''Microsoft YaHei'', ''Hiragino Sans GB'', u5b8bu4f53, sans-serif; font-size: 12px;" align="center">
        <p><img src="2024/01/汽车用品_cat09_prod004_行车记录仪_7ck3avf6.jpg" alt="高清行车记录仪支持1080P高清，夜视功能，循环录像。" width="750" height="750" /></p>
        <p><img src="2024/01/汽车用品_cat09_prod040_汽车香水_nhp1t4qh.jpg" alt="高清行车记录仪支持1080P高清，夜视功能，循环录像。" width="750" height="750" /></p>
        <p><img src="2024/01/汽车用品_cat09_prod041_3M_汽车贴膜_ut3hbjep.jpg" alt="高清行车记录仪支持1080P高清，夜视功能，循环录像。" width="750" height="750" /></p>
        <p>高清行车记录仪支持1080P高清，夜视功能，循环录像。</p>
    </div>',
    '2024/01/汽车用品_cat09_prod004_行车记录仪_7ck3avf6.jpg',
    '2024/01/汽车用品_cat09_prod004_行车记录仪_7ck3avf6.jpg,2024/01/汽车用品_cat09_prod040_汽车香水_nhp1t4qh.jpg,2024/01/汽车用品_cat09_prod041_3M_汽车贴膜_ut3hbjep.jpg',
    1,
    96,
    0,
    422,
    '{"hasUserPickUp": false, "hasShopDelivery": true}',
    47,
    NOW(),
    NOW(),
    NOW(),
    0
),
(
    119,
    '汽车香氛 车载香水',
    1,
    59.00,
    49.00,
    '持久留香，清新空气，多种香型',
    '<div style="margin: 0px; padding: 0px; color: #666666; font-family: tahoma, arial, ''Microsoft YaHei'', ''Hiragino Sans GB'', u5b8bu4f53, sans-serif; font-size: 12px;" align="center">
        <p><img src="2024/01/汽车用品_cat09_prod005_汽车香水_nagu1e6m.jpg" alt="汽车香氛车载香水持久留香，清新空气，多种香型可选。" width="750" height="750" /></p>
        <p><img src="2024/01/汽车用品_cat09_prod050_3M_汽车贴膜_hl8lh66u.jpg" alt="汽车香氛车载香水持久留香，清新空气，多种香型可选。" width="750" height="750" /></p>
        <p><img src="2024/01/汽车用品_cat09_prod051_米其林_轮胎_41n9pb1w.jpg" alt="汽车香氛车载香水持久留香，清新空气，多种香型可选。" width="750" height="750" /></p>
        <p>汽车香氛车载香水持久留香，清新空气，多种香型可选。</p>
    </div>',
    '2024/01/汽车用品_cat09_prod005_汽车香水_nagu1e6m.jpg',
    '2024/01/汽车用品_cat09_prod005_汽车香水_nagu1e6m.jpg,2024/01/汽车用品_cat09_prod050_3M_汽车贴膜_hl8lh66u.jpg,2024/01/汽车用品_cat09_prod051_米其林_轮胎_41n9pb1w.jpg',
    1,
    96,
    0,
    192,
    '{"hasUserPickUp": false, "hasShopDelivery": true}',
    47,
    NOW(),
    NOW(),
    NOW(),
    0
),
(
    120,
    'Coleman 户外帐篷',
    1,
    899.00,
    799.00,
    '防水透气，易搭建，适合露营',
    '<div style="margin: 0px; padding: 0px; color: #666666; font-family: tahoma, arial, ''Microsoft YaHei'', ''Hiragino Sans GB'', u5b8bu4f53, sans-serif; font-size: 12px;" align="center">
        <p><img src="2024/01/户外运动_cat10_prod001_Coleman_帐篷_wuerz35x.jpg" alt="Coleman户外帐篷防水透气，易搭建，适合露营使用。" width="750" height="750" /></p>
        <p><img src="2024/01/户外运动_cat10_prod010_Osprey_背包_eiyvj8ht.jpg" alt="Coleman户外帐篷防水透气，易搭建，适合露营使用。" width="750" height="750" /></p>
        <p><img src="2024/01/户外运动_cat10_prod011_Columbia_冲锋衣_s3w9fph5.jpg" alt="Coleman户外帐篷防水透气，易搭建，适合露营使用。" width="750" height="750" /></p>
        <p>Coleman户外帐篷防水透气，易搭建，适合露营使用。</p>
    </div>',
    '2024/01/户外运动_cat10_prod001_Coleman_帐篷_wuerz35x.jpg',
    '2024/01/户外运动_cat10_prod001_Coleman_帐篷_wuerz35x.jpg,2024/01/户外运动_cat10_prod010_Osprey_背包_eiyvj8ht.jpg,2024/01/户外运动_cat10_prod011_Columbia_冲锋衣_s3w9fph5.jpg',
    1,
    88,
    0,
    500,
    '{"hasUserPickUp": false, "hasShopDelivery": true}',
    47,
    NOW(),
    NOW(),
    NOW(),
    0
),
(
    121,
    'Osprey 户外登山背包',
    1,
    1299.00,
    1199.00,
    '轻量化设计，背负舒适，大容量',
    '<div style="margin: 0px; padding: 0px; color: #666666; font-family: tahoma, arial, ''Microsoft YaHei'', ''Hiragino Sans GB'', u5b8bu4f53, sans-serif; font-size: 12px;" align="center">
        <p><img src="2024/01/户外运动_cat10_prod002_Osprey_背包_k99flgso.jpg" alt="Osprey户外登山背包轻量化设计，背负舒适，大容量。" width="750" height="750" /></p>
        <p><img src="2024/01/户外运动_cat10_prod020_Columbia_冲锋衣_htuwnahb.jpg" alt="Osprey户外登山背包轻量化设计，背负舒适，大容量。" width="750" height="750" /></p>
        <p><img src="2024/01/户外运动_cat10_prod021_钓鱼竿_z8e80rkm.jpg" alt="Osprey户外登山背包轻量化设计，背负舒适，大容量。" width="750" height="750" /></p>
        <p>Osprey户外登山背包轻量化设计，背负舒适，大容量。</p>
    </div>',
    '2024/01/户外运动_cat10_prod002_Osprey_背包_k99flgso.jpg',
    '2024/01/户外运动_cat10_prod002_Osprey_背包_k99flgso.jpg,2024/01/户外运动_cat10_prod020_Columbia_冲锋衣_htuwnahb.jpg,2024/01/户外运动_cat10_prod021_钓鱼竿_z8e80rkm.jpg',
    1,
    88,
    0,
    471,
    '{"hasUserPickUp": false, "hasShopDelivery": true}',
    47,
    NOW(),
    NOW(),
    NOW(),
    0
),
(
    122,
    'Columbia 冲锋衣',
    1,
    899.00,
    799.00,
    '防水透气，防风保暖，户外必备',
    '<div style="margin: 0px; padding: 0px; color: #666666; font-family: tahoma, arial, ''Microsoft YaHei'', ''Hiragino Sans GB'', u5b8bu4f53, sans-serif; font-size: 12px;" align="center">
        <p><img src="2024/01/户外运动_cat10_prod003_Columbia_冲锋衣_iddtf9vt.jpg" alt="Columbia冲锋衣防水透气，防风保暖，是户外运动的必备装备。" width="750" height="750" /></p>
        <p><img src="2024/01/户外运动_cat10_prod030_钓鱼竿_n2ancu0k.jpg" alt="Columbia冲锋衣防水透气，防风保暖，是户外运动的必备装备。" width="750" height="750" /></p>
        <p><img src="2024/01/户外运动_cat10_prod031_自行车_yw54yz5i.jpg" alt="Columbia冲锋衣防水透气，防风保暖，是户外运动的必备装备。" width="750" height="750" /></p>
        <p><img src="2024/01/户外运动_cat10_prod032_Coleman_帐篷_3pqpcdqs.jpg" alt="Columbia冲锋衣防水透气，防风保暖，是户外运动的必备装备。" width="750" height="750" /></p>
        <p>Columbia冲锋衣防水透气，防风保暖，是户外运动的必备装备。</p>
    </div>',
    '2024/01/户外运动_cat10_prod003_Columbia_冲锋衣_iddtf9vt.jpg',
    '2024/01/户外运动_cat10_prod003_Columbia_冲锋衣_iddtf9vt.jpg,2024/01/户外运动_cat10_prod030_钓鱼竿_n2ancu0k.jpg,2024/01/户外运动_cat10_prod031_自行车_yw54yz5i.jpg',
    1,
    88,
    0,
    92,
    '{"hasUserPickUp": false, "hasShopDelivery": true}',
    47,
    NOW(),
    NOW(),
    NOW(),
    0
),
(
    123,
    '专业钓鱼竿',
    1,
    399.00,
    359.00,
    '碳素材质，轻便耐用，适合多种钓法',
    '<div style="margin: 0px; padding: 0px; color: #666666; font-family: tahoma, arial, ''Microsoft YaHei'', ''Hiragino Sans GB'', u5b8bu4f53, sans-serif; font-size: 12px;" align="center">
        <p><img src="2024/01/户外运动_cat10_prod004_钓鱼竿_nmmu4dyq.jpg" alt="专业钓鱼竿采用碳素材质，轻便耐用，适合多种钓法。" width="750" height="750" /></p>
        <p><img src="2024/01/户外运动_cat10_prod040_自行车_z27inlaf.jpg" alt="专业钓鱼竿采用碳素材质，轻便耐用，适合多种钓法。" width="750" height="750" /></p>
        <p><img src="2024/01/户外运动_cat10_prod041_Coleman_帐篷_nnrnhkoo.jpg" alt="专业钓鱼竿采用碳素材质，轻便耐用，适合多种钓法。" width="750" height="750" /></p>
        <p><img src="2024/01/户外运动_cat10_prod042_Osprey_背包_gt63nkui.jpg" alt="专业钓鱼竿采用碳素材质，轻便耐用，适合多种钓法。" width="750" height="750" /></p>
        <p>专业钓鱼竿采用碳素材质，轻便耐用，适合多种钓法。</p>
    </div>',
    '2024/01/户外运动_cat10_prod004_钓鱼竿_nmmu4dyq.jpg',
    '2024/01/户外运动_cat10_prod004_钓鱼竿_nmmu4dyq.jpg,2024/01/户外运动_cat10_prod040_自行车_z27inlaf.jpg,2024/01/户外运动_cat10_prod041_Coleman_帐篷_nnrnhkoo.jpg',
    1,
    88,
    0,
    269,
    '{"hasUserPickUp": false, "hasShopDelivery": true}',
    47,
    NOW(),
    NOW(),
    NOW(),
    0
),
(
    124,
    '山地自行车',
    1,
    1299.00,
    1199.00,
    '21速变速，碟刹系统，适合多种路况',
    '<div style="margin: 0px; padding: 0px; color: #666666; font-family: tahoma, arial, ''Microsoft YaHei'', ''Hiragino Sans GB'', u5b8bu4f53, sans-serif; font-size: 12px;" align="center">
        <p><img src="2024/01/户外运动_cat10_prod005_自行车_q81k5wzt.jpg" alt="山地自行车配备21速变速，碟刹系统，适合多种路况。" width="750" height="750" /></p>
        <p><img src="2024/01/户外运动_cat10_prod050_Coleman_帐篷_nwmz0wm9.jpg" alt="山地自行车配备21速变速，碟刹系统，适合多种路况。" width="750" height="750" /></p>
        <p><img src="2024/01/户外运动_cat10_prod051_Osprey_背包_5btpv7zl.jpg" alt="山地自行车配备21速变速，碟刹系统，适合多种路况。" width="750" height="750" /></p>
        <p>山地自行车配备21速变速，碟刹系统，适合多种路况。</p>
    </div>',
    '2024/01/户外运动_cat10_prod005_自行车_q81k5wzt.jpg',
    '2024/01/户外运动_cat10_prod005_自行车_q81k5wzt.jpg,2024/01/户外运动_cat10_prod050_Coleman_帐篷_nwmz0wm9.jpg,2024/01/户外运动_cat10_prod051_Osprey_背包_5btpv7zl.jpg',
    1,
    88,
    0,
    325,
    '{"hasUserPickUp": false, "hasShopDelivery": true}',
    47,
    NOW(),
    NOW(),
    NOW(),
    0
);


-- ============================================
-- SKU表 tz_sku
-- ============================================

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
) VALUES
(
    405,
    78,
    '',
    9999.00,
    8999.00,
    0,
    364,
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
),
(
    406,
    79,
    '',
    3999.00,
    3699.00,
    0,
    452,
    NOW(),
    NOW(),
    NULL,
    NULL,
    '2024/01/手机数码_cat01_prod002_小米14_ywt98pju.jpg',
    '',
    '小米14 5G智能手机',
    0,
    NULL,
    NULL,
    1,
    0
),
(
    407,
    80,
    '',
    6999.00,
    6499.00,
    0,
    239,
    NOW(),
    NOW(),
    NULL,
    NULL,
    '2024/01/手机数码_cat01_prod003_华为Mate_60_3umd03ae.jpg',
    '',
    '华为Mate 60 Pro 5G手机',
    0,
    NULL,
    NULL,
    1,
    0
),
(
    408,
    81,
    '',
    8999.00,
    8499.00,
    0,
    305,
    NOW(),
    NOW(),
    NULL,
    NULL,
    '2024/01/手机数码_cat01_prod004_Samsung_Galaxy_S24_uasupvmv.jpg',
    '',
    'Samsung Galaxy S24 Ultra 5G手机',
    0,
    NULL,
    NULL,
    1,
    0
),
(
    409,
    82,
    '',
    8999.00,
    8499.00,
    0,
    400,
    NOW(),
    NOW(),
    NULL,
    NULL,
    '2024/01/手机数码_cat01_prod005_iPad_Pro_god0ale3.jpg',
    '',
    'Apple iPad Pro 12.9英寸平板电脑',
    0,
    NULL,
    NULL,
    1,
    0
),
(
    410,
    83,
    '',
    15999.00,
    14999.00,
    0,
    351,
    NOW(),
    NOW(),
    NULL,
    NULL,
    '2024/01/手机数码_cat01_prod006_MacBook_Pro_b910zrsj.jpg',
    '',
    'Apple MacBook Pro 14英寸笔记本电脑',
    0,
    NULL,
    NULL,
    1,
    0
),
(
    411,
    84,
    '',
    1899.00,
    1699.00,
    0,
    480,
    NOW(),
    NOW(),
    NULL,
    NULL,
    '2024/01/手机数码_cat01_prod007_AirPods_Pro_d2xr13rt.jpg',
    '',
    'Apple AirPods Pro 2 无线耳机',
    0,
    NULL,
    NULL,
    1,
    0
),
(
    412,
    85,
    '',
    2999.00,
    2799.00,
    0,
    336,
    NOW(),
    NOW(),
    NULL,
    NULL,
    '2024/01/手机数码_cat01_prod008_Apple_Watch_ma1awhu2.jpg',
    '',
    'Apple Watch Series 9 智能手表',
    0,
    NULL,
    NULL,
    1,
    0
),
(
    413,
    86,
    '',
    380.00,
    350.00,
    0,
    262,
    NOW(),
    NOW(),
    NULL,
    NULL,
    '2024/01/美妆护肤_cat02_prod001_Dior_口红_rfgmdvu6.jpg',
    '',
    'Dior 迪奥烈艳蓝金唇膏',
    0,
    NULL,
    NULL,
    1,
    0
),
(
    414,
    87,
    '',
    1200.00,
    1100.00,
    0,
    458,
    NOW(),
    NOW(),
    NULL,
    NULL,
    '2024/01/美妆护肤_cat02_prod002_Chanel_香水_4110q2vw.jpg',
    '',
    'Chanel 香奈儿5号香水',
    0,
    NULL,
    NULL,
    1,
    0
),
(
    415,
    88,
    '',
    1590.00,
    1490.00,
    0,
    383,
    NOW(),
    NOW(),
    NULL,
    NULL,
    '2024/01/美妆护肤_cat02_prod003_SK-II_神仙水_kywwa4p9.jpg',
    '',
    'SK-II 护肤精华露 神仙水',
    0,
    NULL,
    NULL,
    1,
    0
),
(
    416,
    89,
    '',
    199.00,
    179.00,
    0,
    401,
    NOW(),
    NOW(),
    NULL,
    NULL,
    '2024/01/美妆护肤_cat02_prod004_LOreal_粉底_14r751xy.jpg',
    '',
    'L''Oreal 欧莱雅持妆粉底液',
    0,
    NULL,
    NULL,
    1,
    0
),
(
    417,
    90,
    '',
    899.00,
    799.00,
    0,
    278,
    NOW(),
    NOW(),
    NULL,
    NULL,
    '2024/01/运动服饰_cat03_prod001_Nike_Air_Max_psujsdav.jpg',
    '',
    'Nike Air Max 270 运动鞋',
    0,
    NULL,
    NULL,
    1,
    0
),
(
    418,
    91,
    '',
    599.00,
    549.00,
    0,
    298,
    NOW(),
    NOW(),
    NULL,
    NULL,
    '2024/01/运动服饰_cat03_prod002_Adidas_运动服_b1cnt9ct.jpg',
    '',
    'Adidas 阿迪达斯运动套装',
    0,
    NULL,
    NULL,
    1,
    0
),
(
    419,
    92,
    '',
    1299.00,
    1199.00,
    0,
    373,
    NOW(),
    NOW(),
    NULL,
    NULL,
    '2024/01/运动服饰_cat03_prod003_Nike_篮球鞋_q19qylsp.jpg',
    '',
    'Nike LeBron 20 篮球鞋',
    0,
    NULL,
    NULL,
    1,
    0
),
(
    420,
    93,
    '',
    199.00,
    179.00,
    0,
    133,
    NOW(),
    NOW(),
    NULL,
    NULL,
    '2024/01/运动服饰_cat03_prod004_Yoga_瑜伽垫_ihtgbfn3.jpg',
    '',
    '专业瑜伽垫 防滑加厚',
    0,
    NULL,
    NULL,
    1,
    0
),
(
    421,
    94,
    '',
    128.00,
    99.00,
    0,
    469,
    NOW(),
    NOW(),
    NULL,
    NULL,
    '2024/01/美味零食_cat04_prod001_费列罗巧克力_awvqty9o.jpg',
    '',
    '费列罗榛果威化巧克力',
    0,
    NULL,
    NULL,
    1,
    0
),
(
    422,
    95,
    '',
    15.00,
    12.00,
    0,
    237,
    NOW(),
    NOW(),
    NULL,
    NULL,
    '2024/01/美味零食_cat04_prod002_乐事薯片_jkxb0du0.jpg',
    '',
    '乐事薯片 经典原味',
    0,
    NULL,
    NULL,
    1,
    0
),
(
    423,
    96,
    '',
    18.00,
    15.00,
    0,
    62,
    NOW(),
    NOW(),
    NULL,
    NULL,
    '2024/01/美味零食_cat04_prod003_奥利奥饼干_3w6gr582.jpg',
    '',
    '奥利奥夹心饼干',
    0,
    NULL,
    NULL,
    1,
    0
),
(
    424,
    97,
    '',
    5.00,
    4.50,
    0,
    200,
    NOW(),
    NOW(),
    NULL,
    NULL,
    '2024/01/美味零食_cat04_prod004_可口可乐_64lspopf.jpg',
    '',
    '可口可乐 经典汽水',
    0,
    NULL,
    NULL,
    1,
    0
),
(
    425,
    98,
    '',
    89.00,
    79.00,
    0,
    331,
    NOW(),
    NOW(),
    NULL,
    NULL,
    '2024/01/美味零食_cat04_prod005_三只松鼠坚果_6npe78a9.jpg',
    '',
    '三只松鼠每日坚果',
    0,
    NULL,
    NULL,
    1,
    0
),
(
    426,
    99,
    '',
    2999.00,
    2699.00,
    0,
    54,
    NOW(),
    NOW(),
    NULL,
    NULL,
    '2024/01/家居用品_cat05_prod001_IKEA_沙发_tm6dxhe1.jpg',
    '',
    'IKEA 宜家三人沙发',
    0,
    NULL,
    NULL,
    1,
    0
),
(
    427,
    100,
    '',
    399.00,
    359.00,
    0,
    121,
    NOW(),
    NOW(),
    NULL,
    NULL,
    '2024/01/家居用品_cat05_prod002_飞利浦台灯_y0yxp5d8.jpg',
    '',
    '飞利浦 LED护眼台灯',
    0,
    NULL,
    NULL,
    1,
    0
),
(
    428,
    101,
    '',
    89.00,
    79.00,
    0,
    83,
    NOW(),
    NOW(),
    NULL,
    NULL,
    '2024/01/家居用品_cat05_prod003_无印良品_花瓶_mdvsj89m.jpg',
    '',
    '无印良品 简约玻璃花瓶',
    0,
    NULL,
    NULL,
    1,
    0
),
(
    429,
    102,
    '',
    1999.00,
    1799.00,
    0,
    194,
    NOW(),
    NOW(),
    NULL,
    NULL,
    '2024/01/家居用品_cat05_prod004_宜家_床_ow8rjeaa.jpg',
    '',
    'IKEA 宜家双人床',
    0,
    NULL,
    NULL,
    1,
    0
),
(
    430,
    103,
    '',
    998.00,
    899.00,
    0,
    268,
    NOW(),
    NOW(),
    NULL,
    NULL,
    '2024/01/图书文具_cat06_prod001_Kindle_电子书_6c3ae3pz.jpg',
    '',
    'Amazon Kindle Paperwhite 电子书阅读器',
    0,
    NULL,
    NULL,
    1,
    0
),
(
    431,
    104,
    '',
    199.00,
    179.00,
    0,
    221,
    NOW(),
    NOW(),
    NULL,
    NULL,
    '2024/01/图书文具_cat06_prod002_Moleskine_笔记本_rtsiaht3.jpg',
    '',
    'Moleskine 经典笔记本',
    0,
    NULL,
    NULL,
    1,
    0
),
(
    432,
    105,
    '',
    299.00,
    269.00,
    0,
    66,
    NOW(),
    NOW(),
    NULL,
    NULL,
    '2024/01/图书文具_cat06_prod003_Pilot_钢笔_tzjc83fb.jpg',
    '',
    'Pilot 百乐钢笔',
    0,
    NULL,
    NULL,
    1,
    0
),
(
    433,
    106,
    '',
    89.00,
    79.00,
    0,
    153,
    NOW(),
    NOW(),
    NULL,
    NULL,
    '2024/01/图书文具_cat06_prod004_得力_文具_azdvd0mn.jpg',
    '',
    '得力 办公文具套装',
    0,
    NULL,
    NULL,
    1,
    0
),
(
    434,
    107,
    '',
    199.00,
    179.00,
    0,
    245,
    NOW(),
    NOW(),
    NULL,
    NULL,
    '2024/01/服装配饰_cat07_prod001_Uniqlo_衬衫_9t945krq.jpg',
    '',
    'Uniqlo 优衣库经典衬衫',
    0,
    NULL,
    NULL,
    1,
    0
),
(
    435,
    108,
    '',
    699.00,
    649.00,
    0,
    341,
    NOW(),
    NOW(),
    NULL,
    NULL,
    '2024/01/服装配饰_cat07_prod002_Nike_运动鞋_cp7xm2l3.jpg',
    '',
    'Nike 耐克运动鞋',
    0,
    NULL,
    NULL,
    1,
    0
),
(
    436,
    109,
    '',
    2999.00,
    2799.00,
    0,
    355,
    NOW(),
    NOW(),
    NULL,
    NULL,
    '2024/01/服装配饰_cat07_prod003_Coach_包_f6tg85b8.jpg',
    '',
    'Coach 蔻驰经典手提包',
    0,
    NULL,
    NULL,
    1,
    0
),
(
    437,
    110,
    '',
    59999.00,
    56999.00,
    0,
    66,
    NOW(),
    NOW(),
    NULL,
    NULL,
    '2024/01/服装配饰_cat07_prod004_Rolex_手表_48l9w8yq.jpg',
    '',
    'Rolex 劳力士经典腕表',
    0,
    NULL,
    NULL,
    1,
    0
),
(
    438,
    111,
    '',
    299.00,
    279.00,
    0,
    346,
    NOW(),
    NOW(),
    NULL,
    NULL,
    '2024/01/母婴用品_cat08_prod001_美赞臣_奶粉_cqka7n6k.jpg',
    '',
    '美赞臣 婴幼儿配方奶粉',
    0,
    NULL,
    NULL,
    1,
    0
),
(
    439,
    112,
    '',
    199.00,
    179.00,
    0,
    399,
    NOW(),
    NOW(),
    NULL,
    NULL,
    '2024/01/母婴用品_cat08_prod002_费雪_玩具_e6l6e1y9.jpg',
    '',
    '费雪 益智玩具',
    0,
    NULL,
    NULL,
    1,
    0
),
(
    440,
    113,
    '',
    899.00,
    799.00,
    0,
    55,
    NOW(),
    NOW(),
    NULL,
    NULL,
    '2024/01/母婴用品_cat08_prod003_好孩子_婴儿车_gmxistng.jpg',
    '',
    '好孩子 婴儿推车',
    0,
    NULL,
    NULL,
    1,
    0
),
(
    441,
    114,
    '',
    89.00,
    79.00,
    0,
    99,
    NOW(),
    NOW(),
    NULL,
    NULL,
    '2024/01/母婴用品_cat08_prod004_NUK_奶瓶_nv7odck5.jpg',
    '',
    'NUK 宽口奶瓶',
    0,
    NULL,
    NULL,
    1,
    0
),
(
    442,
    115,
    '',
    1999.00,
    1799.00,
    0,
    404,
    NOW(),
    NOW(),
    NULL,
    NULL,
    '2024/01/汽车用品_cat09_prod001_3M_汽车贴膜_h2jsnsv1.jpg',
    '',
    '3M 汽车隔热膜',
    0,
    NULL,
    NULL,
    1,
    0
),
(
    443,
    116,
    '',
    699.00,
    649.00,
    0,
    99,
    NOW(),
    NOW(),
    NULL,
    NULL,
    '2024/01/汽车用品_cat09_prod002_米其林_轮胎_ujjatl5k.jpg',
    '',
    '米其林 汽车轮胎',
    0,
    NULL,
    NULL,
    1,
    0
),
(
    444,
    117,
    '',
    299.00,
    269.00,
    0,
    105,
    NOW(),
    NOW(),
    NULL,
    NULL,
    '2024/01/汽车用品_cat09_prod003_汽车脚垫_5vak0w4h.jpg',
    '',
    '全包围汽车脚垫',
    0,
    NULL,
    NULL,
    1,
    0
),
(
    445,
    118,
    '',
    399.00,
    359.00,
    0,
    447,
    NOW(),
    NOW(),
    NULL,
    NULL,
    '2024/01/汽车用品_cat09_prod004_行车记录仪_7ck3avf6.jpg',
    '',
    '高清行车记录仪',
    0,
    NULL,
    NULL,
    1,
    0
),
(
    446,
    119,
    '',
    59.00,
    49.00,
    0,
    482,
    NOW(),
    NOW(),
    NULL,
    NULL,
    '2024/01/汽车用品_cat09_prod005_汽车香水_nagu1e6m.jpg',
    '',
    '汽车香氛 车载香水',
    0,
    NULL,
    NULL,
    1,
    0
),
(
    447,
    120,
    '',
    899.00,
    799.00,
    0,
    72,
    NOW(),
    NOW(),
    NULL,
    NULL,
    '2024/01/户外运动_cat10_prod001_Coleman_帐篷_wuerz35x.jpg',
    '',
    'Coleman 户外帐篷',
    0,
    NULL,
    NULL,
    1,
    0
),
(
    448,
    121,
    '',
    1299.00,
    1199.00,
    0,
    494,
    NOW(),
    NOW(),
    NULL,
    NULL,
    '2024/01/户外运动_cat10_prod002_Osprey_背包_k99flgso.jpg',
    '',
    'Osprey 户外登山背包',
    0,
    NULL,
    NULL,
    1,
    0
),
(
    449,
    122,
    '',
    899.00,
    799.00,
    0,
    488,
    NOW(),
    NOW(),
    NULL,
    NULL,
    '2024/01/户外运动_cat10_prod003_Columbia_冲锋衣_iddtf9vt.jpg',
    '',
    'Columbia 冲锋衣',
    0,
    NULL,
    NULL,
    1,
    0
),
(
    450,
    123,
    '',
    399.00,
    359.00,
    0,
    151,
    NOW(),
    NOW(),
    NULL,
    NULL,
    '2024/01/户外运动_cat10_prod004_钓鱼竿_nmmu4dyq.jpg',
    '',
    '专业钓鱼竿',
    0,
    NULL,
    NULL,
    1,
    0
),
(
    451,
    124,
    '',
    1299.00,
    1199.00,
    0,
    215,
    NOW(),
    NOW(),
    NULL,
    NULL,
    '2024/01/户外运动_cat10_prod005_自行车_q81k5wzt.jpg',
    '',
    '山地自行车',
    0,
    NULL,
    NULL,
    1,
    0
);