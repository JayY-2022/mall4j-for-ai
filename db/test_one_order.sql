-- 生成1条测试订单数据
-- 生成时间: 2025-11-19 15:30:32

-- 正在从数据库获取基础数据...
-- 获取到 10 个商品, 用户: 活力老840

-- 设置字符集为utf8mb4，确保中文正确显示
SET NAMES utf8mb4;

-- 插入订单地址快照
INSERT INTO `tz_user_addr_order`(`addr_order_id`,`addr_id`,`user_id`,`receiver`,`province_id`,`province`,`area_id`,`area`,`city_id`,`city`,`addr`,`mobile`,`create_time`,`version`) VALUES
(100,5,'0fe1676cfd0c4f8ca31387d007a010b4','朱强平',510000000000,'四川省',510104000000,'锦江区',510100000000,'成都市','光明巷281号中心40号1146室','15820172043','2025-06-09 14:30:33',0);

-- 插入订单主表
INSERT INTO `tz_order`(`order_id`,`shop_id`,`prod_name`,`user_id`,`order_number`,`total`,`actual_total`,`pay_type`,`remarks`,`status`,`dvy_type`,`dvy_id`,`dvy_flow_id`,`freight_amount`,`addr_order_id`,`product_nums`,`create_time`,`update_time`,`pay_time`,`dvy_time`,`finally_time`,`cancel_time`,`is_payed`,`delete_status`,`refund_sts`,`reduce_amount`,`order_type`,`close_type`) VALUES
(17635374336519683,1,'旗舰店官网 自拍神器 梵高定制','0fe1676cfd0c4f8ca31387d007a010b4','17635374336519683',13998.00,13998.00,1,NULL,5,NULL,NULL,'562478833316',0.00,100,2,'2025-06-09 14:30:33','2025-06-09 14:30:33','2025-06-09 15:02:33','2025-06-10 15:02:33','2025-06-26 15:02:33',NULL,1,0,0,0.00,NULL,NULL);

-- 插入订单项
INSERT INTO `tz_order_item`(`shop_id`,`order_number`,`prod_id`,`sku_id`,`prod_count`,`prod_name`,`sku_name`,`pic`,`price`,`user_id`,`product_total_amount`,`rec_time`,`comm_sts`,`distribution_card_no`,`basket_date`) VALUES
(1,'17635374336519683',71,384,2,'旗舰店官网 自拍神器 梵高定制','心水金 3.6 寸 ','2019/04/667e4ce211b44c6da10891f42927fc11.jpg',6999.00,'0fe1676cfd0c4f8ca31387d007a010b4',13998.00,'2025-06-09 14:30:33',0,NULL,'2025-06-09 02:30:33');

-- 插入订单结算（已支付订单）
INSERT INTO `tz_order_settlement`(`pay_no`,`biz_pay_no`,`order_number`,`pay_type`,`pay_type_name`,`pay_amount`,`is_clearing`,`user_id`,`create_time`,`clearing_time`,`version`,`pay_status`) VALUES
('17635374336511534',NULL,'17635374336519683',1,NULL,13998.00,0,'0fe1676cfd0c4f8ca31387d007a010b4','2025-06-09 15:02:33',NULL,0,1);

-- 订单信息摘要:
-- 订单号: 17635374336519683
-- 用户: 活力老840 (0fe1676cfd0c4f8ca31387d007a010b4)
-- 商品: 旗舰店官网 自拍神器 梵高定制 x2
-- 订单金额: 13998.00元
-- 运费: 0.00元
-- 实际支付: 13998.00元
-- 订单状态: 5 (交易成功)
-- 创建时间: 2025-06-09 14:30:33
-- 支付时间: 2025-06-09 15:02:33
-- 发货时间: 2025-06-10 15:02:33
-- 完成时间: 2025-06-26 15:02:33
