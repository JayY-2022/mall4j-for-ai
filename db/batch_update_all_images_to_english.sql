-- 批量更新图片文件名：中文 -> 英文
-- 自动生成脚本

-- 设置字符集为utf8mb4，确保中文正确显示
SET NAMES utf8mb4;

START TRANSACTION;

-- 更新文件: 图书文具_cat06_prod001_Kindle_电子书_6c3ae3pz.jpg -> Stationery_cat06_prod001_Kindle_E-Book_6c3ae3pz.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Stationery_cat06_prod001_Kindle_E-Book_6c3ae3pz.jpg' WHERE `pic` = '2024/01/图书文具_cat06_prod001_Kindle_电子书_6c3ae3pz.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/图书文具_cat06_prod001_Kindle_电子书_6c3ae3pz.jpg', '2024/01/Stationery_cat06_prod001_Kindle_E-Book_6c3ae3pz.jpg') WHERE `imgs` LIKE '%2024/01/图书文具_cat06_prod001_Kindle_电子书_6c3ae3pz.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/图书文具_cat06_prod001_Kindle_电子书_6c3ae3pz.jpg', '2024/01/Stationery_cat06_prod001_Kindle_E-Book_6c3ae3pz.jpg') WHERE `content` LIKE '%2024/01/图书文具_cat06_prod001_Kindle_电子书_6c3ae3pz.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Stationery_cat06_prod001_Kindle_E-Book_6c3ae3pz.jpg' WHERE `pic` = '2024/01/图书文具_cat06_prod001_Kindle_电子书_6c3ae3pz.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Stationery_cat06_prod001_Kindle_E-Book_6c3ae3pz.jpg' WHERE `img_path` = '2024/01/图书文具_cat06_prod001_Kindle_电子书_6c3ae3pz.jpg';

-- 更新文件: 图书文具_cat06_prod002_Moleskine_笔记本_rtsiaht3.jpg -> Stationery_cat06_prod002_Moleskine_Notebook_rtsiaht3.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Stationery_cat06_prod002_Moleskine_Notebook_rtsiaht3.jpg' WHERE `pic` = '2024/01/图书文具_cat06_prod002_Moleskine_笔记本_rtsiaht3.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/图书文具_cat06_prod002_Moleskine_笔记本_rtsiaht3.jpg', '2024/01/Stationery_cat06_prod002_Moleskine_Notebook_rtsiaht3.jpg') WHERE `imgs` LIKE '%2024/01/图书文具_cat06_prod002_Moleskine_笔记本_rtsiaht3.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/图书文具_cat06_prod002_Moleskine_笔记本_rtsiaht3.jpg', '2024/01/Stationery_cat06_prod002_Moleskine_Notebook_rtsiaht3.jpg') WHERE `content` LIKE '%2024/01/图书文具_cat06_prod002_Moleskine_笔记本_rtsiaht3.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Stationery_cat06_prod002_Moleskine_Notebook_rtsiaht3.jpg' WHERE `pic` = '2024/01/图书文具_cat06_prod002_Moleskine_笔记本_rtsiaht3.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Stationery_cat06_prod002_Moleskine_Notebook_rtsiaht3.jpg' WHERE `img_path` = '2024/01/图书文具_cat06_prod002_Moleskine_笔记本_rtsiaht3.jpg';

-- 更新文件: 图书文具_cat06_prod003_Pilot_钢笔_tzjc83fb.jpg -> Stationery_cat06_prod003_Pilot_Pen_tzjc83fb.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Stationery_cat06_prod003_Pilot_Pen_tzjc83fb.jpg' WHERE `pic` = '2024/01/图书文具_cat06_prod003_Pilot_钢笔_tzjc83fb.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/图书文具_cat06_prod003_Pilot_钢笔_tzjc83fb.jpg', '2024/01/Stationery_cat06_prod003_Pilot_Pen_tzjc83fb.jpg') WHERE `imgs` LIKE '%2024/01/图书文具_cat06_prod003_Pilot_钢笔_tzjc83fb.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/图书文具_cat06_prod003_Pilot_钢笔_tzjc83fb.jpg', '2024/01/Stationery_cat06_prod003_Pilot_Pen_tzjc83fb.jpg') WHERE `content` LIKE '%2024/01/图书文具_cat06_prod003_Pilot_钢笔_tzjc83fb.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Stationery_cat06_prod003_Pilot_Pen_tzjc83fb.jpg' WHERE `pic` = '2024/01/图书文具_cat06_prod003_Pilot_钢笔_tzjc83fb.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Stationery_cat06_prod003_Pilot_Pen_tzjc83fb.jpg' WHERE `img_path` = '2024/01/图书文具_cat06_prod003_Pilot_钢笔_tzjc83fb.jpg';

-- 更新文件: 图书文具_cat06_prod004_得力_文具_azdvd0mn.jpg -> Stationery_cat06_prod004_Deli_Stationery_azdvd0mn.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Stationery_cat06_prod004_Deli_Stationery_azdvd0mn.jpg' WHERE `pic` = '2024/01/图书文具_cat06_prod004_得力_文具_azdvd0mn.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/图书文具_cat06_prod004_得力_文具_azdvd0mn.jpg', '2024/01/Stationery_cat06_prod004_Deli_Stationery_azdvd0mn.jpg') WHERE `imgs` LIKE '%2024/01/图书文具_cat06_prod004_得力_文具_azdvd0mn.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/图书文具_cat06_prod004_得力_文具_azdvd0mn.jpg', '2024/01/Stationery_cat06_prod004_Deli_Stationery_azdvd0mn.jpg') WHERE `content` LIKE '%2024/01/图书文具_cat06_prod004_得力_文具_azdvd0mn.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Stationery_cat06_prod004_Deli_Stationery_azdvd0mn.jpg' WHERE `pic` = '2024/01/图书文具_cat06_prod004_得力_文具_azdvd0mn.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Stationery_cat06_prod004_Deli_Stationery_azdvd0mn.jpg' WHERE `img_path` = '2024/01/图书文具_cat06_prod004_得力_文具_azdvd0mn.jpg';

-- 更新文件: 图书文具_cat06_prod010_Moleskine_笔记本_7fupr5sq.jpg -> Stationery_cat06_prod010_Moleskine_Notebook_7fupr5sq.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Stationery_cat06_prod010_Moleskine_Notebook_7fupr5sq.jpg' WHERE `pic` = '2024/01/图书文具_cat06_prod010_Moleskine_笔记本_7fupr5sq.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/图书文具_cat06_prod010_Moleskine_笔记本_7fupr5sq.jpg', '2024/01/Stationery_cat06_prod010_Moleskine_Notebook_7fupr5sq.jpg') WHERE `imgs` LIKE '%2024/01/图书文具_cat06_prod010_Moleskine_笔记本_7fupr5sq.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/图书文具_cat06_prod010_Moleskine_笔记本_7fupr5sq.jpg', '2024/01/Stationery_cat06_prod010_Moleskine_Notebook_7fupr5sq.jpg') WHERE `content` LIKE '%2024/01/图书文具_cat06_prod010_Moleskine_笔记本_7fupr5sq.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Stationery_cat06_prod010_Moleskine_Notebook_7fupr5sq.jpg' WHERE `pic` = '2024/01/图书文具_cat06_prod010_Moleskine_笔记本_7fupr5sq.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Stationery_cat06_prod010_Moleskine_Notebook_7fupr5sq.jpg' WHERE `img_path` = '2024/01/图书文具_cat06_prod010_Moleskine_笔记本_7fupr5sq.jpg';

-- 更新文件: 图书文具_cat06_prod011_Pilot_钢笔_z5snfxbg.jpg -> Stationery_cat06_prod011_Pilot_Pen_z5snfxbg.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Stationery_cat06_prod011_Pilot_Pen_z5snfxbg.jpg' WHERE `pic` = '2024/01/图书文具_cat06_prod011_Pilot_钢笔_z5snfxbg.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/图书文具_cat06_prod011_Pilot_钢笔_z5snfxbg.jpg', '2024/01/Stationery_cat06_prod011_Pilot_Pen_z5snfxbg.jpg') WHERE `imgs` LIKE '%2024/01/图书文具_cat06_prod011_Pilot_钢笔_z5snfxbg.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/图书文具_cat06_prod011_Pilot_钢笔_z5snfxbg.jpg', '2024/01/Stationery_cat06_prod011_Pilot_Pen_z5snfxbg.jpg') WHERE `content` LIKE '%2024/01/图书文具_cat06_prod011_Pilot_钢笔_z5snfxbg.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Stationery_cat06_prod011_Pilot_Pen_z5snfxbg.jpg' WHERE `pic` = '2024/01/图书文具_cat06_prod011_Pilot_钢笔_z5snfxbg.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Stationery_cat06_prod011_Pilot_Pen_z5snfxbg.jpg' WHERE `img_path` = '2024/01/图书文具_cat06_prod011_Pilot_钢笔_z5snfxbg.jpg';

-- 更新文件: 图书文具_cat06_prod020_Pilot_钢笔_029v9tr1.jpg -> Stationery_cat06_prod020_Pilot_Pen_029v9tr1.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Stationery_cat06_prod020_Pilot_Pen_029v9tr1.jpg' WHERE `pic` = '2024/01/图书文具_cat06_prod020_Pilot_钢笔_029v9tr1.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/图书文具_cat06_prod020_Pilot_钢笔_029v9tr1.jpg', '2024/01/Stationery_cat06_prod020_Pilot_Pen_029v9tr1.jpg') WHERE `imgs` LIKE '%2024/01/图书文具_cat06_prod020_Pilot_钢笔_029v9tr1.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/图书文具_cat06_prod020_Pilot_钢笔_029v9tr1.jpg', '2024/01/Stationery_cat06_prod020_Pilot_Pen_029v9tr1.jpg') WHERE `content` LIKE '%2024/01/图书文具_cat06_prod020_Pilot_钢笔_029v9tr1.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Stationery_cat06_prod020_Pilot_Pen_029v9tr1.jpg' WHERE `pic` = '2024/01/图书文具_cat06_prod020_Pilot_钢笔_029v9tr1.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Stationery_cat06_prod020_Pilot_Pen_029v9tr1.jpg' WHERE `img_path` = '2024/01/图书文具_cat06_prod020_Pilot_钢笔_029v9tr1.jpg';

-- 更新文件: 图书文具_cat06_prod021_得力_文具_ffveygw7.jpg -> Stationery_cat06_prod021_Deli_Stationery_ffveygw7.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Stationery_cat06_prod021_Deli_Stationery_ffveygw7.jpg' WHERE `pic` = '2024/01/图书文具_cat06_prod021_得力_文具_ffveygw7.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/图书文具_cat06_prod021_得力_文具_ffveygw7.jpg', '2024/01/Stationery_cat06_prod021_Deli_Stationery_ffveygw7.jpg') WHERE `imgs` LIKE '%2024/01/图书文具_cat06_prod021_得力_文具_ffveygw7.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/图书文具_cat06_prod021_得力_文具_ffveygw7.jpg', '2024/01/Stationery_cat06_prod021_Deli_Stationery_ffveygw7.jpg') WHERE `content` LIKE '%2024/01/图书文具_cat06_prod021_得力_文具_ffveygw7.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Stationery_cat06_prod021_Deli_Stationery_ffveygw7.jpg' WHERE `pic` = '2024/01/图书文具_cat06_prod021_得力_文具_ffveygw7.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Stationery_cat06_prod021_Deli_Stationery_ffveygw7.jpg' WHERE `img_path` = '2024/01/图书文具_cat06_prod021_得力_文具_ffveygw7.jpg';

-- 更新文件: 图书文具_cat06_prod030_得力_文具_kp6wn8kn.jpg -> Stationery_cat06_prod030_Deli_Stationery_kp6wn8kn.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Stationery_cat06_prod030_Deli_Stationery_kp6wn8kn.jpg' WHERE `pic` = '2024/01/图书文具_cat06_prod030_得力_文具_kp6wn8kn.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/图书文具_cat06_prod030_得力_文具_kp6wn8kn.jpg', '2024/01/Stationery_cat06_prod030_Deli_Stationery_kp6wn8kn.jpg') WHERE `imgs` LIKE '%2024/01/图书文具_cat06_prod030_得力_文具_kp6wn8kn.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/图书文具_cat06_prod030_得力_文具_kp6wn8kn.jpg', '2024/01/Stationery_cat06_prod030_Deli_Stationery_kp6wn8kn.jpg') WHERE `content` LIKE '%2024/01/图书文具_cat06_prod030_得力_文具_kp6wn8kn.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Stationery_cat06_prod030_Deli_Stationery_kp6wn8kn.jpg' WHERE `pic` = '2024/01/图书文具_cat06_prod030_得力_文具_kp6wn8kn.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Stationery_cat06_prod030_Deli_Stationery_kp6wn8kn.jpg' WHERE `img_path` = '2024/01/图书文具_cat06_prod030_得力_文具_kp6wn8kn.jpg';

-- 更新文件: 图书文具_cat06_prod031_Kindle_电子书_1mf1o8v0.jpg -> Stationery_cat06_prod031_Kindle_E-Book_1mf1o8v0.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Stationery_cat06_prod031_Kindle_E-Book_1mf1o8v0.jpg' WHERE `pic` = '2024/01/图书文具_cat06_prod031_Kindle_电子书_1mf1o8v0.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/图书文具_cat06_prod031_Kindle_电子书_1mf1o8v0.jpg', '2024/01/Stationery_cat06_prod031_Kindle_E-Book_1mf1o8v0.jpg') WHERE `imgs` LIKE '%2024/01/图书文具_cat06_prod031_Kindle_电子书_1mf1o8v0.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/图书文具_cat06_prod031_Kindle_电子书_1mf1o8v0.jpg', '2024/01/Stationery_cat06_prod031_Kindle_E-Book_1mf1o8v0.jpg') WHERE `content` LIKE '%2024/01/图书文具_cat06_prod031_Kindle_电子书_1mf1o8v0.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Stationery_cat06_prod031_Kindle_E-Book_1mf1o8v0.jpg' WHERE `pic` = '2024/01/图书文具_cat06_prod031_Kindle_电子书_1mf1o8v0.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Stationery_cat06_prod031_Kindle_E-Book_1mf1o8v0.jpg' WHERE `img_path` = '2024/01/图书文具_cat06_prod031_Kindle_电子书_1mf1o8v0.jpg';

-- 更新文件: 图书文具_cat06_prod040_Kindle_电子书_ao3lypo8.jpg -> Stationery_cat06_prod040_Kindle_E-Book_ao3lypo8.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Stationery_cat06_prod040_Kindle_E-Book_ao3lypo8.jpg' WHERE `pic` = '2024/01/图书文具_cat06_prod040_Kindle_电子书_ao3lypo8.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/图书文具_cat06_prod040_Kindle_电子书_ao3lypo8.jpg', '2024/01/Stationery_cat06_prod040_Kindle_E-Book_ao3lypo8.jpg') WHERE `imgs` LIKE '%2024/01/图书文具_cat06_prod040_Kindle_电子书_ao3lypo8.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/图书文具_cat06_prod040_Kindle_电子书_ao3lypo8.jpg', '2024/01/Stationery_cat06_prod040_Kindle_E-Book_ao3lypo8.jpg') WHERE `content` LIKE '%2024/01/图书文具_cat06_prod040_Kindle_电子书_ao3lypo8.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Stationery_cat06_prod040_Kindle_E-Book_ao3lypo8.jpg' WHERE `pic` = '2024/01/图书文具_cat06_prod040_Kindle_电子书_ao3lypo8.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Stationery_cat06_prod040_Kindle_E-Book_ao3lypo8.jpg' WHERE `img_path` = '2024/01/图书文具_cat06_prod040_Kindle_电子书_ao3lypo8.jpg';

-- 更新文件: 图书文具_cat06_prod041_Moleskine_笔记本_xnqrejh8.jpg -> Stationery_cat06_prod041_Moleskine_Notebook_xnqrejh8.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Stationery_cat06_prod041_Moleskine_Notebook_xnqrejh8.jpg' WHERE `pic` = '2024/01/图书文具_cat06_prod041_Moleskine_笔记本_xnqrejh8.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/图书文具_cat06_prod041_Moleskine_笔记本_xnqrejh8.jpg', '2024/01/Stationery_cat06_prod041_Moleskine_Notebook_xnqrejh8.jpg') WHERE `imgs` LIKE '%2024/01/图书文具_cat06_prod041_Moleskine_笔记本_xnqrejh8.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/图书文具_cat06_prod041_Moleskine_笔记本_xnqrejh8.jpg', '2024/01/Stationery_cat06_prod041_Moleskine_Notebook_xnqrejh8.jpg') WHERE `content` LIKE '%2024/01/图书文具_cat06_prod041_Moleskine_笔记本_xnqrejh8.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Stationery_cat06_prod041_Moleskine_Notebook_xnqrejh8.jpg' WHERE `pic` = '2024/01/图书文具_cat06_prod041_Moleskine_笔记本_xnqrejh8.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Stationery_cat06_prod041_Moleskine_Notebook_xnqrejh8.jpg' WHERE `img_path` = '2024/01/图书文具_cat06_prod041_Moleskine_笔记本_xnqrejh8.jpg';

-- 更新文件: 家居用品_cat05_prod001_IKEA_沙发_tm6dxhe1.jpg -> Home_cat05_prod001_IKEA_沙发_tm6dxhe1.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Home_cat05_prod001_IKEA_沙发_tm6dxhe1.jpg' WHERE `pic` = '2024/01/家居用品_cat05_prod001_IKEA_沙发_tm6dxhe1.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/家居用品_cat05_prod001_IKEA_沙发_tm6dxhe1.jpg', '2024/01/Home_cat05_prod001_IKEA_沙发_tm6dxhe1.jpg') WHERE `imgs` LIKE '%2024/01/家居用品_cat05_prod001_IKEA_沙发_tm6dxhe1.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/家居用品_cat05_prod001_IKEA_沙发_tm6dxhe1.jpg', '2024/01/Home_cat05_prod001_IKEA_沙发_tm6dxhe1.jpg') WHERE `content` LIKE '%2024/01/家居用品_cat05_prod001_IKEA_沙发_tm6dxhe1.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Home_cat05_prod001_IKEA_沙发_tm6dxhe1.jpg' WHERE `pic` = '2024/01/家居用品_cat05_prod001_IKEA_沙发_tm6dxhe1.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Home_cat05_prod001_IKEA_沙发_tm6dxhe1.jpg' WHERE `img_path` = '2024/01/家居用品_cat05_prod001_IKEA_沙发_tm6dxhe1.jpg';

-- 更新文件: 家居用品_cat05_prod002_飞利浦台灯_y0yxp5d8.jpg -> Home_cat05_prod002_Philips_Lamp_y0yxp5d8.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Home_cat05_prod002_Philips_Lamp_y0yxp5d8.jpg' WHERE `pic` = '2024/01/家居用品_cat05_prod002_飞利浦台灯_y0yxp5d8.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/家居用品_cat05_prod002_飞利浦台灯_y0yxp5d8.jpg', '2024/01/Home_cat05_prod002_Philips_Lamp_y0yxp5d8.jpg') WHERE `imgs` LIKE '%2024/01/家居用品_cat05_prod002_飞利浦台灯_y0yxp5d8.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/家居用品_cat05_prod002_飞利浦台灯_y0yxp5d8.jpg', '2024/01/Home_cat05_prod002_Philips_Lamp_y0yxp5d8.jpg') WHERE `content` LIKE '%2024/01/家居用品_cat05_prod002_飞利浦台灯_y0yxp5d8.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Home_cat05_prod002_Philips_Lamp_y0yxp5d8.jpg' WHERE `pic` = '2024/01/家居用品_cat05_prod002_飞利浦台灯_y0yxp5d8.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Home_cat05_prod002_Philips_Lamp_y0yxp5d8.jpg' WHERE `img_path` = '2024/01/家居用品_cat05_prod002_飞利浦台灯_y0yxp5d8.jpg';

-- 更新文件: 家居用品_cat05_prod003_无印良品_花瓶_mdvsj89m.jpg -> Home_cat05_prod003_Muji_Vase_mdvsj89m.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Home_cat05_prod003_Muji_Vase_mdvsj89m.jpg' WHERE `pic` = '2024/01/家居用品_cat05_prod003_无印良品_花瓶_mdvsj89m.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/家居用品_cat05_prod003_无印良品_花瓶_mdvsj89m.jpg', '2024/01/Home_cat05_prod003_Muji_Vase_mdvsj89m.jpg') WHERE `imgs` LIKE '%2024/01/家居用品_cat05_prod003_无印良品_花瓶_mdvsj89m.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/家居用品_cat05_prod003_无印良品_花瓶_mdvsj89m.jpg', '2024/01/Home_cat05_prod003_Muji_Vase_mdvsj89m.jpg') WHERE `content` LIKE '%2024/01/家居用品_cat05_prod003_无印良品_花瓶_mdvsj89m.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Home_cat05_prod003_Muji_Vase_mdvsj89m.jpg' WHERE `pic` = '2024/01/家居用品_cat05_prod003_无印良品_花瓶_mdvsj89m.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Home_cat05_prod003_Muji_Vase_mdvsj89m.jpg' WHERE `img_path` = '2024/01/家居用品_cat05_prod003_无印良品_花瓶_mdvsj89m.jpg';

-- 更新文件: 家居用品_cat05_prod004_宜家_床_ow8rjeaa.jpg -> Home_cat05_prod004_IKEA_Bed_ow8rjeaa.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Home_cat05_prod004_IKEA_Bed_ow8rjeaa.jpg' WHERE `pic` = '2024/01/家居用品_cat05_prod004_宜家_床_ow8rjeaa.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/家居用品_cat05_prod004_宜家_床_ow8rjeaa.jpg', '2024/01/Home_cat05_prod004_IKEA_Bed_ow8rjeaa.jpg') WHERE `imgs` LIKE '%2024/01/家居用品_cat05_prod004_宜家_床_ow8rjeaa.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/家居用品_cat05_prod004_宜家_床_ow8rjeaa.jpg', '2024/01/Home_cat05_prod004_IKEA_Bed_ow8rjeaa.jpg') WHERE `content` LIKE '%2024/01/家居用品_cat05_prod004_宜家_床_ow8rjeaa.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Home_cat05_prod004_IKEA_Bed_ow8rjeaa.jpg' WHERE `pic` = '2024/01/家居用品_cat05_prod004_宜家_床_ow8rjeaa.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Home_cat05_prod004_IKEA_Bed_ow8rjeaa.jpg' WHERE `img_path` = '2024/01/家居用品_cat05_prod004_宜家_床_ow8rjeaa.jpg';

-- 更新文件: 家居用品_cat05_prod010_飞利浦台灯_nkrqkle3.jpg -> Home_cat05_prod010_Philips_Lamp_nkrqkle3.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Home_cat05_prod010_Philips_Lamp_nkrqkle3.jpg' WHERE `pic` = '2024/01/家居用品_cat05_prod010_飞利浦台灯_nkrqkle3.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/家居用品_cat05_prod010_飞利浦台灯_nkrqkle3.jpg', '2024/01/Home_cat05_prod010_Philips_Lamp_nkrqkle3.jpg') WHERE `imgs` LIKE '%2024/01/家居用品_cat05_prod010_飞利浦台灯_nkrqkle3.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/家居用品_cat05_prod010_飞利浦台灯_nkrqkle3.jpg', '2024/01/Home_cat05_prod010_Philips_Lamp_nkrqkle3.jpg') WHERE `content` LIKE '%2024/01/家居用品_cat05_prod010_飞利浦台灯_nkrqkle3.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Home_cat05_prod010_Philips_Lamp_nkrqkle3.jpg' WHERE `pic` = '2024/01/家居用品_cat05_prod010_飞利浦台灯_nkrqkle3.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Home_cat05_prod010_Philips_Lamp_nkrqkle3.jpg' WHERE `img_path` = '2024/01/家居用品_cat05_prod010_飞利浦台灯_nkrqkle3.jpg';

-- 更新文件: 家居用品_cat05_prod011_无印良品_花瓶_qag3fcmm.jpg -> Home_cat05_prod011_Muji_Vase_qag3fcmm.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Home_cat05_prod011_Muji_Vase_qag3fcmm.jpg' WHERE `pic` = '2024/01/家居用品_cat05_prod011_无印良品_花瓶_qag3fcmm.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/家居用品_cat05_prod011_无印良品_花瓶_qag3fcmm.jpg', '2024/01/Home_cat05_prod011_Muji_Vase_qag3fcmm.jpg') WHERE `imgs` LIKE '%2024/01/家居用品_cat05_prod011_无印良品_花瓶_qag3fcmm.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/家居用品_cat05_prod011_无印良品_花瓶_qag3fcmm.jpg', '2024/01/Home_cat05_prod011_Muji_Vase_qag3fcmm.jpg') WHERE `content` LIKE '%2024/01/家居用品_cat05_prod011_无印良品_花瓶_qag3fcmm.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Home_cat05_prod011_Muji_Vase_qag3fcmm.jpg' WHERE `pic` = '2024/01/家居用品_cat05_prod011_无印良品_花瓶_qag3fcmm.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Home_cat05_prod011_Muji_Vase_qag3fcmm.jpg' WHERE `img_path` = '2024/01/家居用品_cat05_prod011_无印良品_花瓶_qag3fcmm.jpg';

-- 更新文件: 家居用品_cat05_prod020_无印良品_花瓶_fkknndrj.jpg -> Home_cat05_prod020_Muji_Vase_fkknndrj.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Home_cat05_prod020_Muji_Vase_fkknndrj.jpg' WHERE `pic` = '2024/01/家居用品_cat05_prod020_无印良品_花瓶_fkknndrj.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/家居用品_cat05_prod020_无印良品_花瓶_fkknndrj.jpg', '2024/01/Home_cat05_prod020_Muji_Vase_fkknndrj.jpg') WHERE `imgs` LIKE '%2024/01/家居用品_cat05_prod020_无印良品_花瓶_fkknndrj.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/家居用品_cat05_prod020_无印良品_花瓶_fkknndrj.jpg', '2024/01/Home_cat05_prod020_Muji_Vase_fkknndrj.jpg') WHERE `content` LIKE '%2024/01/家居用品_cat05_prod020_无印良品_花瓶_fkknndrj.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Home_cat05_prod020_Muji_Vase_fkknndrj.jpg' WHERE `pic` = '2024/01/家居用品_cat05_prod020_无印良品_花瓶_fkknndrj.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Home_cat05_prod020_Muji_Vase_fkknndrj.jpg' WHERE `img_path` = '2024/01/家居用品_cat05_prod020_无印良品_花瓶_fkknndrj.jpg';

-- 更新文件: 家居用品_cat05_prod021_宜家_床_1u0b3es1.jpg -> Home_cat05_prod021_IKEA_Bed_1u0b3es1.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Home_cat05_prod021_IKEA_Bed_1u0b3es1.jpg' WHERE `pic` = '2024/01/家居用品_cat05_prod021_宜家_床_1u0b3es1.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/家居用品_cat05_prod021_宜家_床_1u0b3es1.jpg', '2024/01/Home_cat05_prod021_IKEA_Bed_1u0b3es1.jpg') WHERE `imgs` LIKE '%2024/01/家居用品_cat05_prod021_宜家_床_1u0b3es1.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/家居用品_cat05_prod021_宜家_床_1u0b3es1.jpg', '2024/01/Home_cat05_prod021_IKEA_Bed_1u0b3es1.jpg') WHERE `content` LIKE '%2024/01/家居用品_cat05_prod021_宜家_床_1u0b3es1.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Home_cat05_prod021_IKEA_Bed_1u0b3es1.jpg' WHERE `pic` = '2024/01/家居用品_cat05_prod021_宜家_床_1u0b3es1.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Home_cat05_prod021_IKEA_Bed_1u0b3es1.jpg' WHERE `img_path` = '2024/01/家居用品_cat05_prod021_宜家_床_1u0b3es1.jpg';

-- 更新文件: 家居用品_cat05_prod030_宜家_床_lf12oybs.jpg -> Home_cat05_prod030_IKEA_Bed_lf12oybs.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Home_cat05_prod030_IKEA_Bed_lf12oybs.jpg' WHERE `pic` = '2024/01/家居用品_cat05_prod030_宜家_床_lf12oybs.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/家居用品_cat05_prod030_宜家_床_lf12oybs.jpg', '2024/01/Home_cat05_prod030_IKEA_Bed_lf12oybs.jpg') WHERE `imgs` LIKE '%2024/01/家居用品_cat05_prod030_宜家_床_lf12oybs.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/家居用品_cat05_prod030_宜家_床_lf12oybs.jpg', '2024/01/Home_cat05_prod030_IKEA_Bed_lf12oybs.jpg') WHERE `content` LIKE '%2024/01/家居用品_cat05_prod030_宜家_床_lf12oybs.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Home_cat05_prod030_IKEA_Bed_lf12oybs.jpg' WHERE `pic` = '2024/01/家居用品_cat05_prod030_宜家_床_lf12oybs.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Home_cat05_prod030_IKEA_Bed_lf12oybs.jpg' WHERE `img_path` = '2024/01/家居用品_cat05_prod030_宜家_床_lf12oybs.jpg';

-- 更新文件: 家居用品_cat05_prod031_IKEA_沙发_zvsxexym.jpg -> Home_cat05_prod031_IKEA_沙发_zvsxexym.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Home_cat05_prod031_IKEA_沙发_zvsxexym.jpg' WHERE `pic` = '2024/01/家居用品_cat05_prod031_IKEA_沙发_zvsxexym.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/家居用品_cat05_prod031_IKEA_沙发_zvsxexym.jpg', '2024/01/Home_cat05_prod031_IKEA_沙发_zvsxexym.jpg') WHERE `imgs` LIKE '%2024/01/家居用品_cat05_prod031_IKEA_沙发_zvsxexym.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/家居用品_cat05_prod031_IKEA_沙发_zvsxexym.jpg', '2024/01/Home_cat05_prod031_IKEA_沙发_zvsxexym.jpg') WHERE `content` LIKE '%2024/01/家居用品_cat05_prod031_IKEA_沙发_zvsxexym.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Home_cat05_prod031_IKEA_沙发_zvsxexym.jpg' WHERE `pic` = '2024/01/家居用品_cat05_prod031_IKEA_沙发_zvsxexym.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Home_cat05_prod031_IKEA_沙发_zvsxexym.jpg' WHERE `img_path` = '2024/01/家居用品_cat05_prod031_IKEA_沙发_zvsxexym.jpg';

-- 更新文件: 家居用品_cat05_prod040_IKEA_沙发_xgsq5cs1.jpg -> Home_cat05_prod040_IKEA_沙发_xgsq5cs1.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Home_cat05_prod040_IKEA_沙发_xgsq5cs1.jpg' WHERE `pic` = '2024/01/家居用品_cat05_prod040_IKEA_沙发_xgsq5cs1.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/家居用品_cat05_prod040_IKEA_沙发_xgsq5cs1.jpg', '2024/01/Home_cat05_prod040_IKEA_沙发_xgsq5cs1.jpg') WHERE `imgs` LIKE '%2024/01/家居用品_cat05_prod040_IKEA_沙发_xgsq5cs1.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/家居用品_cat05_prod040_IKEA_沙发_xgsq5cs1.jpg', '2024/01/Home_cat05_prod040_IKEA_沙发_xgsq5cs1.jpg') WHERE `content` LIKE '%2024/01/家居用品_cat05_prod040_IKEA_沙发_xgsq5cs1.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Home_cat05_prod040_IKEA_沙发_xgsq5cs1.jpg' WHERE `pic` = '2024/01/家居用品_cat05_prod040_IKEA_沙发_xgsq5cs1.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Home_cat05_prod040_IKEA_沙发_xgsq5cs1.jpg' WHERE `img_path` = '2024/01/家居用品_cat05_prod040_IKEA_沙发_xgsq5cs1.jpg';

-- 更新文件: 家居用品_cat05_prod041_飞利浦台灯_2p4r49i6.jpg -> Home_cat05_prod041_Philips_Lamp_2p4r49i6.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Home_cat05_prod041_Philips_Lamp_2p4r49i6.jpg' WHERE `pic` = '2024/01/家居用品_cat05_prod041_飞利浦台灯_2p4r49i6.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/家居用品_cat05_prod041_飞利浦台灯_2p4r49i6.jpg', '2024/01/Home_cat05_prod041_Philips_Lamp_2p4r49i6.jpg') WHERE `imgs` LIKE '%2024/01/家居用品_cat05_prod041_飞利浦台灯_2p4r49i6.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/家居用品_cat05_prod041_飞利浦台灯_2p4r49i6.jpg', '2024/01/Home_cat05_prod041_Philips_Lamp_2p4r49i6.jpg') WHERE `content` LIKE '%2024/01/家居用品_cat05_prod041_飞利浦台灯_2p4r49i6.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Home_cat05_prod041_Philips_Lamp_2p4r49i6.jpg' WHERE `pic` = '2024/01/家居用品_cat05_prod041_飞利浦台灯_2p4r49i6.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Home_cat05_prod041_Philips_Lamp_2p4r49i6.jpg' WHERE `img_path` = '2024/01/家居用品_cat05_prod041_飞利浦台灯_2p4r49i6.jpg';

-- 更新文件: 户外运动_cat10_prod001_Coleman_帐篷_wuerz35x.jpg -> Outdoor_cat10_prod001_Coleman_Tent_wuerz35x.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Outdoor_cat10_prod001_Coleman_Tent_wuerz35x.jpg' WHERE `pic` = '2024/01/户外运动_cat10_prod001_Coleman_帐篷_wuerz35x.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/户外运动_cat10_prod001_Coleman_帐篷_wuerz35x.jpg', '2024/01/Outdoor_cat10_prod001_Coleman_Tent_wuerz35x.jpg') WHERE `imgs` LIKE '%2024/01/户外运动_cat10_prod001_Coleman_帐篷_wuerz35x.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/户外运动_cat10_prod001_Coleman_帐篷_wuerz35x.jpg', '2024/01/Outdoor_cat10_prod001_Coleman_Tent_wuerz35x.jpg') WHERE `content` LIKE '%2024/01/户外运动_cat10_prod001_Coleman_帐篷_wuerz35x.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Outdoor_cat10_prod001_Coleman_Tent_wuerz35x.jpg' WHERE `pic` = '2024/01/户外运动_cat10_prod001_Coleman_帐篷_wuerz35x.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Outdoor_cat10_prod001_Coleman_Tent_wuerz35x.jpg' WHERE `img_path` = '2024/01/户外运动_cat10_prod001_Coleman_帐篷_wuerz35x.jpg';

-- 更新文件: 户外运动_cat10_prod002_Osprey_背包_k99flgso.jpg -> Outdoor_cat10_prod002_Osprey_Backpack_k99flgso.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Outdoor_cat10_prod002_Osprey_Backpack_k99flgso.jpg' WHERE `pic` = '2024/01/户外运动_cat10_prod002_Osprey_背包_k99flgso.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/户外运动_cat10_prod002_Osprey_背包_k99flgso.jpg', '2024/01/Outdoor_cat10_prod002_Osprey_Backpack_k99flgso.jpg') WHERE `imgs` LIKE '%2024/01/户外运动_cat10_prod002_Osprey_背包_k99flgso.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/户外运动_cat10_prod002_Osprey_背包_k99flgso.jpg', '2024/01/Outdoor_cat10_prod002_Osprey_Backpack_k99flgso.jpg') WHERE `content` LIKE '%2024/01/户外运动_cat10_prod002_Osprey_背包_k99flgso.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Outdoor_cat10_prod002_Osprey_Backpack_k99flgso.jpg' WHERE `pic` = '2024/01/户外运动_cat10_prod002_Osprey_背包_k99flgso.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Outdoor_cat10_prod002_Osprey_Backpack_k99flgso.jpg' WHERE `img_path` = '2024/01/户外运动_cat10_prod002_Osprey_背包_k99flgso.jpg';

-- 更新文件: 户外运动_cat10_prod003_Columbia_冲锋衣_iddtf9vt.jpg -> Outdoor_cat10_prod003_Columbia_Jacket_iddtf9vt.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Outdoor_cat10_prod003_Columbia_Jacket_iddtf9vt.jpg' WHERE `pic` = '2024/01/户外运动_cat10_prod003_Columbia_冲锋衣_iddtf9vt.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/户外运动_cat10_prod003_Columbia_冲锋衣_iddtf9vt.jpg', '2024/01/Outdoor_cat10_prod003_Columbia_Jacket_iddtf9vt.jpg') WHERE `imgs` LIKE '%2024/01/户外运动_cat10_prod003_Columbia_冲锋衣_iddtf9vt.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/户外运动_cat10_prod003_Columbia_冲锋衣_iddtf9vt.jpg', '2024/01/Outdoor_cat10_prod003_Columbia_Jacket_iddtf9vt.jpg') WHERE `content` LIKE '%2024/01/户外运动_cat10_prod003_Columbia_冲锋衣_iddtf9vt.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Outdoor_cat10_prod003_Columbia_Jacket_iddtf9vt.jpg' WHERE `pic` = '2024/01/户外运动_cat10_prod003_Columbia_冲锋衣_iddtf9vt.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Outdoor_cat10_prod003_Columbia_Jacket_iddtf9vt.jpg' WHERE `img_path` = '2024/01/户外运动_cat10_prod003_Columbia_冲锋衣_iddtf9vt.jpg';

-- 更新文件: 户外运动_cat10_prod004_钓鱼竿_nmmu4dyq.jpg -> Outdoor_cat10_prod004_Fishing_Rod_nmmu4dyq.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Outdoor_cat10_prod004_Fishing_Rod_nmmu4dyq.jpg' WHERE `pic` = '2024/01/户外运动_cat10_prod004_钓鱼竿_nmmu4dyq.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/户外运动_cat10_prod004_钓鱼竿_nmmu4dyq.jpg', '2024/01/Outdoor_cat10_prod004_Fishing_Rod_nmmu4dyq.jpg') WHERE `imgs` LIKE '%2024/01/户外运动_cat10_prod004_钓鱼竿_nmmu4dyq.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/户外运动_cat10_prod004_钓鱼竿_nmmu4dyq.jpg', '2024/01/Outdoor_cat10_prod004_Fishing_Rod_nmmu4dyq.jpg') WHERE `content` LIKE '%2024/01/户外运动_cat10_prod004_钓鱼竿_nmmu4dyq.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Outdoor_cat10_prod004_Fishing_Rod_nmmu4dyq.jpg' WHERE `pic` = '2024/01/户外运动_cat10_prod004_钓鱼竿_nmmu4dyq.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Outdoor_cat10_prod004_Fishing_Rod_nmmu4dyq.jpg' WHERE `img_path` = '2024/01/户外运动_cat10_prod004_钓鱼竿_nmmu4dyq.jpg';

-- 更新文件: 户外运动_cat10_prod005_自行车_q81k5wzt.jpg -> Outdoor_cat10_prod005_Bicycle_q81k5wzt.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Outdoor_cat10_prod005_Bicycle_q81k5wzt.jpg' WHERE `pic` = '2024/01/户外运动_cat10_prod005_自行车_q81k5wzt.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/户外运动_cat10_prod005_自行车_q81k5wzt.jpg', '2024/01/Outdoor_cat10_prod005_Bicycle_q81k5wzt.jpg') WHERE `imgs` LIKE '%2024/01/户外运动_cat10_prod005_自行车_q81k5wzt.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/户外运动_cat10_prod005_自行车_q81k5wzt.jpg', '2024/01/Outdoor_cat10_prod005_Bicycle_q81k5wzt.jpg') WHERE `content` LIKE '%2024/01/户外运动_cat10_prod005_自行车_q81k5wzt.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Outdoor_cat10_prod005_Bicycle_q81k5wzt.jpg' WHERE `pic` = '2024/01/户外运动_cat10_prod005_自行车_q81k5wzt.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Outdoor_cat10_prod005_Bicycle_q81k5wzt.jpg' WHERE `img_path` = '2024/01/户外运动_cat10_prod005_自行车_q81k5wzt.jpg';

-- 更新文件: 户外运动_cat10_prod010_Osprey_背包_eiyvj8ht.jpg -> Outdoor_cat10_prod010_Osprey_Backpack_eiyvj8ht.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Outdoor_cat10_prod010_Osprey_Backpack_eiyvj8ht.jpg' WHERE `pic` = '2024/01/户外运动_cat10_prod010_Osprey_背包_eiyvj8ht.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/户外运动_cat10_prod010_Osprey_背包_eiyvj8ht.jpg', '2024/01/Outdoor_cat10_prod010_Osprey_Backpack_eiyvj8ht.jpg') WHERE `imgs` LIKE '%2024/01/户外运动_cat10_prod010_Osprey_背包_eiyvj8ht.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/户外运动_cat10_prod010_Osprey_背包_eiyvj8ht.jpg', '2024/01/Outdoor_cat10_prod010_Osprey_Backpack_eiyvj8ht.jpg') WHERE `content` LIKE '%2024/01/户外运动_cat10_prod010_Osprey_背包_eiyvj8ht.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Outdoor_cat10_prod010_Osprey_Backpack_eiyvj8ht.jpg' WHERE `pic` = '2024/01/户外运动_cat10_prod010_Osprey_背包_eiyvj8ht.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Outdoor_cat10_prod010_Osprey_Backpack_eiyvj8ht.jpg' WHERE `img_path` = '2024/01/户外运动_cat10_prod010_Osprey_背包_eiyvj8ht.jpg';

-- 更新文件: 户外运动_cat10_prod011_Columbia_冲锋衣_s3w9fph5.jpg -> Outdoor_cat10_prod011_Columbia_Jacket_s3w9fph5.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Outdoor_cat10_prod011_Columbia_Jacket_s3w9fph5.jpg' WHERE `pic` = '2024/01/户外运动_cat10_prod011_Columbia_冲锋衣_s3w9fph5.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/户外运动_cat10_prod011_Columbia_冲锋衣_s3w9fph5.jpg', '2024/01/Outdoor_cat10_prod011_Columbia_Jacket_s3w9fph5.jpg') WHERE `imgs` LIKE '%2024/01/户外运动_cat10_prod011_Columbia_冲锋衣_s3w9fph5.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/户外运动_cat10_prod011_Columbia_冲锋衣_s3w9fph5.jpg', '2024/01/Outdoor_cat10_prod011_Columbia_Jacket_s3w9fph5.jpg') WHERE `content` LIKE '%2024/01/户外运动_cat10_prod011_Columbia_冲锋衣_s3w9fph5.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Outdoor_cat10_prod011_Columbia_Jacket_s3w9fph5.jpg' WHERE `pic` = '2024/01/户外运动_cat10_prod011_Columbia_冲锋衣_s3w9fph5.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Outdoor_cat10_prod011_Columbia_Jacket_s3w9fph5.jpg' WHERE `img_path` = '2024/01/户外运动_cat10_prod011_Columbia_冲锋衣_s3w9fph5.jpg';

-- 更新文件: 户外运动_cat10_prod020_Columbia_冲锋衣_htuwnahb.jpg -> Outdoor_cat10_prod020_Columbia_Jacket_htuwnahb.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Outdoor_cat10_prod020_Columbia_Jacket_htuwnahb.jpg' WHERE `pic` = '2024/01/户外运动_cat10_prod020_Columbia_冲锋衣_htuwnahb.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/户外运动_cat10_prod020_Columbia_冲锋衣_htuwnahb.jpg', '2024/01/Outdoor_cat10_prod020_Columbia_Jacket_htuwnahb.jpg') WHERE `imgs` LIKE '%2024/01/户外运动_cat10_prod020_Columbia_冲锋衣_htuwnahb.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/户外运动_cat10_prod020_Columbia_冲锋衣_htuwnahb.jpg', '2024/01/Outdoor_cat10_prod020_Columbia_Jacket_htuwnahb.jpg') WHERE `content` LIKE '%2024/01/户外运动_cat10_prod020_Columbia_冲锋衣_htuwnahb.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Outdoor_cat10_prod020_Columbia_Jacket_htuwnahb.jpg' WHERE `pic` = '2024/01/户外运动_cat10_prod020_Columbia_冲锋衣_htuwnahb.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Outdoor_cat10_prod020_Columbia_Jacket_htuwnahb.jpg' WHERE `img_path` = '2024/01/户外运动_cat10_prod020_Columbia_冲锋衣_htuwnahb.jpg';

-- 更新文件: 户外运动_cat10_prod021_钓鱼竿_z8e80rkm.jpg -> Outdoor_cat10_prod021_Fishing_Rod_z8e80rkm.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Outdoor_cat10_prod021_Fishing_Rod_z8e80rkm.jpg' WHERE `pic` = '2024/01/户外运动_cat10_prod021_钓鱼竿_z8e80rkm.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/户外运动_cat10_prod021_钓鱼竿_z8e80rkm.jpg', '2024/01/Outdoor_cat10_prod021_Fishing_Rod_z8e80rkm.jpg') WHERE `imgs` LIKE '%2024/01/户外运动_cat10_prod021_钓鱼竿_z8e80rkm.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/户外运动_cat10_prod021_钓鱼竿_z8e80rkm.jpg', '2024/01/Outdoor_cat10_prod021_Fishing_Rod_z8e80rkm.jpg') WHERE `content` LIKE '%2024/01/户外运动_cat10_prod021_钓鱼竿_z8e80rkm.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Outdoor_cat10_prod021_Fishing_Rod_z8e80rkm.jpg' WHERE `pic` = '2024/01/户外运动_cat10_prod021_钓鱼竿_z8e80rkm.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Outdoor_cat10_prod021_Fishing_Rod_z8e80rkm.jpg' WHERE `img_path` = '2024/01/户外运动_cat10_prod021_钓鱼竿_z8e80rkm.jpg';

-- 更新文件: 户外运动_cat10_prod030_钓鱼竿_n2ancu0k.jpg -> Outdoor_cat10_prod030_Fishing_Rod_n2ancu0k.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Outdoor_cat10_prod030_Fishing_Rod_n2ancu0k.jpg' WHERE `pic` = '2024/01/户外运动_cat10_prod030_钓鱼竿_n2ancu0k.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/户外运动_cat10_prod030_钓鱼竿_n2ancu0k.jpg', '2024/01/Outdoor_cat10_prod030_Fishing_Rod_n2ancu0k.jpg') WHERE `imgs` LIKE '%2024/01/户外运动_cat10_prod030_钓鱼竿_n2ancu0k.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/户外运动_cat10_prod030_钓鱼竿_n2ancu0k.jpg', '2024/01/Outdoor_cat10_prod030_Fishing_Rod_n2ancu0k.jpg') WHERE `content` LIKE '%2024/01/户外运动_cat10_prod030_钓鱼竿_n2ancu0k.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Outdoor_cat10_prod030_Fishing_Rod_n2ancu0k.jpg' WHERE `pic` = '2024/01/户外运动_cat10_prod030_钓鱼竿_n2ancu0k.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Outdoor_cat10_prod030_Fishing_Rod_n2ancu0k.jpg' WHERE `img_path` = '2024/01/户外运动_cat10_prod030_钓鱼竿_n2ancu0k.jpg';

-- 更新文件: 户外运动_cat10_prod031_自行车_yw54yz5i.jpg -> Outdoor_cat10_prod031_Bicycle_yw54yz5i.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Outdoor_cat10_prod031_Bicycle_yw54yz5i.jpg' WHERE `pic` = '2024/01/户外运动_cat10_prod031_自行车_yw54yz5i.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/户外运动_cat10_prod031_自行车_yw54yz5i.jpg', '2024/01/Outdoor_cat10_prod031_Bicycle_yw54yz5i.jpg') WHERE `imgs` LIKE '%2024/01/户外运动_cat10_prod031_自行车_yw54yz5i.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/户外运动_cat10_prod031_自行车_yw54yz5i.jpg', '2024/01/Outdoor_cat10_prod031_Bicycle_yw54yz5i.jpg') WHERE `content` LIKE '%2024/01/户外运动_cat10_prod031_自行车_yw54yz5i.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Outdoor_cat10_prod031_Bicycle_yw54yz5i.jpg' WHERE `pic` = '2024/01/户外运动_cat10_prod031_自行车_yw54yz5i.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Outdoor_cat10_prod031_Bicycle_yw54yz5i.jpg' WHERE `img_path` = '2024/01/户外运动_cat10_prod031_自行车_yw54yz5i.jpg';

-- 更新文件: 户外运动_cat10_prod040_自行车_z27inlaf.jpg -> Outdoor_cat10_prod040_Bicycle_z27inlaf.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Outdoor_cat10_prod040_Bicycle_z27inlaf.jpg' WHERE `pic` = '2024/01/户外运动_cat10_prod040_自行车_z27inlaf.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/户外运动_cat10_prod040_自行车_z27inlaf.jpg', '2024/01/Outdoor_cat10_prod040_Bicycle_z27inlaf.jpg') WHERE `imgs` LIKE '%2024/01/户外运动_cat10_prod040_自行车_z27inlaf.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/户外运动_cat10_prod040_自行车_z27inlaf.jpg', '2024/01/Outdoor_cat10_prod040_Bicycle_z27inlaf.jpg') WHERE `content` LIKE '%2024/01/户外运动_cat10_prod040_自行车_z27inlaf.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Outdoor_cat10_prod040_Bicycle_z27inlaf.jpg' WHERE `pic` = '2024/01/户外运动_cat10_prod040_自行车_z27inlaf.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Outdoor_cat10_prod040_Bicycle_z27inlaf.jpg' WHERE `img_path` = '2024/01/户外运动_cat10_prod040_自行车_z27inlaf.jpg';

-- 更新文件: 户外运动_cat10_prod041_Coleman_帐篷_nnrnhkoo.jpg -> Outdoor_cat10_prod041_Coleman_Tent_nnrnhkoo.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Outdoor_cat10_prod041_Coleman_Tent_nnrnhkoo.jpg' WHERE `pic` = '2024/01/户外运动_cat10_prod041_Coleman_帐篷_nnrnhkoo.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/户外运动_cat10_prod041_Coleman_帐篷_nnrnhkoo.jpg', '2024/01/Outdoor_cat10_prod041_Coleman_Tent_nnrnhkoo.jpg') WHERE `imgs` LIKE '%2024/01/户外运动_cat10_prod041_Coleman_帐篷_nnrnhkoo.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/户外运动_cat10_prod041_Coleman_帐篷_nnrnhkoo.jpg', '2024/01/Outdoor_cat10_prod041_Coleman_Tent_nnrnhkoo.jpg') WHERE `content` LIKE '%2024/01/户外运动_cat10_prod041_Coleman_帐篷_nnrnhkoo.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Outdoor_cat10_prod041_Coleman_Tent_nnrnhkoo.jpg' WHERE `pic` = '2024/01/户外运动_cat10_prod041_Coleman_帐篷_nnrnhkoo.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Outdoor_cat10_prod041_Coleman_Tent_nnrnhkoo.jpg' WHERE `img_path` = '2024/01/户外运动_cat10_prod041_Coleman_帐篷_nnrnhkoo.jpg';

-- 更新文件: 户外运动_cat10_prod050_Coleman_帐篷_nwmz0wm9.jpg -> Outdoor_cat10_prod050_Coleman_Tent_nwmz0wm9.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Outdoor_cat10_prod050_Coleman_Tent_nwmz0wm9.jpg' WHERE `pic` = '2024/01/户外运动_cat10_prod050_Coleman_帐篷_nwmz0wm9.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/户外运动_cat10_prod050_Coleman_帐篷_nwmz0wm9.jpg', '2024/01/Outdoor_cat10_prod050_Coleman_Tent_nwmz0wm9.jpg') WHERE `imgs` LIKE '%2024/01/户外运动_cat10_prod050_Coleman_帐篷_nwmz0wm9.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/户外运动_cat10_prod050_Coleman_帐篷_nwmz0wm9.jpg', '2024/01/Outdoor_cat10_prod050_Coleman_Tent_nwmz0wm9.jpg') WHERE `content` LIKE '%2024/01/户外运动_cat10_prod050_Coleman_帐篷_nwmz0wm9.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Outdoor_cat10_prod050_Coleman_Tent_nwmz0wm9.jpg' WHERE `pic` = '2024/01/户外运动_cat10_prod050_Coleman_帐篷_nwmz0wm9.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Outdoor_cat10_prod050_Coleman_Tent_nwmz0wm9.jpg' WHERE `img_path` = '2024/01/户外运动_cat10_prod050_Coleman_帐篷_nwmz0wm9.jpg';

-- 更新文件: 户外运动_cat10_prod051_Osprey_背包_5btpv7zl.jpg -> Outdoor_cat10_prod051_Osprey_Backpack_5btpv7zl.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Outdoor_cat10_prod051_Osprey_Backpack_5btpv7zl.jpg' WHERE `pic` = '2024/01/户外运动_cat10_prod051_Osprey_背包_5btpv7zl.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/户外运动_cat10_prod051_Osprey_背包_5btpv7zl.jpg', '2024/01/Outdoor_cat10_prod051_Osprey_Backpack_5btpv7zl.jpg') WHERE `imgs` LIKE '%2024/01/户外运动_cat10_prod051_Osprey_背包_5btpv7zl.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/户外运动_cat10_prod051_Osprey_背包_5btpv7zl.jpg', '2024/01/Outdoor_cat10_prod051_Osprey_Backpack_5btpv7zl.jpg') WHERE `content` LIKE '%2024/01/户外运动_cat10_prod051_Osprey_背包_5btpv7zl.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Outdoor_cat10_prod051_Osprey_Backpack_5btpv7zl.jpg' WHERE `pic` = '2024/01/户外运动_cat10_prod051_Osprey_背包_5btpv7zl.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Outdoor_cat10_prod051_Osprey_Backpack_5btpv7zl.jpg' WHERE `img_path` = '2024/01/户外运动_cat10_prod051_Osprey_背包_5btpv7zl.jpg';

-- 更新文件: 手机数码_cat01_prod001_iPhone_15_Pro_kus2c32y.jpg -> Electronics_cat01_prod001_iPhone_15_Pro_kus2c32y.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Electronics_cat01_prod001_iPhone_15_Pro_kus2c32y.jpg' WHERE `pic` = '2024/01/手机数码_cat01_prod001_iPhone_15_Pro_kus2c32y.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/手机数码_cat01_prod001_iPhone_15_Pro_kus2c32y.jpg', '2024/01/Electronics_cat01_prod001_iPhone_15_Pro_kus2c32y.jpg') WHERE `imgs` LIKE '%2024/01/手机数码_cat01_prod001_iPhone_15_Pro_kus2c32y.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/手机数码_cat01_prod001_iPhone_15_Pro_kus2c32y.jpg', '2024/01/Electronics_cat01_prod001_iPhone_15_Pro_kus2c32y.jpg') WHERE `content` LIKE '%2024/01/手机数码_cat01_prod001_iPhone_15_Pro_kus2c32y.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Electronics_cat01_prod001_iPhone_15_Pro_kus2c32y.jpg' WHERE `pic` = '2024/01/手机数码_cat01_prod001_iPhone_15_Pro_kus2c32y.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Electronics_cat01_prod001_iPhone_15_Pro_kus2c32y.jpg' WHERE `img_path` = '2024/01/手机数码_cat01_prod001_iPhone_15_Pro_kus2c32y.jpg';

-- 更新文件: 手机数码_cat01_prod002_小米14_ywt98pju.jpg -> Electronics_cat01_prod002_Xiaomi14_ywt98pju.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Electronics_cat01_prod002_Xiaomi14_ywt98pju.jpg' WHERE `pic` = '2024/01/手机数码_cat01_prod002_小米14_ywt98pju.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/手机数码_cat01_prod002_小米14_ywt98pju.jpg', '2024/01/Electronics_cat01_prod002_Xiaomi14_ywt98pju.jpg') WHERE `imgs` LIKE '%2024/01/手机数码_cat01_prod002_小米14_ywt98pju.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/手机数码_cat01_prod002_小米14_ywt98pju.jpg', '2024/01/Electronics_cat01_prod002_Xiaomi14_ywt98pju.jpg') WHERE `content` LIKE '%2024/01/手机数码_cat01_prod002_小米14_ywt98pju.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Electronics_cat01_prod002_Xiaomi14_ywt98pju.jpg' WHERE `pic` = '2024/01/手机数码_cat01_prod002_小米14_ywt98pju.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Electronics_cat01_prod002_Xiaomi14_ywt98pju.jpg' WHERE `img_path` = '2024/01/手机数码_cat01_prod002_小米14_ywt98pju.jpg';

-- 更新文件: 手机数码_cat01_prod003_华为Mate_60_3umd03ae.jpg -> Electronics_cat01_prod003_HuaweiMate60_3umd03ae.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Electronics_cat01_prod003_HuaweiMate60_3umd03ae.jpg' WHERE `pic` = '2024/01/手机数码_cat01_prod003_华为Mate_60_3umd03ae.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/手机数码_cat01_prod003_华为Mate_60_3umd03ae.jpg', '2024/01/Electronics_cat01_prod003_HuaweiMate60_3umd03ae.jpg') WHERE `imgs` LIKE '%2024/01/手机数码_cat01_prod003_华为Mate_60_3umd03ae.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/手机数码_cat01_prod003_华为Mate_60_3umd03ae.jpg', '2024/01/Electronics_cat01_prod003_HuaweiMate60_3umd03ae.jpg') WHERE `content` LIKE '%2024/01/手机数码_cat01_prod003_华为Mate_60_3umd03ae.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Electronics_cat01_prod003_HuaweiMate60_3umd03ae.jpg' WHERE `pic` = '2024/01/手机数码_cat01_prod003_华为Mate_60_3umd03ae.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Electronics_cat01_prod003_HuaweiMate60_3umd03ae.jpg' WHERE `img_path` = '2024/01/手机数码_cat01_prod003_华为Mate_60_3umd03ae.jpg';

-- 更新文件: 手机数码_cat01_prod004_Samsung_Galaxy_S24_uasupvmv.jpg -> Electronics_cat01_prod004_Samsung_Galaxy_S24_uasupvmv.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Electronics_cat01_prod004_Samsung_Galaxy_S24_uasupvmv.jpg' WHERE `pic` = '2024/01/手机数码_cat01_prod004_Samsung_Galaxy_S24_uasupvmv.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/手机数码_cat01_prod004_Samsung_Galaxy_S24_uasupvmv.jpg', '2024/01/Electronics_cat01_prod004_Samsung_Galaxy_S24_uasupvmv.jpg') WHERE `imgs` LIKE '%2024/01/手机数码_cat01_prod004_Samsung_Galaxy_S24_uasupvmv.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/手机数码_cat01_prod004_Samsung_Galaxy_S24_uasupvmv.jpg', '2024/01/Electronics_cat01_prod004_Samsung_Galaxy_S24_uasupvmv.jpg') WHERE `content` LIKE '%2024/01/手机数码_cat01_prod004_Samsung_Galaxy_S24_uasupvmv.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Electronics_cat01_prod004_Samsung_Galaxy_S24_uasupvmv.jpg' WHERE `pic` = '2024/01/手机数码_cat01_prod004_Samsung_Galaxy_S24_uasupvmv.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Electronics_cat01_prod004_Samsung_Galaxy_S24_uasupvmv.jpg' WHERE `img_path` = '2024/01/手机数码_cat01_prod004_Samsung_Galaxy_S24_uasupvmv.jpg';

-- 更新文件: 手机数码_cat01_prod005_iPad_Pro_god0ale3.jpg -> Electronics_cat01_prod005_iPad_Pro_god0ale3.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Electronics_cat01_prod005_iPad_Pro_god0ale3.jpg' WHERE `pic` = '2024/01/手机数码_cat01_prod005_iPad_Pro_god0ale3.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/手机数码_cat01_prod005_iPad_Pro_god0ale3.jpg', '2024/01/Electronics_cat01_prod005_iPad_Pro_god0ale3.jpg') WHERE `imgs` LIKE '%2024/01/手机数码_cat01_prod005_iPad_Pro_god0ale3.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/手机数码_cat01_prod005_iPad_Pro_god0ale3.jpg', '2024/01/Electronics_cat01_prod005_iPad_Pro_god0ale3.jpg') WHERE `content` LIKE '%2024/01/手机数码_cat01_prod005_iPad_Pro_god0ale3.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Electronics_cat01_prod005_iPad_Pro_god0ale3.jpg' WHERE `pic` = '2024/01/手机数码_cat01_prod005_iPad_Pro_god0ale3.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Electronics_cat01_prod005_iPad_Pro_god0ale3.jpg' WHERE `img_path` = '2024/01/手机数码_cat01_prod005_iPad_Pro_god0ale3.jpg';

-- 更新文件: 手机数码_cat01_prod006_MacBook_Pro_b910zrsj.jpg -> Electronics_cat01_prod006_MacBook_Pro_b910zrsj.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Electronics_cat01_prod006_MacBook_Pro_b910zrsj.jpg' WHERE `pic` = '2024/01/手机数码_cat01_prod006_MacBook_Pro_b910zrsj.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/手机数码_cat01_prod006_MacBook_Pro_b910zrsj.jpg', '2024/01/Electronics_cat01_prod006_MacBook_Pro_b910zrsj.jpg') WHERE `imgs` LIKE '%2024/01/手机数码_cat01_prod006_MacBook_Pro_b910zrsj.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/手机数码_cat01_prod006_MacBook_Pro_b910zrsj.jpg', '2024/01/Electronics_cat01_prod006_MacBook_Pro_b910zrsj.jpg') WHERE `content` LIKE '%2024/01/手机数码_cat01_prod006_MacBook_Pro_b910zrsj.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Electronics_cat01_prod006_MacBook_Pro_b910zrsj.jpg' WHERE `pic` = '2024/01/手机数码_cat01_prod006_MacBook_Pro_b910zrsj.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Electronics_cat01_prod006_MacBook_Pro_b910zrsj.jpg' WHERE `img_path` = '2024/01/手机数码_cat01_prod006_MacBook_Pro_b910zrsj.jpg';

-- 更新文件: 手机数码_cat01_prod007_AirPods_Pro_d2xr13rt.jpg -> Electronics_cat01_prod007_AirPods_Pro_d2xr13rt.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Electronics_cat01_prod007_AirPods_Pro_d2xr13rt.jpg' WHERE `pic` = '2024/01/手机数码_cat01_prod007_AirPods_Pro_d2xr13rt.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/手机数码_cat01_prod007_AirPods_Pro_d2xr13rt.jpg', '2024/01/Electronics_cat01_prod007_AirPods_Pro_d2xr13rt.jpg') WHERE `imgs` LIKE '%2024/01/手机数码_cat01_prod007_AirPods_Pro_d2xr13rt.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/手机数码_cat01_prod007_AirPods_Pro_d2xr13rt.jpg', '2024/01/Electronics_cat01_prod007_AirPods_Pro_d2xr13rt.jpg') WHERE `content` LIKE '%2024/01/手机数码_cat01_prod007_AirPods_Pro_d2xr13rt.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Electronics_cat01_prod007_AirPods_Pro_d2xr13rt.jpg' WHERE `pic` = '2024/01/手机数码_cat01_prod007_AirPods_Pro_d2xr13rt.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Electronics_cat01_prod007_AirPods_Pro_d2xr13rt.jpg' WHERE `img_path` = '2024/01/手机数码_cat01_prod007_AirPods_Pro_d2xr13rt.jpg';

-- 更新文件: 手机数码_cat01_prod008_Apple_Watch_ma1awhu2.jpg -> Electronics_cat01_prod008_Apple_Watch_ma1awhu2.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Electronics_cat01_prod008_Apple_Watch_ma1awhu2.jpg' WHERE `pic` = '2024/01/手机数码_cat01_prod008_Apple_Watch_ma1awhu2.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/手机数码_cat01_prod008_Apple_Watch_ma1awhu2.jpg', '2024/01/Electronics_cat01_prod008_Apple_Watch_ma1awhu2.jpg') WHERE `imgs` LIKE '%2024/01/手机数码_cat01_prod008_Apple_Watch_ma1awhu2.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/手机数码_cat01_prod008_Apple_Watch_ma1awhu2.jpg', '2024/01/Electronics_cat01_prod008_Apple_Watch_ma1awhu2.jpg') WHERE `content` LIKE '%2024/01/手机数码_cat01_prod008_Apple_Watch_ma1awhu2.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Electronics_cat01_prod008_Apple_Watch_ma1awhu2.jpg' WHERE `pic` = '2024/01/手机数码_cat01_prod008_Apple_Watch_ma1awhu2.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Electronics_cat01_prod008_Apple_Watch_ma1awhu2.jpg' WHERE `img_path` = '2024/01/手机数码_cat01_prod008_Apple_Watch_ma1awhu2.jpg';

-- 更新文件: 手机数码_cat01_prod010_小米14_crfzcodi.jpg -> Electronics_cat01_prod010_Xiaomi14_crfzcodi.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Electronics_cat01_prod010_Xiaomi14_crfzcodi.jpg' WHERE `pic` = '2024/01/手机数码_cat01_prod010_小米14_crfzcodi.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/手机数码_cat01_prod010_小米14_crfzcodi.jpg', '2024/01/Electronics_cat01_prod010_Xiaomi14_crfzcodi.jpg') WHERE `imgs` LIKE '%2024/01/手机数码_cat01_prod010_小米14_crfzcodi.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/手机数码_cat01_prod010_小米14_crfzcodi.jpg', '2024/01/Electronics_cat01_prod010_Xiaomi14_crfzcodi.jpg') WHERE `content` LIKE '%2024/01/手机数码_cat01_prod010_小米14_crfzcodi.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Electronics_cat01_prod010_Xiaomi14_crfzcodi.jpg' WHERE `pic` = '2024/01/手机数码_cat01_prod010_小米14_crfzcodi.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Electronics_cat01_prod010_Xiaomi14_crfzcodi.jpg' WHERE `img_path` = '2024/01/手机数码_cat01_prod010_小米14_crfzcodi.jpg';

-- 更新文件: 手机数码_cat01_prod011_华为Mate_60_sjbdolqo.jpg -> Electronics_cat01_prod011_HuaweiMate60_sjbdolqo.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Electronics_cat01_prod011_HuaweiMate60_sjbdolqo.jpg' WHERE `pic` = '2024/01/手机数码_cat01_prod011_华为Mate_60_sjbdolqo.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/手机数码_cat01_prod011_华为Mate_60_sjbdolqo.jpg', '2024/01/Electronics_cat01_prod011_HuaweiMate60_sjbdolqo.jpg') WHERE `imgs` LIKE '%2024/01/手机数码_cat01_prod011_华为Mate_60_sjbdolqo.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/手机数码_cat01_prod011_华为Mate_60_sjbdolqo.jpg', '2024/01/Electronics_cat01_prod011_HuaweiMate60_sjbdolqo.jpg') WHERE `content` LIKE '%2024/01/手机数码_cat01_prod011_华为Mate_60_sjbdolqo.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Electronics_cat01_prod011_HuaweiMate60_sjbdolqo.jpg' WHERE `pic` = '2024/01/手机数码_cat01_prod011_华为Mate_60_sjbdolqo.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Electronics_cat01_prod011_HuaweiMate60_sjbdolqo.jpg' WHERE `img_path` = '2024/01/手机数码_cat01_prod011_华为Mate_60_sjbdolqo.jpg';

-- 更新文件: 手机数码_cat01_prod020_华为Mate_60_4nbsfaa0.jpg -> Electronics_cat01_prod020_HuaweiMate60_4nbsfaa0.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Electronics_cat01_prod020_HuaweiMate60_4nbsfaa0.jpg' WHERE `pic` = '2024/01/手机数码_cat01_prod020_华为Mate_60_4nbsfaa0.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/手机数码_cat01_prod020_华为Mate_60_4nbsfaa0.jpg', '2024/01/Electronics_cat01_prod020_HuaweiMate60_4nbsfaa0.jpg') WHERE `imgs` LIKE '%2024/01/手机数码_cat01_prod020_华为Mate_60_4nbsfaa0.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/手机数码_cat01_prod020_华为Mate_60_4nbsfaa0.jpg', '2024/01/Electronics_cat01_prod020_HuaweiMate60_4nbsfaa0.jpg') WHERE `content` LIKE '%2024/01/手机数码_cat01_prod020_华为Mate_60_4nbsfaa0.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Electronics_cat01_prod020_HuaweiMate60_4nbsfaa0.jpg' WHERE `pic` = '2024/01/手机数码_cat01_prod020_华为Mate_60_4nbsfaa0.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Electronics_cat01_prod020_HuaweiMate60_4nbsfaa0.jpg' WHERE `img_path` = '2024/01/手机数码_cat01_prod020_华为Mate_60_4nbsfaa0.jpg';

-- 更新文件: 手机数码_cat01_prod021_Samsung_Galaxy_S24_ha5emuum.jpg -> Electronics_cat01_prod021_Samsung_Galaxy_S24_ha5emuum.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Electronics_cat01_prod021_Samsung_Galaxy_S24_ha5emuum.jpg' WHERE `pic` = '2024/01/手机数码_cat01_prod021_Samsung_Galaxy_S24_ha5emuum.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/手机数码_cat01_prod021_Samsung_Galaxy_S24_ha5emuum.jpg', '2024/01/Electronics_cat01_prod021_Samsung_Galaxy_S24_ha5emuum.jpg') WHERE `imgs` LIKE '%2024/01/手机数码_cat01_prod021_Samsung_Galaxy_S24_ha5emuum.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/手机数码_cat01_prod021_Samsung_Galaxy_S24_ha5emuum.jpg', '2024/01/Electronics_cat01_prod021_Samsung_Galaxy_S24_ha5emuum.jpg') WHERE `content` LIKE '%2024/01/手机数码_cat01_prod021_Samsung_Galaxy_S24_ha5emuum.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Electronics_cat01_prod021_Samsung_Galaxy_S24_ha5emuum.jpg' WHERE `pic` = '2024/01/手机数码_cat01_prod021_Samsung_Galaxy_S24_ha5emuum.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Electronics_cat01_prod021_Samsung_Galaxy_S24_ha5emuum.jpg' WHERE `img_path` = '2024/01/手机数码_cat01_prod021_Samsung_Galaxy_S24_ha5emuum.jpg';

-- 更新文件: 手机数码_cat01_prod030_Samsung_Galaxy_S24_v5mp6cnp.jpg -> Electronics_cat01_prod030_Samsung_Galaxy_S24_v5mp6cnp.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Electronics_cat01_prod030_Samsung_Galaxy_S24_v5mp6cnp.jpg' WHERE `pic` = '2024/01/手机数码_cat01_prod030_Samsung_Galaxy_S24_v5mp6cnp.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/手机数码_cat01_prod030_Samsung_Galaxy_S24_v5mp6cnp.jpg', '2024/01/Electronics_cat01_prod030_Samsung_Galaxy_S24_v5mp6cnp.jpg') WHERE `imgs` LIKE '%2024/01/手机数码_cat01_prod030_Samsung_Galaxy_S24_v5mp6cnp.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/手机数码_cat01_prod030_Samsung_Galaxy_S24_v5mp6cnp.jpg', '2024/01/Electronics_cat01_prod030_Samsung_Galaxy_S24_v5mp6cnp.jpg') WHERE `content` LIKE '%2024/01/手机数码_cat01_prod030_Samsung_Galaxy_S24_v5mp6cnp.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Electronics_cat01_prod030_Samsung_Galaxy_S24_v5mp6cnp.jpg' WHERE `pic` = '2024/01/手机数码_cat01_prod030_Samsung_Galaxy_S24_v5mp6cnp.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Electronics_cat01_prod030_Samsung_Galaxy_S24_v5mp6cnp.jpg' WHERE `img_path` = '2024/01/手机数码_cat01_prod030_Samsung_Galaxy_S24_v5mp6cnp.jpg';

-- 更新文件: 手机数码_cat01_prod031_iPad_Pro_7bp1h71n.jpg -> Electronics_cat01_prod031_iPad_Pro_7bp1h71n.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Electronics_cat01_prod031_iPad_Pro_7bp1h71n.jpg' WHERE `pic` = '2024/01/手机数码_cat01_prod031_iPad_Pro_7bp1h71n.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/手机数码_cat01_prod031_iPad_Pro_7bp1h71n.jpg', '2024/01/Electronics_cat01_prod031_iPad_Pro_7bp1h71n.jpg') WHERE `imgs` LIKE '%2024/01/手机数码_cat01_prod031_iPad_Pro_7bp1h71n.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/手机数码_cat01_prod031_iPad_Pro_7bp1h71n.jpg', '2024/01/Electronics_cat01_prod031_iPad_Pro_7bp1h71n.jpg') WHERE `content` LIKE '%2024/01/手机数码_cat01_prod031_iPad_Pro_7bp1h71n.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Electronics_cat01_prod031_iPad_Pro_7bp1h71n.jpg' WHERE `pic` = '2024/01/手机数码_cat01_prod031_iPad_Pro_7bp1h71n.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Electronics_cat01_prod031_iPad_Pro_7bp1h71n.jpg' WHERE `img_path` = '2024/01/手机数码_cat01_prod031_iPad_Pro_7bp1h71n.jpg';

-- 更新文件: 手机数码_cat01_prod040_iPad_Pro_7z010z83.jpg -> Electronics_cat01_prod040_iPad_Pro_7z010z83.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Electronics_cat01_prod040_iPad_Pro_7z010z83.jpg' WHERE `pic` = '2024/01/手机数码_cat01_prod040_iPad_Pro_7z010z83.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/手机数码_cat01_prod040_iPad_Pro_7z010z83.jpg', '2024/01/Electronics_cat01_prod040_iPad_Pro_7z010z83.jpg') WHERE `imgs` LIKE '%2024/01/手机数码_cat01_prod040_iPad_Pro_7z010z83.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/手机数码_cat01_prod040_iPad_Pro_7z010z83.jpg', '2024/01/Electronics_cat01_prod040_iPad_Pro_7z010z83.jpg') WHERE `content` LIKE '%2024/01/手机数码_cat01_prod040_iPad_Pro_7z010z83.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Electronics_cat01_prod040_iPad_Pro_7z010z83.jpg' WHERE `pic` = '2024/01/手机数码_cat01_prod040_iPad_Pro_7z010z83.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Electronics_cat01_prod040_iPad_Pro_7z010z83.jpg' WHERE `img_path` = '2024/01/手机数码_cat01_prod040_iPad_Pro_7z010z83.jpg';

-- 更新文件: 手机数码_cat01_prod041_MacBook_Pro_hihbizdq.jpg -> Electronics_cat01_prod041_MacBook_Pro_hihbizdq.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Electronics_cat01_prod041_MacBook_Pro_hihbizdq.jpg' WHERE `pic` = '2024/01/手机数码_cat01_prod041_MacBook_Pro_hihbizdq.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/手机数码_cat01_prod041_MacBook_Pro_hihbizdq.jpg', '2024/01/Electronics_cat01_prod041_MacBook_Pro_hihbizdq.jpg') WHERE `imgs` LIKE '%2024/01/手机数码_cat01_prod041_MacBook_Pro_hihbizdq.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/手机数码_cat01_prod041_MacBook_Pro_hihbizdq.jpg', '2024/01/Electronics_cat01_prod041_MacBook_Pro_hihbizdq.jpg') WHERE `content` LIKE '%2024/01/手机数码_cat01_prod041_MacBook_Pro_hihbizdq.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Electronics_cat01_prod041_MacBook_Pro_hihbizdq.jpg' WHERE `pic` = '2024/01/手机数码_cat01_prod041_MacBook_Pro_hihbizdq.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Electronics_cat01_prod041_MacBook_Pro_hihbizdq.jpg' WHERE `img_path` = '2024/01/手机数码_cat01_prod041_MacBook_Pro_hihbizdq.jpg';

-- 更新文件: 手机数码_cat01_prod050_MacBook_Pro_obtyg5b9.jpg -> Electronics_cat01_prod050_MacBook_Pro_obtyg5b9.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Electronics_cat01_prod050_MacBook_Pro_obtyg5b9.jpg' WHERE `pic` = '2024/01/手机数码_cat01_prod050_MacBook_Pro_obtyg5b9.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/手机数码_cat01_prod050_MacBook_Pro_obtyg5b9.jpg', '2024/01/Electronics_cat01_prod050_MacBook_Pro_obtyg5b9.jpg') WHERE `imgs` LIKE '%2024/01/手机数码_cat01_prod050_MacBook_Pro_obtyg5b9.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/手机数码_cat01_prod050_MacBook_Pro_obtyg5b9.jpg', '2024/01/Electronics_cat01_prod050_MacBook_Pro_obtyg5b9.jpg') WHERE `content` LIKE '%2024/01/手机数码_cat01_prod050_MacBook_Pro_obtyg5b9.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Electronics_cat01_prod050_MacBook_Pro_obtyg5b9.jpg' WHERE `pic` = '2024/01/手机数码_cat01_prod050_MacBook_Pro_obtyg5b9.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Electronics_cat01_prod050_MacBook_Pro_obtyg5b9.jpg' WHERE `img_path` = '2024/01/手机数码_cat01_prod050_MacBook_Pro_obtyg5b9.jpg';

-- 更新文件: 手机数码_cat01_prod051_AirPods_Pro_83x67z99.jpg -> Electronics_cat01_prod051_AirPods_Pro_83x67z99.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Electronics_cat01_prod051_AirPods_Pro_83x67z99.jpg' WHERE `pic` = '2024/01/手机数码_cat01_prod051_AirPods_Pro_83x67z99.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/手机数码_cat01_prod051_AirPods_Pro_83x67z99.jpg', '2024/01/Electronics_cat01_prod051_AirPods_Pro_83x67z99.jpg') WHERE `imgs` LIKE '%2024/01/手机数码_cat01_prod051_AirPods_Pro_83x67z99.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/手机数码_cat01_prod051_AirPods_Pro_83x67z99.jpg', '2024/01/Electronics_cat01_prod051_AirPods_Pro_83x67z99.jpg') WHERE `content` LIKE '%2024/01/手机数码_cat01_prod051_AirPods_Pro_83x67z99.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Electronics_cat01_prod051_AirPods_Pro_83x67z99.jpg' WHERE `pic` = '2024/01/手机数码_cat01_prod051_AirPods_Pro_83x67z99.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Electronics_cat01_prod051_AirPods_Pro_83x67z99.jpg' WHERE `img_path` = '2024/01/手机数码_cat01_prod051_AirPods_Pro_83x67z99.jpg';

-- 更新文件: 手机数码_cat01_prod060_AirPods_Pro_vwwkz8ri.jpg -> Electronics_cat01_prod060_AirPods_Pro_vwwkz8ri.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Electronics_cat01_prod060_AirPods_Pro_vwwkz8ri.jpg' WHERE `pic` = '2024/01/手机数码_cat01_prod060_AirPods_Pro_vwwkz8ri.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/手机数码_cat01_prod060_AirPods_Pro_vwwkz8ri.jpg', '2024/01/Electronics_cat01_prod060_AirPods_Pro_vwwkz8ri.jpg') WHERE `imgs` LIKE '%2024/01/手机数码_cat01_prod060_AirPods_Pro_vwwkz8ri.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/手机数码_cat01_prod060_AirPods_Pro_vwwkz8ri.jpg', '2024/01/Electronics_cat01_prod060_AirPods_Pro_vwwkz8ri.jpg') WHERE `content` LIKE '%2024/01/手机数码_cat01_prod060_AirPods_Pro_vwwkz8ri.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Electronics_cat01_prod060_AirPods_Pro_vwwkz8ri.jpg' WHERE `pic` = '2024/01/手机数码_cat01_prod060_AirPods_Pro_vwwkz8ri.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Electronics_cat01_prod060_AirPods_Pro_vwwkz8ri.jpg' WHERE `img_path` = '2024/01/手机数码_cat01_prod060_AirPods_Pro_vwwkz8ri.jpg';

-- 更新文件: 手机数码_cat01_prod061_Apple_Watch_9vjy4qck.jpg -> Electronics_cat01_prod061_Apple_Watch_9vjy4qck.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Electronics_cat01_prod061_Apple_Watch_9vjy4qck.jpg' WHERE `pic` = '2024/01/手机数码_cat01_prod061_Apple_Watch_9vjy4qck.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/手机数码_cat01_prod061_Apple_Watch_9vjy4qck.jpg', '2024/01/Electronics_cat01_prod061_Apple_Watch_9vjy4qck.jpg') WHERE `imgs` LIKE '%2024/01/手机数码_cat01_prod061_Apple_Watch_9vjy4qck.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/手机数码_cat01_prod061_Apple_Watch_9vjy4qck.jpg', '2024/01/Electronics_cat01_prod061_Apple_Watch_9vjy4qck.jpg') WHERE `content` LIKE '%2024/01/手机数码_cat01_prod061_Apple_Watch_9vjy4qck.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Electronics_cat01_prod061_Apple_Watch_9vjy4qck.jpg' WHERE `pic` = '2024/01/手机数码_cat01_prod061_Apple_Watch_9vjy4qck.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Electronics_cat01_prod061_Apple_Watch_9vjy4qck.jpg' WHERE `img_path` = '2024/01/手机数码_cat01_prod061_Apple_Watch_9vjy4qck.jpg';

-- 更新文件: 手机数码_cat01_prod070_Apple_Watch_q2sva3nh.jpg -> Electronics_cat01_prod070_Apple_Watch_q2sva3nh.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Electronics_cat01_prod070_Apple_Watch_q2sva3nh.jpg' WHERE `pic` = '2024/01/手机数码_cat01_prod070_Apple_Watch_q2sva3nh.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/手机数码_cat01_prod070_Apple_Watch_q2sva3nh.jpg', '2024/01/Electronics_cat01_prod070_Apple_Watch_q2sva3nh.jpg') WHERE `imgs` LIKE '%2024/01/手机数码_cat01_prod070_Apple_Watch_q2sva3nh.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/手机数码_cat01_prod070_Apple_Watch_q2sva3nh.jpg', '2024/01/Electronics_cat01_prod070_Apple_Watch_q2sva3nh.jpg') WHERE `content` LIKE '%2024/01/手机数码_cat01_prod070_Apple_Watch_q2sva3nh.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Electronics_cat01_prod070_Apple_Watch_q2sva3nh.jpg' WHERE `pic` = '2024/01/手机数码_cat01_prod070_Apple_Watch_q2sva3nh.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Electronics_cat01_prod070_Apple_Watch_q2sva3nh.jpg' WHERE `img_path` = '2024/01/手机数码_cat01_prod070_Apple_Watch_q2sva3nh.jpg';

-- 更新文件: 手机数码_cat01_prod071_iPhone_15_Pro_b1n1n8vh.jpg -> Electronics_cat01_prod071_iPhone_15_Pro_b1n1n8vh.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Electronics_cat01_prod071_iPhone_15_Pro_b1n1n8vh.jpg' WHERE `pic` = '2024/01/手机数码_cat01_prod071_iPhone_15_Pro_b1n1n8vh.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/手机数码_cat01_prod071_iPhone_15_Pro_b1n1n8vh.jpg', '2024/01/Electronics_cat01_prod071_iPhone_15_Pro_b1n1n8vh.jpg') WHERE `imgs` LIKE '%2024/01/手机数码_cat01_prod071_iPhone_15_Pro_b1n1n8vh.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/手机数码_cat01_prod071_iPhone_15_Pro_b1n1n8vh.jpg', '2024/01/Electronics_cat01_prod071_iPhone_15_Pro_b1n1n8vh.jpg') WHERE `content` LIKE '%2024/01/手机数码_cat01_prod071_iPhone_15_Pro_b1n1n8vh.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Electronics_cat01_prod071_iPhone_15_Pro_b1n1n8vh.jpg' WHERE `pic` = '2024/01/手机数码_cat01_prod071_iPhone_15_Pro_b1n1n8vh.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Electronics_cat01_prod071_iPhone_15_Pro_b1n1n8vh.jpg' WHERE `img_path` = '2024/01/手机数码_cat01_prod071_iPhone_15_Pro_b1n1n8vh.jpg';

-- 更新文件: 手机数码_cat01_prod080_iPhone_15_Pro_xwpum901.jpg -> Electronics_cat01_prod080_iPhone_15_Pro_xwpum901.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Electronics_cat01_prod080_iPhone_15_Pro_xwpum901.jpg' WHERE `pic` = '2024/01/手机数码_cat01_prod080_iPhone_15_Pro_xwpum901.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/手机数码_cat01_prod080_iPhone_15_Pro_xwpum901.jpg', '2024/01/Electronics_cat01_prod080_iPhone_15_Pro_xwpum901.jpg') WHERE `imgs` LIKE '%2024/01/手机数码_cat01_prod080_iPhone_15_Pro_xwpum901.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/手机数码_cat01_prod080_iPhone_15_Pro_xwpum901.jpg', '2024/01/Electronics_cat01_prod080_iPhone_15_Pro_xwpum901.jpg') WHERE `content` LIKE '%2024/01/手机数码_cat01_prod080_iPhone_15_Pro_xwpum901.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Electronics_cat01_prod080_iPhone_15_Pro_xwpum901.jpg' WHERE `pic` = '2024/01/手机数码_cat01_prod080_iPhone_15_Pro_xwpum901.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Electronics_cat01_prod080_iPhone_15_Pro_xwpum901.jpg' WHERE `img_path` = '2024/01/手机数码_cat01_prod080_iPhone_15_Pro_xwpum901.jpg';

-- 更新文件: 手机数码_cat01_prod081_小米14_4ovphs0h.jpg -> Electronics_cat01_prod081_Xiaomi14_4ovphs0h.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Electronics_cat01_prod081_Xiaomi14_4ovphs0h.jpg' WHERE `pic` = '2024/01/手机数码_cat01_prod081_小米14_4ovphs0h.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/手机数码_cat01_prod081_小米14_4ovphs0h.jpg', '2024/01/Electronics_cat01_prod081_Xiaomi14_4ovphs0h.jpg') WHERE `imgs` LIKE '%2024/01/手机数码_cat01_prod081_小米14_4ovphs0h.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/手机数码_cat01_prod081_小米14_4ovphs0h.jpg', '2024/01/Electronics_cat01_prod081_Xiaomi14_4ovphs0h.jpg') WHERE `content` LIKE '%2024/01/手机数码_cat01_prod081_小米14_4ovphs0h.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Electronics_cat01_prod081_Xiaomi14_4ovphs0h.jpg' WHERE `pic` = '2024/01/手机数码_cat01_prod081_小米14_4ovphs0h.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Electronics_cat01_prod081_Xiaomi14_4ovphs0h.jpg' WHERE `img_path` = '2024/01/手机数码_cat01_prod081_小米14_4ovphs0h.jpg';

-- 更新文件: 服装配饰_cat07_prod001_Uniqlo_衬衫_9t945krq.jpg -> Fashion_cat07_prod001_Uniqlo_Shirt_9t945krq.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Fashion_cat07_prod001_Uniqlo_Shirt_9t945krq.jpg' WHERE `pic` = '2024/01/服装配饰_cat07_prod001_Uniqlo_衬衫_9t945krq.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/服装配饰_cat07_prod001_Uniqlo_衬衫_9t945krq.jpg', '2024/01/Fashion_cat07_prod001_Uniqlo_Shirt_9t945krq.jpg') WHERE `imgs` LIKE '%2024/01/服装配饰_cat07_prod001_Uniqlo_衬衫_9t945krq.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/服装配饰_cat07_prod001_Uniqlo_衬衫_9t945krq.jpg', '2024/01/Fashion_cat07_prod001_Uniqlo_Shirt_9t945krq.jpg') WHERE `content` LIKE '%2024/01/服装配饰_cat07_prod001_Uniqlo_衬衫_9t945krq.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Fashion_cat07_prod001_Uniqlo_Shirt_9t945krq.jpg' WHERE `pic` = '2024/01/服装配饰_cat07_prod001_Uniqlo_衬衫_9t945krq.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Fashion_cat07_prod001_Uniqlo_Shirt_9t945krq.jpg' WHERE `img_path` = '2024/01/服装配饰_cat07_prod001_Uniqlo_衬衫_9t945krq.jpg';

-- 更新文件: 服装配饰_cat07_prod002_Nike_运动鞋_cp7xm2l3.jpg -> Fashion_cat07_prod002_Nike_Sneakers_cp7xm2l3.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Fashion_cat07_prod002_Nike_Sneakers_cp7xm2l3.jpg' WHERE `pic` = '2024/01/服装配饰_cat07_prod002_Nike_运动鞋_cp7xm2l3.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/服装配饰_cat07_prod002_Nike_运动鞋_cp7xm2l3.jpg', '2024/01/Fashion_cat07_prod002_Nike_Sneakers_cp7xm2l3.jpg') WHERE `imgs` LIKE '%2024/01/服装配饰_cat07_prod002_Nike_运动鞋_cp7xm2l3.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/服装配饰_cat07_prod002_Nike_运动鞋_cp7xm2l3.jpg', '2024/01/Fashion_cat07_prod002_Nike_Sneakers_cp7xm2l3.jpg') WHERE `content` LIKE '%2024/01/服装配饰_cat07_prod002_Nike_运动鞋_cp7xm2l3.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Fashion_cat07_prod002_Nike_Sneakers_cp7xm2l3.jpg' WHERE `pic` = '2024/01/服装配饰_cat07_prod002_Nike_运动鞋_cp7xm2l3.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Fashion_cat07_prod002_Nike_Sneakers_cp7xm2l3.jpg' WHERE `img_path` = '2024/01/服装配饰_cat07_prod002_Nike_运动鞋_cp7xm2l3.jpg';

-- 更新文件: 服装配饰_cat07_prod003_Coach_包_f6tg85b8.jpg -> Fashion_cat07_prod003_Coach_Bag_f6tg85b8.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Fashion_cat07_prod003_Coach_Bag_f6tg85b8.jpg' WHERE `pic` = '2024/01/服装配饰_cat07_prod003_Coach_包_f6tg85b8.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/服装配饰_cat07_prod003_Coach_包_f6tg85b8.jpg', '2024/01/Fashion_cat07_prod003_Coach_Bag_f6tg85b8.jpg') WHERE `imgs` LIKE '%2024/01/服装配饰_cat07_prod003_Coach_包_f6tg85b8.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/服装配饰_cat07_prod003_Coach_包_f6tg85b8.jpg', '2024/01/Fashion_cat07_prod003_Coach_Bag_f6tg85b8.jpg') WHERE `content` LIKE '%2024/01/服装配饰_cat07_prod003_Coach_包_f6tg85b8.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Fashion_cat07_prod003_Coach_Bag_f6tg85b8.jpg' WHERE `pic` = '2024/01/服装配饰_cat07_prod003_Coach_包_f6tg85b8.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Fashion_cat07_prod003_Coach_Bag_f6tg85b8.jpg' WHERE `img_path` = '2024/01/服装配饰_cat07_prod003_Coach_包_f6tg85b8.jpg';

-- 更新文件: 服装配饰_cat07_prod004_Rolex_手表_48l9w8yq.jpg -> Fashion_cat07_prod004_Rolex_Watch_48l9w8yq.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Fashion_cat07_prod004_Rolex_Watch_48l9w8yq.jpg' WHERE `pic` = '2024/01/服装配饰_cat07_prod004_Rolex_手表_48l9w8yq.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/服装配饰_cat07_prod004_Rolex_手表_48l9w8yq.jpg', '2024/01/Fashion_cat07_prod004_Rolex_Watch_48l9w8yq.jpg') WHERE `imgs` LIKE '%2024/01/服装配饰_cat07_prod004_Rolex_手表_48l9w8yq.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/服装配饰_cat07_prod004_Rolex_手表_48l9w8yq.jpg', '2024/01/Fashion_cat07_prod004_Rolex_Watch_48l9w8yq.jpg') WHERE `content` LIKE '%2024/01/服装配饰_cat07_prod004_Rolex_手表_48l9w8yq.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Fashion_cat07_prod004_Rolex_Watch_48l9w8yq.jpg' WHERE `pic` = '2024/01/服装配饰_cat07_prod004_Rolex_手表_48l9w8yq.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Fashion_cat07_prod004_Rolex_Watch_48l9w8yq.jpg' WHERE `img_path` = '2024/01/服装配饰_cat07_prod004_Rolex_手表_48l9w8yq.jpg';

-- 更新文件: 服装配饰_cat07_prod010_Nike_运动鞋_4rawdqtr.jpg -> Fashion_cat07_prod010_Nike_Sneakers_4rawdqtr.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Fashion_cat07_prod010_Nike_Sneakers_4rawdqtr.jpg' WHERE `pic` = '2024/01/服装配饰_cat07_prod010_Nike_运动鞋_4rawdqtr.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/服装配饰_cat07_prod010_Nike_运动鞋_4rawdqtr.jpg', '2024/01/Fashion_cat07_prod010_Nike_Sneakers_4rawdqtr.jpg') WHERE `imgs` LIKE '%2024/01/服装配饰_cat07_prod010_Nike_运动鞋_4rawdqtr.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/服装配饰_cat07_prod010_Nike_运动鞋_4rawdqtr.jpg', '2024/01/Fashion_cat07_prod010_Nike_Sneakers_4rawdqtr.jpg') WHERE `content` LIKE '%2024/01/服装配饰_cat07_prod010_Nike_运动鞋_4rawdqtr.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Fashion_cat07_prod010_Nike_Sneakers_4rawdqtr.jpg' WHERE `pic` = '2024/01/服装配饰_cat07_prod010_Nike_运动鞋_4rawdqtr.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Fashion_cat07_prod010_Nike_Sneakers_4rawdqtr.jpg' WHERE `img_path` = '2024/01/服装配饰_cat07_prod010_Nike_运动鞋_4rawdqtr.jpg';

-- 更新文件: 服装配饰_cat07_prod011_Coach_包_g08ag6v2.jpg -> Fashion_cat07_prod011_Coach_Bag_g08ag6v2.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Fashion_cat07_prod011_Coach_Bag_g08ag6v2.jpg' WHERE `pic` = '2024/01/服装配饰_cat07_prod011_Coach_包_g08ag6v2.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/服装配饰_cat07_prod011_Coach_包_g08ag6v2.jpg', '2024/01/Fashion_cat07_prod011_Coach_Bag_g08ag6v2.jpg') WHERE `imgs` LIKE '%2024/01/服装配饰_cat07_prod011_Coach_包_g08ag6v2.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/服装配饰_cat07_prod011_Coach_包_g08ag6v2.jpg', '2024/01/Fashion_cat07_prod011_Coach_Bag_g08ag6v2.jpg') WHERE `content` LIKE '%2024/01/服装配饰_cat07_prod011_Coach_包_g08ag6v2.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Fashion_cat07_prod011_Coach_Bag_g08ag6v2.jpg' WHERE `pic` = '2024/01/服装配饰_cat07_prod011_Coach_包_g08ag6v2.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Fashion_cat07_prod011_Coach_Bag_g08ag6v2.jpg' WHERE `img_path` = '2024/01/服装配饰_cat07_prod011_Coach_包_g08ag6v2.jpg';

-- 更新文件: 服装配饰_cat07_prod020_Coach_包_b6g0z4w4.jpg -> Fashion_cat07_prod020_Coach_Bag_b6g0z4w4.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Fashion_cat07_prod020_Coach_Bag_b6g0z4w4.jpg' WHERE `pic` = '2024/01/服装配饰_cat07_prod020_Coach_包_b6g0z4w4.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/服装配饰_cat07_prod020_Coach_包_b6g0z4w4.jpg', '2024/01/Fashion_cat07_prod020_Coach_Bag_b6g0z4w4.jpg') WHERE `imgs` LIKE '%2024/01/服装配饰_cat07_prod020_Coach_包_b6g0z4w4.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/服装配饰_cat07_prod020_Coach_包_b6g0z4w4.jpg', '2024/01/Fashion_cat07_prod020_Coach_Bag_b6g0z4w4.jpg') WHERE `content` LIKE '%2024/01/服装配饰_cat07_prod020_Coach_包_b6g0z4w4.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Fashion_cat07_prod020_Coach_Bag_b6g0z4w4.jpg' WHERE `pic` = '2024/01/服装配饰_cat07_prod020_Coach_包_b6g0z4w4.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Fashion_cat07_prod020_Coach_Bag_b6g0z4w4.jpg' WHERE `img_path` = '2024/01/服装配饰_cat07_prod020_Coach_包_b6g0z4w4.jpg';

-- 更新文件: 服装配饰_cat07_prod021_Rolex_手表_6mwqtdt6.jpg -> Fashion_cat07_prod021_Rolex_Watch_6mwqtdt6.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Fashion_cat07_prod021_Rolex_Watch_6mwqtdt6.jpg' WHERE `pic` = '2024/01/服装配饰_cat07_prod021_Rolex_手表_6mwqtdt6.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/服装配饰_cat07_prod021_Rolex_手表_6mwqtdt6.jpg', '2024/01/Fashion_cat07_prod021_Rolex_Watch_6mwqtdt6.jpg') WHERE `imgs` LIKE '%2024/01/服装配饰_cat07_prod021_Rolex_手表_6mwqtdt6.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/服装配饰_cat07_prod021_Rolex_手表_6mwqtdt6.jpg', '2024/01/Fashion_cat07_prod021_Rolex_Watch_6mwqtdt6.jpg') WHERE `content` LIKE '%2024/01/服装配饰_cat07_prod021_Rolex_手表_6mwqtdt6.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Fashion_cat07_prod021_Rolex_Watch_6mwqtdt6.jpg' WHERE `pic` = '2024/01/服装配饰_cat07_prod021_Rolex_手表_6mwqtdt6.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Fashion_cat07_prod021_Rolex_Watch_6mwqtdt6.jpg' WHERE `img_path` = '2024/01/服装配饰_cat07_prod021_Rolex_手表_6mwqtdt6.jpg';

-- 更新文件: 服装配饰_cat07_prod030_Rolex_手表_87oasfr8.jpg -> Fashion_cat07_prod030_Rolex_Watch_87oasfr8.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Fashion_cat07_prod030_Rolex_Watch_87oasfr8.jpg' WHERE `pic` = '2024/01/服装配饰_cat07_prod030_Rolex_手表_87oasfr8.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/服装配饰_cat07_prod030_Rolex_手表_87oasfr8.jpg', '2024/01/Fashion_cat07_prod030_Rolex_Watch_87oasfr8.jpg') WHERE `imgs` LIKE '%2024/01/服装配饰_cat07_prod030_Rolex_手表_87oasfr8.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/服装配饰_cat07_prod030_Rolex_手表_87oasfr8.jpg', '2024/01/Fashion_cat07_prod030_Rolex_Watch_87oasfr8.jpg') WHERE `content` LIKE '%2024/01/服装配饰_cat07_prod030_Rolex_手表_87oasfr8.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Fashion_cat07_prod030_Rolex_Watch_87oasfr8.jpg' WHERE `pic` = '2024/01/服装配饰_cat07_prod030_Rolex_手表_87oasfr8.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Fashion_cat07_prod030_Rolex_Watch_87oasfr8.jpg' WHERE `img_path` = '2024/01/服装配饰_cat07_prod030_Rolex_手表_87oasfr8.jpg';

-- 更新文件: 服装配饰_cat07_prod031_Uniqlo_衬衫_vbhceukg.jpg -> Fashion_cat07_prod031_Uniqlo_Shirt_vbhceukg.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Fashion_cat07_prod031_Uniqlo_Shirt_vbhceukg.jpg' WHERE `pic` = '2024/01/服装配饰_cat07_prod031_Uniqlo_衬衫_vbhceukg.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/服装配饰_cat07_prod031_Uniqlo_衬衫_vbhceukg.jpg', '2024/01/Fashion_cat07_prod031_Uniqlo_Shirt_vbhceukg.jpg') WHERE `imgs` LIKE '%2024/01/服装配饰_cat07_prod031_Uniqlo_衬衫_vbhceukg.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/服装配饰_cat07_prod031_Uniqlo_衬衫_vbhceukg.jpg', '2024/01/Fashion_cat07_prod031_Uniqlo_Shirt_vbhceukg.jpg') WHERE `content` LIKE '%2024/01/服装配饰_cat07_prod031_Uniqlo_衬衫_vbhceukg.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Fashion_cat07_prod031_Uniqlo_Shirt_vbhceukg.jpg' WHERE `pic` = '2024/01/服装配饰_cat07_prod031_Uniqlo_衬衫_vbhceukg.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Fashion_cat07_prod031_Uniqlo_Shirt_vbhceukg.jpg' WHERE `img_path` = '2024/01/服装配饰_cat07_prod031_Uniqlo_衬衫_vbhceukg.jpg';

-- 更新文件: 服装配饰_cat07_prod040_Uniqlo_衬衫_p4j7nuy2.jpg -> Fashion_cat07_prod040_Uniqlo_Shirt_p4j7nuy2.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Fashion_cat07_prod040_Uniqlo_Shirt_p4j7nuy2.jpg' WHERE `pic` = '2024/01/服装配饰_cat07_prod040_Uniqlo_衬衫_p4j7nuy2.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/服装配饰_cat07_prod040_Uniqlo_衬衫_p4j7nuy2.jpg', '2024/01/Fashion_cat07_prod040_Uniqlo_Shirt_p4j7nuy2.jpg') WHERE `imgs` LIKE '%2024/01/服装配饰_cat07_prod040_Uniqlo_衬衫_p4j7nuy2.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/服装配饰_cat07_prod040_Uniqlo_衬衫_p4j7nuy2.jpg', '2024/01/Fashion_cat07_prod040_Uniqlo_Shirt_p4j7nuy2.jpg') WHERE `content` LIKE '%2024/01/服装配饰_cat07_prod040_Uniqlo_衬衫_p4j7nuy2.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Fashion_cat07_prod040_Uniqlo_Shirt_p4j7nuy2.jpg' WHERE `pic` = '2024/01/服装配饰_cat07_prod040_Uniqlo_衬衫_p4j7nuy2.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Fashion_cat07_prod040_Uniqlo_Shirt_p4j7nuy2.jpg' WHERE `img_path` = '2024/01/服装配饰_cat07_prod040_Uniqlo_衬衫_p4j7nuy2.jpg';

-- 更新文件: 服装配饰_cat07_prod041_Nike_运动鞋_henmat2b.jpg -> Fashion_cat07_prod041_Nike_Sneakers_henmat2b.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Fashion_cat07_prod041_Nike_Sneakers_henmat2b.jpg' WHERE `pic` = '2024/01/服装配饰_cat07_prod041_Nike_运动鞋_henmat2b.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/服装配饰_cat07_prod041_Nike_运动鞋_henmat2b.jpg', '2024/01/Fashion_cat07_prod041_Nike_Sneakers_henmat2b.jpg') WHERE `imgs` LIKE '%2024/01/服装配饰_cat07_prod041_Nike_运动鞋_henmat2b.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/服装配饰_cat07_prod041_Nike_运动鞋_henmat2b.jpg', '2024/01/Fashion_cat07_prod041_Nike_Sneakers_henmat2b.jpg') WHERE `content` LIKE '%2024/01/服装配饰_cat07_prod041_Nike_运动鞋_henmat2b.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Fashion_cat07_prod041_Nike_Sneakers_henmat2b.jpg' WHERE `pic` = '2024/01/服装配饰_cat07_prod041_Nike_运动鞋_henmat2b.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Fashion_cat07_prod041_Nike_Sneakers_henmat2b.jpg' WHERE `img_path` = '2024/01/服装配饰_cat07_prod041_Nike_运动鞋_henmat2b.jpg';

-- 更新文件: 母婴用品_cat08_prod001_美赞臣_奶粉_cqka7n6k.jpg -> Baby_cat08_prod001_MeadJohnson_Formula_cqka7n6k.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Baby_cat08_prod001_MeadJohnson_Formula_cqka7n6k.jpg' WHERE `pic` = '2024/01/母婴用品_cat08_prod001_美赞臣_奶粉_cqka7n6k.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/母婴用品_cat08_prod001_美赞臣_奶粉_cqka7n6k.jpg', '2024/01/Baby_cat08_prod001_MeadJohnson_Formula_cqka7n6k.jpg') WHERE `imgs` LIKE '%2024/01/母婴用品_cat08_prod001_美赞臣_奶粉_cqka7n6k.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/母婴用品_cat08_prod001_美赞臣_奶粉_cqka7n6k.jpg', '2024/01/Baby_cat08_prod001_MeadJohnson_Formula_cqka7n6k.jpg') WHERE `content` LIKE '%2024/01/母婴用品_cat08_prod001_美赞臣_奶粉_cqka7n6k.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Baby_cat08_prod001_MeadJohnson_Formula_cqka7n6k.jpg' WHERE `pic` = '2024/01/母婴用品_cat08_prod001_美赞臣_奶粉_cqka7n6k.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Baby_cat08_prod001_MeadJohnson_Formula_cqka7n6k.jpg' WHERE `img_path` = '2024/01/母婴用品_cat08_prod001_美赞臣_奶粉_cqka7n6k.jpg';

-- 更新文件: 母婴用品_cat08_prod002_费雪_玩具_e6l6e1y9.jpg -> Baby_cat08_prod002_FisherPrice_Toy_e6l6e1y9.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Baby_cat08_prod002_FisherPrice_Toy_e6l6e1y9.jpg' WHERE `pic` = '2024/01/母婴用品_cat08_prod002_费雪_玩具_e6l6e1y9.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/母婴用品_cat08_prod002_费雪_玩具_e6l6e1y9.jpg', '2024/01/Baby_cat08_prod002_FisherPrice_Toy_e6l6e1y9.jpg') WHERE `imgs` LIKE '%2024/01/母婴用品_cat08_prod002_费雪_玩具_e6l6e1y9.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/母婴用品_cat08_prod002_费雪_玩具_e6l6e1y9.jpg', '2024/01/Baby_cat08_prod002_FisherPrice_Toy_e6l6e1y9.jpg') WHERE `content` LIKE '%2024/01/母婴用品_cat08_prod002_费雪_玩具_e6l6e1y9.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Baby_cat08_prod002_FisherPrice_Toy_e6l6e1y9.jpg' WHERE `pic` = '2024/01/母婴用品_cat08_prod002_费雪_玩具_e6l6e1y9.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Baby_cat08_prod002_FisherPrice_Toy_e6l6e1y9.jpg' WHERE `img_path` = '2024/01/母婴用品_cat08_prod002_费雪_玩具_e6l6e1y9.jpg';

-- 更新文件: 母婴用品_cat08_prod003_好孩子_婴儿车_gmxistng.jpg -> Baby_cat08_prod003_Goodbaby_Stroller_gmxistng.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Baby_cat08_prod003_Goodbaby_Stroller_gmxistng.jpg' WHERE `pic` = '2024/01/母婴用品_cat08_prod003_好孩子_婴儿车_gmxistng.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/母婴用品_cat08_prod003_好孩子_婴儿车_gmxistng.jpg', '2024/01/Baby_cat08_prod003_Goodbaby_Stroller_gmxistng.jpg') WHERE `imgs` LIKE '%2024/01/母婴用品_cat08_prod003_好孩子_婴儿车_gmxistng.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/母婴用品_cat08_prod003_好孩子_婴儿车_gmxistng.jpg', '2024/01/Baby_cat08_prod003_Goodbaby_Stroller_gmxistng.jpg') WHERE `content` LIKE '%2024/01/母婴用品_cat08_prod003_好孩子_婴儿车_gmxistng.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Baby_cat08_prod003_Goodbaby_Stroller_gmxistng.jpg' WHERE `pic` = '2024/01/母婴用品_cat08_prod003_好孩子_婴儿车_gmxistng.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Baby_cat08_prod003_Goodbaby_Stroller_gmxistng.jpg' WHERE `img_path` = '2024/01/母婴用品_cat08_prod003_好孩子_婴儿车_gmxistng.jpg';

-- 更新文件: 母婴用品_cat08_prod004_NUK_奶瓶_nv7odck5.jpg -> Baby_cat08_prod004_NUK_Bottle_nv7odck5.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Baby_cat08_prod004_NUK_Bottle_nv7odck5.jpg' WHERE `pic` = '2024/01/母婴用品_cat08_prod004_NUK_奶瓶_nv7odck5.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/母婴用品_cat08_prod004_NUK_奶瓶_nv7odck5.jpg', '2024/01/Baby_cat08_prod004_NUK_Bottle_nv7odck5.jpg') WHERE `imgs` LIKE '%2024/01/母婴用品_cat08_prod004_NUK_奶瓶_nv7odck5.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/母婴用品_cat08_prod004_NUK_奶瓶_nv7odck5.jpg', '2024/01/Baby_cat08_prod004_NUK_Bottle_nv7odck5.jpg') WHERE `content` LIKE '%2024/01/母婴用品_cat08_prod004_NUK_奶瓶_nv7odck5.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Baby_cat08_prod004_NUK_Bottle_nv7odck5.jpg' WHERE `pic` = '2024/01/母婴用品_cat08_prod004_NUK_奶瓶_nv7odck5.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Baby_cat08_prod004_NUK_Bottle_nv7odck5.jpg' WHERE `img_path` = '2024/01/母婴用品_cat08_prod004_NUK_奶瓶_nv7odck5.jpg';

-- 更新文件: 母婴用品_cat08_prod010_费雪_玩具_tuy4hu5h.jpg -> Baby_cat08_prod010_FisherPrice_Toy_tuy4hu5h.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Baby_cat08_prod010_FisherPrice_Toy_tuy4hu5h.jpg' WHERE `pic` = '2024/01/母婴用品_cat08_prod010_费雪_玩具_tuy4hu5h.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/母婴用品_cat08_prod010_费雪_玩具_tuy4hu5h.jpg', '2024/01/Baby_cat08_prod010_FisherPrice_Toy_tuy4hu5h.jpg') WHERE `imgs` LIKE '%2024/01/母婴用品_cat08_prod010_费雪_玩具_tuy4hu5h.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/母婴用品_cat08_prod010_费雪_玩具_tuy4hu5h.jpg', '2024/01/Baby_cat08_prod010_FisherPrice_Toy_tuy4hu5h.jpg') WHERE `content` LIKE '%2024/01/母婴用品_cat08_prod010_费雪_玩具_tuy4hu5h.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Baby_cat08_prod010_FisherPrice_Toy_tuy4hu5h.jpg' WHERE `pic` = '2024/01/母婴用品_cat08_prod010_费雪_玩具_tuy4hu5h.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Baby_cat08_prod010_FisherPrice_Toy_tuy4hu5h.jpg' WHERE `img_path` = '2024/01/母婴用品_cat08_prod010_费雪_玩具_tuy4hu5h.jpg';

-- 更新文件: 母婴用品_cat08_prod011_好孩子_婴儿车_20vd1kav.jpg -> Baby_cat08_prod011_Goodbaby_Stroller_20vd1kav.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Baby_cat08_prod011_Goodbaby_Stroller_20vd1kav.jpg' WHERE `pic` = '2024/01/母婴用品_cat08_prod011_好孩子_婴儿车_20vd1kav.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/母婴用品_cat08_prod011_好孩子_婴儿车_20vd1kav.jpg', '2024/01/Baby_cat08_prod011_Goodbaby_Stroller_20vd1kav.jpg') WHERE `imgs` LIKE '%2024/01/母婴用品_cat08_prod011_好孩子_婴儿车_20vd1kav.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/母婴用品_cat08_prod011_好孩子_婴儿车_20vd1kav.jpg', '2024/01/Baby_cat08_prod011_Goodbaby_Stroller_20vd1kav.jpg') WHERE `content` LIKE '%2024/01/母婴用品_cat08_prod011_好孩子_婴儿车_20vd1kav.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Baby_cat08_prod011_Goodbaby_Stroller_20vd1kav.jpg' WHERE `pic` = '2024/01/母婴用品_cat08_prod011_好孩子_婴儿车_20vd1kav.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Baby_cat08_prod011_Goodbaby_Stroller_20vd1kav.jpg' WHERE `img_path` = '2024/01/母婴用品_cat08_prod011_好孩子_婴儿车_20vd1kav.jpg';

-- 更新文件: 母婴用品_cat08_prod020_好孩子_婴儿车_rjgtbtd4.jpg -> Baby_cat08_prod020_Goodbaby_Stroller_rjgtbtd4.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Baby_cat08_prod020_Goodbaby_Stroller_rjgtbtd4.jpg' WHERE `pic` = '2024/01/母婴用品_cat08_prod020_好孩子_婴儿车_rjgtbtd4.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/母婴用品_cat08_prod020_好孩子_婴儿车_rjgtbtd4.jpg', '2024/01/Baby_cat08_prod020_Goodbaby_Stroller_rjgtbtd4.jpg') WHERE `imgs` LIKE '%2024/01/母婴用品_cat08_prod020_好孩子_婴儿车_rjgtbtd4.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/母婴用品_cat08_prod020_好孩子_婴儿车_rjgtbtd4.jpg', '2024/01/Baby_cat08_prod020_Goodbaby_Stroller_rjgtbtd4.jpg') WHERE `content` LIKE '%2024/01/母婴用品_cat08_prod020_好孩子_婴儿车_rjgtbtd4.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Baby_cat08_prod020_Goodbaby_Stroller_rjgtbtd4.jpg' WHERE `pic` = '2024/01/母婴用品_cat08_prod020_好孩子_婴儿车_rjgtbtd4.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Baby_cat08_prod020_Goodbaby_Stroller_rjgtbtd4.jpg' WHERE `img_path` = '2024/01/母婴用品_cat08_prod020_好孩子_婴儿车_rjgtbtd4.jpg';

-- 更新文件: 母婴用品_cat08_prod021_NUK_奶瓶_3j4fkoc6.jpg -> Baby_cat08_prod021_NUK_Bottle_3j4fkoc6.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Baby_cat08_prod021_NUK_Bottle_3j4fkoc6.jpg' WHERE `pic` = '2024/01/母婴用品_cat08_prod021_NUK_奶瓶_3j4fkoc6.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/母婴用品_cat08_prod021_NUK_奶瓶_3j4fkoc6.jpg', '2024/01/Baby_cat08_prod021_NUK_Bottle_3j4fkoc6.jpg') WHERE `imgs` LIKE '%2024/01/母婴用品_cat08_prod021_NUK_奶瓶_3j4fkoc6.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/母婴用品_cat08_prod021_NUK_奶瓶_3j4fkoc6.jpg', '2024/01/Baby_cat08_prod021_NUK_Bottle_3j4fkoc6.jpg') WHERE `content` LIKE '%2024/01/母婴用品_cat08_prod021_NUK_奶瓶_3j4fkoc6.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Baby_cat08_prod021_NUK_Bottle_3j4fkoc6.jpg' WHERE `pic` = '2024/01/母婴用品_cat08_prod021_NUK_奶瓶_3j4fkoc6.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Baby_cat08_prod021_NUK_Bottle_3j4fkoc6.jpg' WHERE `img_path` = '2024/01/母婴用品_cat08_prod021_NUK_奶瓶_3j4fkoc6.jpg';

-- 更新文件: 母婴用品_cat08_prod030_NUK_奶瓶_mz3zfs6b.jpg -> Baby_cat08_prod030_NUK_Bottle_mz3zfs6b.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Baby_cat08_prod030_NUK_Bottle_mz3zfs6b.jpg' WHERE `pic` = '2024/01/母婴用品_cat08_prod030_NUK_奶瓶_mz3zfs6b.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/母婴用品_cat08_prod030_NUK_奶瓶_mz3zfs6b.jpg', '2024/01/Baby_cat08_prod030_NUK_Bottle_mz3zfs6b.jpg') WHERE `imgs` LIKE '%2024/01/母婴用品_cat08_prod030_NUK_奶瓶_mz3zfs6b.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/母婴用品_cat08_prod030_NUK_奶瓶_mz3zfs6b.jpg', '2024/01/Baby_cat08_prod030_NUK_Bottle_mz3zfs6b.jpg') WHERE `content` LIKE '%2024/01/母婴用品_cat08_prod030_NUK_奶瓶_mz3zfs6b.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Baby_cat08_prod030_NUK_Bottle_mz3zfs6b.jpg' WHERE `pic` = '2024/01/母婴用品_cat08_prod030_NUK_奶瓶_mz3zfs6b.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Baby_cat08_prod030_NUK_Bottle_mz3zfs6b.jpg' WHERE `img_path` = '2024/01/母婴用品_cat08_prod030_NUK_奶瓶_mz3zfs6b.jpg';

-- 更新文件: 母婴用品_cat08_prod031_美赞臣_奶粉_veolmxrr.jpg -> Baby_cat08_prod031_MeadJohnson_Formula_veolmxrr.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Baby_cat08_prod031_MeadJohnson_Formula_veolmxrr.jpg' WHERE `pic` = '2024/01/母婴用品_cat08_prod031_美赞臣_奶粉_veolmxrr.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/母婴用品_cat08_prod031_美赞臣_奶粉_veolmxrr.jpg', '2024/01/Baby_cat08_prod031_MeadJohnson_Formula_veolmxrr.jpg') WHERE `imgs` LIKE '%2024/01/母婴用品_cat08_prod031_美赞臣_奶粉_veolmxrr.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/母婴用品_cat08_prod031_美赞臣_奶粉_veolmxrr.jpg', '2024/01/Baby_cat08_prod031_MeadJohnson_Formula_veolmxrr.jpg') WHERE `content` LIKE '%2024/01/母婴用品_cat08_prod031_美赞臣_奶粉_veolmxrr.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Baby_cat08_prod031_MeadJohnson_Formula_veolmxrr.jpg' WHERE `pic` = '2024/01/母婴用品_cat08_prod031_美赞臣_奶粉_veolmxrr.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Baby_cat08_prod031_MeadJohnson_Formula_veolmxrr.jpg' WHERE `img_path` = '2024/01/母婴用品_cat08_prod031_美赞臣_奶粉_veolmxrr.jpg';

-- 更新文件: 母婴用品_cat08_prod040_美赞臣_奶粉_6sce8aud.jpg -> Baby_cat08_prod040_MeadJohnson_Formula_6sce8aud.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Baby_cat08_prod040_MeadJohnson_Formula_6sce8aud.jpg' WHERE `pic` = '2024/01/母婴用品_cat08_prod040_美赞臣_奶粉_6sce8aud.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/母婴用品_cat08_prod040_美赞臣_奶粉_6sce8aud.jpg', '2024/01/Baby_cat08_prod040_MeadJohnson_Formula_6sce8aud.jpg') WHERE `imgs` LIKE '%2024/01/母婴用品_cat08_prod040_美赞臣_奶粉_6sce8aud.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/母婴用品_cat08_prod040_美赞臣_奶粉_6sce8aud.jpg', '2024/01/Baby_cat08_prod040_MeadJohnson_Formula_6sce8aud.jpg') WHERE `content` LIKE '%2024/01/母婴用品_cat08_prod040_美赞臣_奶粉_6sce8aud.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Baby_cat08_prod040_MeadJohnson_Formula_6sce8aud.jpg' WHERE `pic` = '2024/01/母婴用品_cat08_prod040_美赞臣_奶粉_6sce8aud.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Baby_cat08_prod040_MeadJohnson_Formula_6sce8aud.jpg' WHERE `img_path` = '2024/01/母婴用品_cat08_prod040_美赞臣_奶粉_6sce8aud.jpg';

-- 更新文件: 母婴用品_cat08_prod041_费雪_玩具_a8stbsg8.jpg -> Baby_cat08_prod041_FisherPrice_Toy_a8stbsg8.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Baby_cat08_prod041_FisherPrice_Toy_a8stbsg8.jpg' WHERE `pic` = '2024/01/母婴用品_cat08_prod041_费雪_玩具_a8stbsg8.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/母婴用品_cat08_prod041_费雪_玩具_a8stbsg8.jpg', '2024/01/Baby_cat08_prod041_FisherPrice_Toy_a8stbsg8.jpg') WHERE `imgs` LIKE '%2024/01/母婴用品_cat08_prod041_费雪_玩具_a8stbsg8.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/母婴用品_cat08_prod041_费雪_玩具_a8stbsg8.jpg', '2024/01/Baby_cat08_prod041_FisherPrice_Toy_a8stbsg8.jpg') WHERE `content` LIKE '%2024/01/母婴用品_cat08_prod041_费雪_玩具_a8stbsg8.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Baby_cat08_prod041_FisherPrice_Toy_a8stbsg8.jpg' WHERE `pic` = '2024/01/母婴用品_cat08_prod041_费雪_玩具_a8stbsg8.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Baby_cat08_prod041_FisherPrice_Toy_a8stbsg8.jpg' WHERE `img_path` = '2024/01/母婴用品_cat08_prod041_费雪_玩具_a8stbsg8.jpg';

-- 更新文件: 汽车用品_cat09_prod001_3M_汽车贴膜_h2jsnsv1.jpg -> Auto_cat09_prod001_3M_CarFilm_h2jsnsv1.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Auto_cat09_prod001_3M_CarFilm_h2jsnsv1.jpg' WHERE `pic` = '2024/01/汽车用品_cat09_prod001_3M_汽车贴膜_h2jsnsv1.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/汽车用品_cat09_prod001_3M_汽车贴膜_h2jsnsv1.jpg', '2024/01/Auto_cat09_prod001_3M_CarFilm_h2jsnsv1.jpg') WHERE `imgs` LIKE '%2024/01/汽车用品_cat09_prod001_3M_汽车贴膜_h2jsnsv1.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/汽车用品_cat09_prod001_3M_汽车贴膜_h2jsnsv1.jpg', '2024/01/Auto_cat09_prod001_3M_CarFilm_h2jsnsv1.jpg') WHERE `content` LIKE '%2024/01/汽车用品_cat09_prod001_3M_汽车贴膜_h2jsnsv1.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Auto_cat09_prod001_3M_CarFilm_h2jsnsv1.jpg' WHERE `pic` = '2024/01/汽车用品_cat09_prod001_3M_汽车贴膜_h2jsnsv1.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Auto_cat09_prod001_3M_CarFilm_h2jsnsv1.jpg' WHERE `img_path` = '2024/01/汽车用品_cat09_prod001_3M_汽车贴膜_h2jsnsv1.jpg';

-- 更新文件: 汽车用品_cat09_prod002_米其林_轮胎_ujjatl5k.jpg -> Auto_cat09_prod002_Michelin_Tire_ujjatl5k.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Auto_cat09_prod002_Michelin_Tire_ujjatl5k.jpg' WHERE `pic` = '2024/01/汽车用品_cat09_prod002_米其林_轮胎_ujjatl5k.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/汽车用品_cat09_prod002_米其林_轮胎_ujjatl5k.jpg', '2024/01/Auto_cat09_prod002_Michelin_Tire_ujjatl5k.jpg') WHERE `imgs` LIKE '%2024/01/汽车用品_cat09_prod002_米其林_轮胎_ujjatl5k.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/汽车用品_cat09_prod002_米其林_轮胎_ujjatl5k.jpg', '2024/01/Auto_cat09_prod002_Michelin_Tire_ujjatl5k.jpg') WHERE `content` LIKE '%2024/01/汽车用品_cat09_prod002_米其林_轮胎_ujjatl5k.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Auto_cat09_prod002_Michelin_Tire_ujjatl5k.jpg' WHERE `pic` = '2024/01/汽车用品_cat09_prod002_米其林_轮胎_ujjatl5k.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Auto_cat09_prod002_Michelin_Tire_ujjatl5k.jpg' WHERE `img_path` = '2024/01/汽车用品_cat09_prod002_米其林_轮胎_ujjatl5k.jpg';

-- 更新文件: 汽车用品_cat09_prod003_汽车脚垫_5vak0w4h.jpg -> Auto_cat09_prod003_Car_Mat_5vak0w4h.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Auto_cat09_prod003_Car_Mat_5vak0w4h.jpg' WHERE `pic` = '2024/01/汽车用品_cat09_prod003_汽车脚垫_5vak0w4h.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/汽车用品_cat09_prod003_汽车脚垫_5vak0w4h.jpg', '2024/01/Auto_cat09_prod003_Car_Mat_5vak0w4h.jpg') WHERE `imgs` LIKE '%2024/01/汽车用品_cat09_prod003_汽车脚垫_5vak0w4h.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/汽车用品_cat09_prod003_汽车脚垫_5vak0w4h.jpg', '2024/01/Auto_cat09_prod003_Car_Mat_5vak0w4h.jpg') WHERE `content` LIKE '%2024/01/汽车用品_cat09_prod003_汽车脚垫_5vak0w4h.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Auto_cat09_prod003_Car_Mat_5vak0w4h.jpg' WHERE `pic` = '2024/01/汽车用品_cat09_prod003_汽车脚垫_5vak0w4h.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Auto_cat09_prod003_Car_Mat_5vak0w4h.jpg' WHERE `img_path` = '2024/01/汽车用品_cat09_prod003_汽车脚垫_5vak0w4h.jpg';

-- 更新文件: 汽车用品_cat09_prod004_行车记录仪_7ck3avf6.jpg -> Auto_cat09_prod004_Dash_Cam_7ck3avf6.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Auto_cat09_prod004_Dash_Cam_7ck3avf6.jpg' WHERE `pic` = '2024/01/汽车用品_cat09_prod004_行车记录仪_7ck3avf6.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/汽车用品_cat09_prod004_行车记录仪_7ck3avf6.jpg', '2024/01/Auto_cat09_prod004_Dash_Cam_7ck3avf6.jpg') WHERE `imgs` LIKE '%2024/01/汽车用品_cat09_prod004_行车记录仪_7ck3avf6.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/汽车用品_cat09_prod004_行车记录仪_7ck3avf6.jpg', '2024/01/Auto_cat09_prod004_Dash_Cam_7ck3avf6.jpg') WHERE `content` LIKE '%2024/01/汽车用品_cat09_prod004_行车记录仪_7ck3avf6.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Auto_cat09_prod004_Dash_Cam_7ck3avf6.jpg' WHERE `pic` = '2024/01/汽车用品_cat09_prod004_行车记录仪_7ck3avf6.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Auto_cat09_prod004_Dash_Cam_7ck3avf6.jpg' WHERE `img_path` = '2024/01/汽车用品_cat09_prod004_行车记录仪_7ck3avf6.jpg';

-- 更新文件: 汽车用品_cat09_prod005_汽车香水_nagu1e6m.jpg -> Auto_cat09_prod005_Car_Perfume_nagu1e6m.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Auto_cat09_prod005_Car_Perfume_nagu1e6m.jpg' WHERE `pic` = '2024/01/汽车用品_cat09_prod005_汽车香水_nagu1e6m.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/汽车用品_cat09_prod005_汽车香水_nagu1e6m.jpg', '2024/01/Auto_cat09_prod005_Car_Perfume_nagu1e6m.jpg') WHERE `imgs` LIKE '%2024/01/汽车用品_cat09_prod005_汽车香水_nagu1e6m.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/汽车用品_cat09_prod005_汽车香水_nagu1e6m.jpg', '2024/01/Auto_cat09_prod005_Car_Perfume_nagu1e6m.jpg') WHERE `content` LIKE '%2024/01/汽车用品_cat09_prod005_汽车香水_nagu1e6m.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Auto_cat09_prod005_Car_Perfume_nagu1e6m.jpg' WHERE `pic` = '2024/01/汽车用品_cat09_prod005_汽车香水_nagu1e6m.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Auto_cat09_prod005_Car_Perfume_nagu1e6m.jpg' WHERE `img_path` = '2024/01/汽车用品_cat09_prod005_汽车香水_nagu1e6m.jpg';

-- 更新文件: 汽车用品_cat09_prod010_米其林_轮胎_w53vr3ck.jpg -> Auto_cat09_prod010_Michelin_Tire_w53vr3ck.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Auto_cat09_prod010_Michelin_Tire_w53vr3ck.jpg' WHERE `pic` = '2024/01/汽车用品_cat09_prod010_米其林_轮胎_w53vr3ck.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/汽车用品_cat09_prod010_米其林_轮胎_w53vr3ck.jpg', '2024/01/Auto_cat09_prod010_Michelin_Tire_w53vr3ck.jpg') WHERE `imgs` LIKE '%2024/01/汽车用品_cat09_prod010_米其林_轮胎_w53vr3ck.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/汽车用品_cat09_prod010_米其林_轮胎_w53vr3ck.jpg', '2024/01/Auto_cat09_prod010_Michelin_Tire_w53vr3ck.jpg') WHERE `content` LIKE '%2024/01/汽车用品_cat09_prod010_米其林_轮胎_w53vr3ck.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Auto_cat09_prod010_Michelin_Tire_w53vr3ck.jpg' WHERE `pic` = '2024/01/汽车用品_cat09_prod010_米其林_轮胎_w53vr3ck.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Auto_cat09_prod010_Michelin_Tire_w53vr3ck.jpg' WHERE `img_path` = '2024/01/汽车用品_cat09_prod010_米其林_轮胎_w53vr3ck.jpg';

-- 更新文件: 汽车用品_cat09_prod011_汽车脚垫_n6g0528a.jpg -> Auto_cat09_prod011_Car_Mat_n6g0528a.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Auto_cat09_prod011_Car_Mat_n6g0528a.jpg' WHERE `pic` = '2024/01/汽车用品_cat09_prod011_汽车脚垫_n6g0528a.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/汽车用品_cat09_prod011_汽车脚垫_n6g0528a.jpg', '2024/01/Auto_cat09_prod011_Car_Mat_n6g0528a.jpg') WHERE `imgs` LIKE '%2024/01/汽车用品_cat09_prod011_汽车脚垫_n6g0528a.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/汽车用品_cat09_prod011_汽车脚垫_n6g0528a.jpg', '2024/01/Auto_cat09_prod011_Car_Mat_n6g0528a.jpg') WHERE `content` LIKE '%2024/01/汽车用品_cat09_prod011_汽车脚垫_n6g0528a.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Auto_cat09_prod011_Car_Mat_n6g0528a.jpg' WHERE `pic` = '2024/01/汽车用品_cat09_prod011_汽车脚垫_n6g0528a.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Auto_cat09_prod011_Car_Mat_n6g0528a.jpg' WHERE `img_path` = '2024/01/汽车用品_cat09_prod011_汽车脚垫_n6g0528a.jpg';

-- 更新文件: 汽车用品_cat09_prod020_汽车脚垫_qik6x18e.jpg -> Auto_cat09_prod020_Car_Mat_qik6x18e.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Auto_cat09_prod020_Car_Mat_qik6x18e.jpg' WHERE `pic` = '2024/01/汽车用品_cat09_prod020_汽车脚垫_qik6x18e.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/汽车用品_cat09_prod020_汽车脚垫_qik6x18e.jpg', '2024/01/Auto_cat09_prod020_Car_Mat_qik6x18e.jpg') WHERE `imgs` LIKE '%2024/01/汽车用品_cat09_prod020_汽车脚垫_qik6x18e.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/汽车用品_cat09_prod020_汽车脚垫_qik6x18e.jpg', '2024/01/Auto_cat09_prod020_Car_Mat_qik6x18e.jpg') WHERE `content` LIKE '%2024/01/汽车用品_cat09_prod020_汽车脚垫_qik6x18e.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Auto_cat09_prod020_Car_Mat_qik6x18e.jpg' WHERE `pic` = '2024/01/汽车用品_cat09_prod020_汽车脚垫_qik6x18e.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Auto_cat09_prod020_Car_Mat_qik6x18e.jpg' WHERE `img_path` = '2024/01/汽车用品_cat09_prod020_汽车脚垫_qik6x18e.jpg';

-- 更新文件: 汽车用品_cat09_prod021_行车记录仪_bexg0gld.jpg -> Auto_cat09_prod021_Dash_Cam_bexg0gld.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Auto_cat09_prod021_Dash_Cam_bexg0gld.jpg' WHERE `pic` = '2024/01/汽车用品_cat09_prod021_行车记录仪_bexg0gld.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/汽车用品_cat09_prod021_行车记录仪_bexg0gld.jpg', '2024/01/Auto_cat09_prod021_Dash_Cam_bexg0gld.jpg') WHERE `imgs` LIKE '%2024/01/汽车用品_cat09_prod021_行车记录仪_bexg0gld.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/汽车用品_cat09_prod021_行车记录仪_bexg0gld.jpg', '2024/01/Auto_cat09_prod021_Dash_Cam_bexg0gld.jpg') WHERE `content` LIKE '%2024/01/汽车用品_cat09_prod021_行车记录仪_bexg0gld.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Auto_cat09_prod021_Dash_Cam_bexg0gld.jpg' WHERE `pic` = '2024/01/汽车用品_cat09_prod021_行车记录仪_bexg0gld.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Auto_cat09_prod021_Dash_Cam_bexg0gld.jpg' WHERE `img_path` = '2024/01/汽车用品_cat09_prod021_行车记录仪_bexg0gld.jpg';

-- 更新文件: 汽车用品_cat09_prod030_行车记录仪_y4reho38.jpg -> Auto_cat09_prod030_Dash_Cam_y4reho38.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Auto_cat09_prod030_Dash_Cam_y4reho38.jpg' WHERE `pic` = '2024/01/汽车用品_cat09_prod030_行车记录仪_y4reho38.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/汽车用品_cat09_prod030_行车记录仪_y4reho38.jpg', '2024/01/Auto_cat09_prod030_Dash_Cam_y4reho38.jpg') WHERE `imgs` LIKE '%2024/01/汽车用品_cat09_prod030_行车记录仪_y4reho38.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/汽车用品_cat09_prod030_行车记录仪_y4reho38.jpg', '2024/01/Auto_cat09_prod030_Dash_Cam_y4reho38.jpg') WHERE `content` LIKE '%2024/01/汽车用品_cat09_prod030_行车记录仪_y4reho38.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Auto_cat09_prod030_Dash_Cam_y4reho38.jpg' WHERE `pic` = '2024/01/汽车用品_cat09_prod030_行车记录仪_y4reho38.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Auto_cat09_prod030_Dash_Cam_y4reho38.jpg' WHERE `img_path` = '2024/01/汽车用品_cat09_prod030_行车记录仪_y4reho38.jpg';

-- 更新文件: 汽车用品_cat09_prod031_汽车香水_wduk8f8n.jpg -> Auto_cat09_prod031_Car_Perfume_wduk8f8n.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Auto_cat09_prod031_Car_Perfume_wduk8f8n.jpg' WHERE `pic` = '2024/01/汽车用品_cat09_prod031_汽车香水_wduk8f8n.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/汽车用品_cat09_prod031_汽车香水_wduk8f8n.jpg', '2024/01/Auto_cat09_prod031_Car_Perfume_wduk8f8n.jpg') WHERE `imgs` LIKE '%2024/01/汽车用品_cat09_prod031_汽车香水_wduk8f8n.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/汽车用品_cat09_prod031_汽车香水_wduk8f8n.jpg', '2024/01/Auto_cat09_prod031_Car_Perfume_wduk8f8n.jpg') WHERE `content` LIKE '%2024/01/汽车用品_cat09_prod031_汽车香水_wduk8f8n.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Auto_cat09_prod031_Car_Perfume_wduk8f8n.jpg' WHERE `pic` = '2024/01/汽车用品_cat09_prod031_汽车香水_wduk8f8n.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Auto_cat09_prod031_Car_Perfume_wduk8f8n.jpg' WHERE `img_path` = '2024/01/汽车用品_cat09_prod031_汽车香水_wduk8f8n.jpg';

-- 更新文件: 汽车用品_cat09_prod040_汽车香水_nhp1t4qh.jpg -> Auto_cat09_prod040_Car_Perfume_nhp1t4qh.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Auto_cat09_prod040_Car_Perfume_nhp1t4qh.jpg' WHERE `pic` = '2024/01/汽车用品_cat09_prod040_汽车香水_nhp1t4qh.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/汽车用品_cat09_prod040_汽车香水_nhp1t4qh.jpg', '2024/01/Auto_cat09_prod040_Car_Perfume_nhp1t4qh.jpg') WHERE `imgs` LIKE '%2024/01/汽车用品_cat09_prod040_汽车香水_nhp1t4qh.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/汽车用品_cat09_prod040_汽车香水_nhp1t4qh.jpg', '2024/01/Auto_cat09_prod040_Car_Perfume_nhp1t4qh.jpg') WHERE `content` LIKE '%2024/01/汽车用品_cat09_prod040_汽车香水_nhp1t4qh.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Auto_cat09_prod040_Car_Perfume_nhp1t4qh.jpg' WHERE `pic` = '2024/01/汽车用品_cat09_prod040_汽车香水_nhp1t4qh.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Auto_cat09_prod040_Car_Perfume_nhp1t4qh.jpg' WHERE `img_path` = '2024/01/汽车用品_cat09_prod040_汽车香水_nhp1t4qh.jpg';

-- 更新文件: 汽车用品_cat09_prod041_3M_汽车贴膜_ut3hbjep.jpg -> Auto_cat09_prod041_3M_CarFilm_ut3hbjep.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Auto_cat09_prod041_3M_CarFilm_ut3hbjep.jpg' WHERE `pic` = '2024/01/汽车用品_cat09_prod041_3M_汽车贴膜_ut3hbjep.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/汽车用品_cat09_prod041_3M_汽车贴膜_ut3hbjep.jpg', '2024/01/Auto_cat09_prod041_3M_CarFilm_ut3hbjep.jpg') WHERE `imgs` LIKE '%2024/01/汽车用品_cat09_prod041_3M_汽车贴膜_ut3hbjep.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/汽车用品_cat09_prod041_3M_汽车贴膜_ut3hbjep.jpg', '2024/01/Auto_cat09_prod041_3M_CarFilm_ut3hbjep.jpg') WHERE `content` LIKE '%2024/01/汽车用品_cat09_prod041_3M_汽车贴膜_ut3hbjep.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Auto_cat09_prod041_3M_CarFilm_ut3hbjep.jpg' WHERE `pic` = '2024/01/汽车用品_cat09_prod041_3M_汽车贴膜_ut3hbjep.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Auto_cat09_prod041_3M_CarFilm_ut3hbjep.jpg' WHERE `img_path` = '2024/01/汽车用品_cat09_prod041_3M_汽车贴膜_ut3hbjep.jpg';

-- 更新文件: 汽车用品_cat09_prod050_3M_汽车贴膜_hl8lh66u.jpg -> Auto_cat09_prod050_3M_CarFilm_hl8lh66u.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Auto_cat09_prod050_3M_CarFilm_hl8lh66u.jpg' WHERE `pic` = '2024/01/汽车用品_cat09_prod050_3M_汽车贴膜_hl8lh66u.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/汽车用品_cat09_prod050_3M_汽车贴膜_hl8lh66u.jpg', '2024/01/Auto_cat09_prod050_3M_CarFilm_hl8lh66u.jpg') WHERE `imgs` LIKE '%2024/01/汽车用品_cat09_prod050_3M_汽车贴膜_hl8lh66u.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/汽车用品_cat09_prod050_3M_汽车贴膜_hl8lh66u.jpg', '2024/01/Auto_cat09_prod050_3M_CarFilm_hl8lh66u.jpg') WHERE `content` LIKE '%2024/01/汽车用品_cat09_prod050_3M_汽车贴膜_hl8lh66u.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Auto_cat09_prod050_3M_CarFilm_hl8lh66u.jpg' WHERE `pic` = '2024/01/汽车用品_cat09_prod050_3M_汽车贴膜_hl8lh66u.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Auto_cat09_prod050_3M_CarFilm_hl8lh66u.jpg' WHERE `img_path` = '2024/01/汽车用品_cat09_prod050_3M_汽车贴膜_hl8lh66u.jpg';

-- 更新文件: 汽车用品_cat09_prod051_米其林_轮胎_41n9pb1w.jpg -> Auto_cat09_prod051_Michelin_Tire_41n9pb1w.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Auto_cat09_prod051_Michelin_Tire_41n9pb1w.jpg' WHERE `pic` = '2024/01/汽车用品_cat09_prod051_米其林_轮胎_41n9pb1w.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/汽车用品_cat09_prod051_米其林_轮胎_41n9pb1w.jpg', '2024/01/Auto_cat09_prod051_Michelin_Tire_41n9pb1w.jpg') WHERE `imgs` LIKE '%2024/01/汽车用品_cat09_prod051_米其林_轮胎_41n9pb1w.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/汽车用品_cat09_prod051_米其林_轮胎_41n9pb1w.jpg', '2024/01/Auto_cat09_prod051_Michelin_Tire_41n9pb1w.jpg') WHERE `content` LIKE '%2024/01/汽车用品_cat09_prod051_米其林_轮胎_41n9pb1w.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Auto_cat09_prod051_Michelin_Tire_41n9pb1w.jpg' WHERE `pic` = '2024/01/汽车用品_cat09_prod051_米其林_轮胎_41n9pb1w.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Auto_cat09_prod051_Michelin_Tire_41n9pb1w.jpg' WHERE `img_path` = '2024/01/汽车用品_cat09_prod051_米其林_轮胎_41n9pb1w.jpg';

-- 更新文件: 美味零食_cat04_prod001_费列罗巧克力_awvqty9o.jpg -> Snacks_cat04_prod001_Ferrero_Chocolate_awvqty9o.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Snacks_cat04_prod001_Ferrero_Chocolate_awvqty9o.jpg' WHERE `pic` = '2024/01/美味零食_cat04_prod001_费列罗巧克力_awvqty9o.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/美味零食_cat04_prod001_费列罗巧克力_awvqty9o.jpg', '2024/01/Snacks_cat04_prod001_Ferrero_Chocolate_awvqty9o.jpg') WHERE `imgs` LIKE '%2024/01/美味零食_cat04_prod001_费列罗巧克力_awvqty9o.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/美味零食_cat04_prod001_费列罗巧克力_awvqty9o.jpg', '2024/01/Snacks_cat04_prod001_Ferrero_Chocolate_awvqty9o.jpg') WHERE `content` LIKE '%2024/01/美味零食_cat04_prod001_费列罗巧克力_awvqty9o.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Snacks_cat04_prod001_Ferrero_Chocolate_awvqty9o.jpg' WHERE `pic` = '2024/01/美味零食_cat04_prod001_费列罗巧克力_awvqty9o.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Snacks_cat04_prod001_Ferrero_Chocolate_awvqty9o.jpg' WHERE `img_path` = '2024/01/美味零食_cat04_prod001_费列罗巧克力_awvqty9o.jpg';

-- 更新文件: 美味零食_cat04_prod002_乐事薯片_jkxb0du0.jpg -> Snacks_cat04_prod002_Lays_Chips_jkxb0du0.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Snacks_cat04_prod002_Lays_Chips_jkxb0du0.jpg' WHERE `pic` = '2024/01/美味零食_cat04_prod002_乐事薯片_jkxb0du0.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/美味零食_cat04_prod002_乐事薯片_jkxb0du0.jpg', '2024/01/Snacks_cat04_prod002_Lays_Chips_jkxb0du0.jpg') WHERE `imgs` LIKE '%2024/01/美味零食_cat04_prod002_乐事薯片_jkxb0du0.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/美味零食_cat04_prod002_乐事薯片_jkxb0du0.jpg', '2024/01/Snacks_cat04_prod002_Lays_Chips_jkxb0du0.jpg') WHERE `content` LIKE '%2024/01/美味零食_cat04_prod002_乐事薯片_jkxb0du0.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Snacks_cat04_prod002_Lays_Chips_jkxb0du0.jpg' WHERE `pic` = '2024/01/美味零食_cat04_prod002_乐事薯片_jkxb0du0.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Snacks_cat04_prod002_Lays_Chips_jkxb0du0.jpg' WHERE `img_path` = '2024/01/美味零食_cat04_prod002_乐事薯片_jkxb0du0.jpg';

-- 更新文件: 美味零食_cat04_prod003_奥利奥饼干_3w6gr582.jpg -> Snacks_cat04_prod003_Oreo_Cookies_3w6gr582.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Snacks_cat04_prod003_Oreo_Cookies_3w6gr582.jpg' WHERE `pic` = '2024/01/美味零食_cat04_prod003_奥利奥饼干_3w6gr582.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/美味零食_cat04_prod003_奥利奥饼干_3w6gr582.jpg', '2024/01/Snacks_cat04_prod003_Oreo_Cookies_3w6gr582.jpg') WHERE `imgs` LIKE '%2024/01/美味零食_cat04_prod003_奥利奥饼干_3w6gr582.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/美味零食_cat04_prod003_奥利奥饼干_3w6gr582.jpg', '2024/01/Snacks_cat04_prod003_Oreo_Cookies_3w6gr582.jpg') WHERE `content` LIKE '%2024/01/美味零食_cat04_prod003_奥利奥饼干_3w6gr582.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Snacks_cat04_prod003_Oreo_Cookies_3w6gr582.jpg' WHERE `pic` = '2024/01/美味零食_cat04_prod003_奥利奥饼干_3w6gr582.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Snacks_cat04_prod003_Oreo_Cookies_3w6gr582.jpg' WHERE `img_path` = '2024/01/美味零食_cat04_prod003_奥利奥饼干_3w6gr582.jpg';

-- 更新文件: 美味零食_cat04_prod004_可口可乐_64lspopf.jpg -> Snacks_cat04_prod004_CocaCola_64lspopf.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Snacks_cat04_prod004_CocaCola_64lspopf.jpg' WHERE `pic` = '2024/01/美味零食_cat04_prod004_可口可乐_64lspopf.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/美味零食_cat04_prod004_可口可乐_64lspopf.jpg', '2024/01/Snacks_cat04_prod004_CocaCola_64lspopf.jpg') WHERE `imgs` LIKE '%2024/01/美味零食_cat04_prod004_可口可乐_64lspopf.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/美味零食_cat04_prod004_可口可乐_64lspopf.jpg', '2024/01/Snacks_cat04_prod004_CocaCola_64lspopf.jpg') WHERE `content` LIKE '%2024/01/美味零食_cat04_prod004_可口可乐_64lspopf.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Snacks_cat04_prod004_CocaCola_64lspopf.jpg' WHERE `pic` = '2024/01/美味零食_cat04_prod004_可口可乐_64lspopf.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Snacks_cat04_prod004_CocaCola_64lspopf.jpg' WHERE `img_path` = '2024/01/美味零食_cat04_prod004_可口可乐_64lspopf.jpg';

-- 更新文件: 美味零食_cat04_prod005_三只松鼠坚果_6npe78a9.jpg -> Snacks_cat04_prod005_ThreeSquirrels_Nuts_6npe78a9.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Snacks_cat04_prod005_ThreeSquirrels_Nuts_6npe78a9.jpg' WHERE `pic` = '2024/01/美味零食_cat04_prod005_三只松鼠坚果_6npe78a9.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/美味零食_cat04_prod005_三只松鼠坚果_6npe78a9.jpg', '2024/01/Snacks_cat04_prod005_ThreeSquirrels_Nuts_6npe78a9.jpg') WHERE `imgs` LIKE '%2024/01/美味零食_cat04_prod005_三只松鼠坚果_6npe78a9.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/美味零食_cat04_prod005_三只松鼠坚果_6npe78a9.jpg', '2024/01/Snacks_cat04_prod005_ThreeSquirrels_Nuts_6npe78a9.jpg') WHERE `content` LIKE '%2024/01/美味零食_cat04_prod005_三只松鼠坚果_6npe78a9.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Snacks_cat04_prod005_ThreeSquirrels_Nuts_6npe78a9.jpg' WHERE `pic` = '2024/01/美味零食_cat04_prod005_三只松鼠坚果_6npe78a9.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Snacks_cat04_prod005_ThreeSquirrels_Nuts_6npe78a9.jpg' WHERE `img_path` = '2024/01/美味零食_cat04_prod005_三只松鼠坚果_6npe78a9.jpg';

-- 更新文件: 美味零食_cat04_prod010_乐事薯片_f8lk1l0b.jpg -> Snacks_cat04_prod010_Lays_Chips_f8lk1l0b.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Snacks_cat04_prod010_Lays_Chips_f8lk1l0b.jpg' WHERE `pic` = '2024/01/美味零食_cat04_prod010_乐事薯片_f8lk1l0b.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/美味零食_cat04_prod010_乐事薯片_f8lk1l0b.jpg', '2024/01/Snacks_cat04_prod010_Lays_Chips_f8lk1l0b.jpg') WHERE `imgs` LIKE '%2024/01/美味零食_cat04_prod010_乐事薯片_f8lk1l0b.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/美味零食_cat04_prod010_乐事薯片_f8lk1l0b.jpg', '2024/01/Snacks_cat04_prod010_Lays_Chips_f8lk1l0b.jpg') WHERE `content` LIKE '%2024/01/美味零食_cat04_prod010_乐事薯片_f8lk1l0b.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Snacks_cat04_prod010_Lays_Chips_f8lk1l0b.jpg' WHERE `pic` = '2024/01/美味零食_cat04_prod010_乐事薯片_f8lk1l0b.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Snacks_cat04_prod010_Lays_Chips_f8lk1l0b.jpg' WHERE `img_path` = '2024/01/美味零食_cat04_prod010_乐事薯片_f8lk1l0b.jpg';

-- 更新文件: 美味零食_cat04_prod011_奥利奥饼干_nrrfk0wi.jpg -> Snacks_cat04_prod011_Oreo_Cookies_nrrfk0wi.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Snacks_cat04_prod011_Oreo_Cookies_nrrfk0wi.jpg' WHERE `pic` = '2024/01/美味零食_cat04_prod011_奥利奥饼干_nrrfk0wi.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/美味零食_cat04_prod011_奥利奥饼干_nrrfk0wi.jpg', '2024/01/Snacks_cat04_prod011_Oreo_Cookies_nrrfk0wi.jpg') WHERE `imgs` LIKE '%2024/01/美味零食_cat04_prod011_奥利奥饼干_nrrfk0wi.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/美味零食_cat04_prod011_奥利奥饼干_nrrfk0wi.jpg', '2024/01/Snacks_cat04_prod011_Oreo_Cookies_nrrfk0wi.jpg') WHERE `content` LIKE '%2024/01/美味零食_cat04_prod011_奥利奥饼干_nrrfk0wi.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Snacks_cat04_prod011_Oreo_Cookies_nrrfk0wi.jpg' WHERE `pic` = '2024/01/美味零食_cat04_prod011_奥利奥饼干_nrrfk0wi.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Snacks_cat04_prod011_Oreo_Cookies_nrrfk0wi.jpg' WHERE `img_path` = '2024/01/美味零食_cat04_prod011_奥利奥饼干_nrrfk0wi.jpg';

-- 更新文件: 美味零食_cat04_prod020_奥利奥饼干_e7y2q2nv.jpg -> Snacks_cat04_prod020_Oreo_Cookies_e7y2q2nv.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Snacks_cat04_prod020_Oreo_Cookies_e7y2q2nv.jpg' WHERE `pic` = '2024/01/美味零食_cat04_prod020_奥利奥饼干_e7y2q2nv.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/美味零食_cat04_prod020_奥利奥饼干_e7y2q2nv.jpg', '2024/01/Snacks_cat04_prod020_Oreo_Cookies_e7y2q2nv.jpg') WHERE `imgs` LIKE '%2024/01/美味零食_cat04_prod020_奥利奥饼干_e7y2q2nv.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/美味零食_cat04_prod020_奥利奥饼干_e7y2q2nv.jpg', '2024/01/Snacks_cat04_prod020_Oreo_Cookies_e7y2q2nv.jpg') WHERE `content` LIKE '%2024/01/美味零食_cat04_prod020_奥利奥饼干_e7y2q2nv.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Snacks_cat04_prod020_Oreo_Cookies_e7y2q2nv.jpg' WHERE `pic` = '2024/01/美味零食_cat04_prod020_奥利奥饼干_e7y2q2nv.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Snacks_cat04_prod020_Oreo_Cookies_e7y2q2nv.jpg' WHERE `img_path` = '2024/01/美味零食_cat04_prod020_奥利奥饼干_e7y2q2nv.jpg';

-- 更新文件: 美味零食_cat04_prod021_可口可乐_4g987htl.jpg -> Snacks_cat04_prod021_CocaCola_4g987htl.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Snacks_cat04_prod021_CocaCola_4g987htl.jpg' WHERE `pic` = '2024/01/美味零食_cat04_prod021_可口可乐_4g987htl.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/美味零食_cat04_prod021_可口可乐_4g987htl.jpg', '2024/01/Snacks_cat04_prod021_CocaCola_4g987htl.jpg') WHERE `imgs` LIKE '%2024/01/美味零食_cat04_prod021_可口可乐_4g987htl.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/美味零食_cat04_prod021_可口可乐_4g987htl.jpg', '2024/01/Snacks_cat04_prod021_CocaCola_4g987htl.jpg') WHERE `content` LIKE '%2024/01/美味零食_cat04_prod021_可口可乐_4g987htl.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Snacks_cat04_prod021_CocaCola_4g987htl.jpg' WHERE `pic` = '2024/01/美味零食_cat04_prod021_可口可乐_4g987htl.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Snacks_cat04_prod021_CocaCola_4g987htl.jpg' WHERE `img_path` = '2024/01/美味零食_cat04_prod021_可口可乐_4g987htl.jpg';

-- 更新文件: 美味零食_cat04_prod030_可口可乐_31gjxxkw.jpg -> Snacks_cat04_prod030_CocaCola_31gjxxkw.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Snacks_cat04_prod030_CocaCola_31gjxxkw.jpg' WHERE `pic` = '2024/01/美味零食_cat04_prod030_可口可乐_31gjxxkw.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/美味零食_cat04_prod030_可口可乐_31gjxxkw.jpg', '2024/01/Snacks_cat04_prod030_CocaCola_31gjxxkw.jpg') WHERE `imgs` LIKE '%2024/01/美味零食_cat04_prod030_可口可乐_31gjxxkw.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/美味零食_cat04_prod030_可口可乐_31gjxxkw.jpg', '2024/01/Snacks_cat04_prod030_CocaCola_31gjxxkw.jpg') WHERE `content` LIKE '%2024/01/美味零食_cat04_prod030_可口可乐_31gjxxkw.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Snacks_cat04_prod030_CocaCola_31gjxxkw.jpg' WHERE `pic` = '2024/01/美味零食_cat04_prod030_可口可乐_31gjxxkw.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Snacks_cat04_prod030_CocaCola_31gjxxkw.jpg' WHERE `img_path` = '2024/01/美味零食_cat04_prod030_可口可乐_31gjxxkw.jpg';

-- 更新文件: 美味零食_cat04_prod031_三只松鼠坚果_ypab1bz3.jpg -> Snacks_cat04_prod031_ThreeSquirrels_Nuts_ypab1bz3.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Snacks_cat04_prod031_ThreeSquirrels_Nuts_ypab1bz3.jpg' WHERE `pic` = '2024/01/美味零食_cat04_prod031_三只松鼠坚果_ypab1bz3.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/美味零食_cat04_prod031_三只松鼠坚果_ypab1bz3.jpg', '2024/01/Snacks_cat04_prod031_ThreeSquirrels_Nuts_ypab1bz3.jpg') WHERE `imgs` LIKE '%2024/01/美味零食_cat04_prod031_三只松鼠坚果_ypab1bz3.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/美味零食_cat04_prod031_三只松鼠坚果_ypab1bz3.jpg', '2024/01/Snacks_cat04_prod031_ThreeSquirrels_Nuts_ypab1bz3.jpg') WHERE `content` LIKE '%2024/01/美味零食_cat04_prod031_三只松鼠坚果_ypab1bz3.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Snacks_cat04_prod031_ThreeSquirrels_Nuts_ypab1bz3.jpg' WHERE `pic` = '2024/01/美味零食_cat04_prod031_三只松鼠坚果_ypab1bz3.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Snacks_cat04_prod031_ThreeSquirrels_Nuts_ypab1bz3.jpg' WHERE `img_path` = '2024/01/美味零食_cat04_prod031_三只松鼠坚果_ypab1bz3.jpg';

-- 更新文件: 美味零食_cat04_prod040_三只松鼠坚果_ewlao71f.jpg -> Snacks_cat04_prod040_ThreeSquirrels_Nuts_ewlao71f.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Snacks_cat04_prod040_ThreeSquirrels_Nuts_ewlao71f.jpg' WHERE `pic` = '2024/01/美味零食_cat04_prod040_三只松鼠坚果_ewlao71f.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/美味零食_cat04_prod040_三只松鼠坚果_ewlao71f.jpg', '2024/01/Snacks_cat04_prod040_ThreeSquirrels_Nuts_ewlao71f.jpg') WHERE `imgs` LIKE '%2024/01/美味零食_cat04_prod040_三只松鼠坚果_ewlao71f.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/美味零食_cat04_prod040_三只松鼠坚果_ewlao71f.jpg', '2024/01/Snacks_cat04_prod040_ThreeSquirrels_Nuts_ewlao71f.jpg') WHERE `content` LIKE '%2024/01/美味零食_cat04_prod040_三只松鼠坚果_ewlao71f.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Snacks_cat04_prod040_ThreeSquirrels_Nuts_ewlao71f.jpg' WHERE `pic` = '2024/01/美味零食_cat04_prod040_三只松鼠坚果_ewlao71f.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Snacks_cat04_prod040_ThreeSquirrels_Nuts_ewlao71f.jpg' WHERE `img_path` = '2024/01/美味零食_cat04_prod040_三只松鼠坚果_ewlao71f.jpg';

-- 更新文件: 美味零食_cat04_prod041_费列罗巧克力_fhkbhwjc.jpg -> Snacks_cat04_prod041_Ferrero_Chocolate_fhkbhwjc.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Snacks_cat04_prod041_Ferrero_Chocolate_fhkbhwjc.jpg' WHERE `pic` = '2024/01/美味零食_cat04_prod041_费列罗巧克力_fhkbhwjc.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/美味零食_cat04_prod041_费列罗巧克力_fhkbhwjc.jpg', '2024/01/Snacks_cat04_prod041_Ferrero_Chocolate_fhkbhwjc.jpg') WHERE `imgs` LIKE '%2024/01/美味零食_cat04_prod041_费列罗巧克力_fhkbhwjc.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/美味零食_cat04_prod041_费列罗巧克力_fhkbhwjc.jpg', '2024/01/Snacks_cat04_prod041_Ferrero_Chocolate_fhkbhwjc.jpg') WHERE `content` LIKE '%2024/01/美味零食_cat04_prod041_费列罗巧克力_fhkbhwjc.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Snacks_cat04_prod041_Ferrero_Chocolate_fhkbhwjc.jpg' WHERE `pic` = '2024/01/美味零食_cat04_prod041_费列罗巧克力_fhkbhwjc.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Snacks_cat04_prod041_Ferrero_Chocolate_fhkbhwjc.jpg' WHERE `img_path` = '2024/01/美味零食_cat04_prod041_费列罗巧克力_fhkbhwjc.jpg';

-- 更新文件: 美味零食_cat04_prod050_费列罗巧克力_wt631g7b.jpg -> Snacks_cat04_prod050_Ferrero_Chocolate_wt631g7b.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Snacks_cat04_prod050_Ferrero_Chocolate_wt631g7b.jpg' WHERE `pic` = '2024/01/美味零食_cat04_prod050_费列罗巧克力_wt631g7b.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/美味零食_cat04_prod050_费列罗巧克力_wt631g7b.jpg', '2024/01/Snacks_cat04_prod050_Ferrero_Chocolate_wt631g7b.jpg') WHERE `imgs` LIKE '%2024/01/美味零食_cat04_prod050_费列罗巧克力_wt631g7b.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/美味零食_cat04_prod050_费列罗巧克力_wt631g7b.jpg', '2024/01/Snacks_cat04_prod050_Ferrero_Chocolate_wt631g7b.jpg') WHERE `content` LIKE '%2024/01/美味零食_cat04_prod050_费列罗巧克力_wt631g7b.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Snacks_cat04_prod050_Ferrero_Chocolate_wt631g7b.jpg' WHERE `pic` = '2024/01/美味零食_cat04_prod050_费列罗巧克力_wt631g7b.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Snacks_cat04_prod050_Ferrero_Chocolate_wt631g7b.jpg' WHERE `img_path` = '2024/01/美味零食_cat04_prod050_费列罗巧克力_wt631g7b.jpg';

-- 更新文件: 美味零食_cat04_prod051_乐事薯片_ed5q8y4c.jpg -> Snacks_cat04_prod051_Lays_Chips_ed5q8y4c.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Snacks_cat04_prod051_Lays_Chips_ed5q8y4c.jpg' WHERE `pic` = '2024/01/美味零食_cat04_prod051_乐事薯片_ed5q8y4c.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/美味零食_cat04_prod051_乐事薯片_ed5q8y4c.jpg', '2024/01/Snacks_cat04_prod051_Lays_Chips_ed5q8y4c.jpg') WHERE `imgs` LIKE '%2024/01/美味零食_cat04_prod051_乐事薯片_ed5q8y4c.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/美味零食_cat04_prod051_乐事薯片_ed5q8y4c.jpg', '2024/01/Snacks_cat04_prod051_Lays_Chips_ed5q8y4c.jpg') WHERE `content` LIKE '%2024/01/美味零食_cat04_prod051_乐事薯片_ed5q8y4c.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Snacks_cat04_prod051_Lays_Chips_ed5q8y4c.jpg' WHERE `pic` = '2024/01/美味零食_cat04_prod051_乐事薯片_ed5q8y4c.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Snacks_cat04_prod051_Lays_Chips_ed5q8y4c.jpg' WHERE `img_path` = '2024/01/美味零食_cat04_prod051_乐事薯片_ed5q8y4c.jpg';

-- 更新文件: 美妆护肤_cat02_prod001_Dior_口红_rfgmdvu6.jpg -> Cosmetics_cat02_prod001_Dior_Lipstick_rfgmdvu6.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Cosmetics_cat02_prod001_Dior_Lipstick_rfgmdvu6.jpg' WHERE `pic` = '2024/01/美妆护肤_cat02_prod001_Dior_口红_rfgmdvu6.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/美妆护肤_cat02_prod001_Dior_口红_rfgmdvu6.jpg', '2024/01/Cosmetics_cat02_prod001_Dior_Lipstick_rfgmdvu6.jpg') WHERE `imgs` LIKE '%2024/01/美妆护肤_cat02_prod001_Dior_口红_rfgmdvu6.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/美妆护肤_cat02_prod001_Dior_口红_rfgmdvu6.jpg', '2024/01/Cosmetics_cat02_prod001_Dior_Lipstick_rfgmdvu6.jpg') WHERE `content` LIKE '%2024/01/美妆护肤_cat02_prod001_Dior_口红_rfgmdvu6.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Cosmetics_cat02_prod001_Dior_Lipstick_rfgmdvu6.jpg' WHERE `pic` = '2024/01/美妆护肤_cat02_prod001_Dior_口红_rfgmdvu6.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Cosmetics_cat02_prod001_Dior_Lipstick_rfgmdvu6.jpg' WHERE `img_path` = '2024/01/美妆护肤_cat02_prod001_Dior_口红_rfgmdvu6.jpg';

-- 更新文件: 美妆护肤_cat02_prod002_Chanel_香水_4110q2vw.jpg -> Cosmetics_cat02_prod002_Chanel_Perfume_4110q2vw.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Cosmetics_cat02_prod002_Chanel_Perfume_4110q2vw.jpg' WHERE `pic` = '2024/01/美妆护肤_cat02_prod002_Chanel_香水_4110q2vw.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/美妆护肤_cat02_prod002_Chanel_香水_4110q2vw.jpg', '2024/01/Cosmetics_cat02_prod002_Chanel_Perfume_4110q2vw.jpg') WHERE `imgs` LIKE '%2024/01/美妆护肤_cat02_prod002_Chanel_香水_4110q2vw.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/美妆护肤_cat02_prod002_Chanel_香水_4110q2vw.jpg', '2024/01/Cosmetics_cat02_prod002_Chanel_Perfume_4110q2vw.jpg') WHERE `content` LIKE '%2024/01/美妆护肤_cat02_prod002_Chanel_香水_4110q2vw.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Cosmetics_cat02_prod002_Chanel_Perfume_4110q2vw.jpg' WHERE `pic` = '2024/01/美妆护肤_cat02_prod002_Chanel_香水_4110q2vw.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Cosmetics_cat02_prod002_Chanel_Perfume_4110q2vw.jpg' WHERE `img_path` = '2024/01/美妆护肤_cat02_prod002_Chanel_香水_4110q2vw.jpg';

-- 更新文件: 美妆护肤_cat02_prod003_SK-II_神仙水_kywwa4p9.jpg -> Cosmetics_cat02_prod003_SKII_Essence_kywwa4p9.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Cosmetics_cat02_prod003_SKII_Essence_kywwa4p9.jpg' WHERE `pic` = '2024/01/美妆护肤_cat02_prod003_SK-II_神仙水_kywwa4p9.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/美妆护肤_cat02_prod003_SK-II_神仙水_kywwa4p9.jpg', '2024/01/Cosmetics_cat02_prod003_SKII_Essence_kywwa4p9.jpg') WHERE `imgs` LIKE '%2024/01/美妆护肤_cat02_prod003_SK-II_神仙水_kywwa4p9.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/美妆护肤_cat02_prod003_SK-II_神仙水_kywwa4p9.jpg', '2024/01/Cosmetics_cat02_prod003_SKII_Essence_kywwa4p9.jpg') WHERE `content` LIKE '%2024/01/美妆护肤_cat02_prod003_SK-II_神仙水_kywwa4p9.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Cosmetics_cat02_prod003_SKII_Essence_kywwa4p9.jpg' WHERE `pic` = '2024/01/美妆护肤_cat02_prod003_SK-II_神仙水_kywwa4p9.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Cosmetics_cat02_prod003_SKII_Essence_kywwa4p9.jpg' WHERE `img_path` = '2024/01/美妆护肤_cat02_prod003_SK-II_神仙水_kywwa4p9.jpg';

-- 更新文件: 美妆护肤_cat02_prod004_LOreal_粉底_14r751xy.jpg -> Cosmetics_cat02_prod004_LOreal_Foundation_14r751xy.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Cosmetics_cat02_prod004_LOreal_Foundation_14r751xy.jpg' WHERE `pic` = '2024/01/美妆护肤_cat02_prod004_LOreal_粉底_14r751xy.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/美妆护肤_cat02_prod004_LOreal_粉底_14r751xy.jpg', '2024/01/Cosmetics_cat02_prod004_LOreal_Foundation_14r751xy.jpg') WHERE `imgs` LIKE '%2024/01/美妆护肤_cat02_prod004_LOreal_粉底_14r751xy.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/美妆护肤_cat02_prod004_LOreal_粉底_14r751xy.jpg', '2024/01/Cosmetics_cat02_prod004_LOreal_Foundation_14r751xy.jpg') WHERE `content` LIKE '%2024/01/美妆护肤_cat02_prod004_LOreal_粉底_14r751xy.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Cosmetics_cat02_prod004_LOreal_Foundation_14r751xy.jpg' WHERE `pic` = '2024/01/美妆护肤_cat02_prod004_LOreal_粉底_14r751xy.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Cosmetics_cat02_prod004_LOreal_Foundation_14r751xy.jpg' WHERE `img_path` = '2024/01/美妆护肤_cat02_prod004_LOreal_粉底_14r751xy.jpg';

-- 更新文件: 美妆护肤_cat02_prod010_Chanel_香水_8e99l99g.jpg -> Cosmetics_cat02_prod010_Chanel_Perfume_8e99l99g.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Cosmetics_cat02_prod010_Chanel_Perfume_8e99l99g.jpg' WHERE `pic` = '2024/01/美妆护肤_cat02_prod010_Chanel_香水_8e99l99g.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/美妆护肤_cat02_prod010_Chanel_香水_8e99l99g.jpg', '2024/01/Cosmetics_cat02_prod010_Chanel_Perfume_8e99l99g.jpg') WHERE `imgs` LIKE '%2024/01/美妆护肤_cat02_prod010_Chanel_香水_8e99l99g.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/美妆护肤_cat02_prod010_Chanel_香水_8e99l99g.jpg', '2024/01/Cosmetics_cat02_prod010_Chanel_Perfume_8e99l99g.jpg') WHERE `content` LIKE '%2024/01/美妆护肤_cat02_prod010_Chanel_香水_8e99l99g.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Cosmetics_cat02_prod010_Chanel_Perfume_8e99l99g.jpg' WHERE `pic` = '2024/01/美妆护肤_cat02_prod010_Chanel_香水_8e99l99g.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Cosmetics_cat02_prod010_Chanel_Perfume_8e99l99g.jpg' WHERE `img_path` = '2024/01/美妆护肤_cat02_prod010_Chanel_香水_8e99l99g.jpg';

-- 更新文件: 美妆护肤_cat02_prod011_SK-II_神仙水_58fsm02n.jpg -> Cosmetics_cat02_prod011_SKII_Essence_58fsm02n.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Cosmetics_cat02_prod011_SKII_Essence_58fsm02n.jpg' WHERE `pic` = '2024/01/美妆护肤_cat02_prod011_SK-II_神仙水_58fsm02n.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/美妆护肤_cat02_prod011_SK-II_神仙水_58fsm02n.jpg', '2024/01/Cosmetics_cat02_prod011_SKII_Essence_58fsm02n.jpg') WHERE `imgs` LIKE '%2024/01/美妆护肤_cat02_prod011_SK-II_神仙水_58fsm02n.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/美妆护肤_cat02_prod011_SK-II_神仙水_58fsm02n.jpg', '2024/01/Cosmetics_cat02_prod011_SKII_Essence_58fsm02n.jpg') WHERE `content` LIKE '%2024/01/美妆护肤_cat02_prod011_SK-II_神仙水_58fsm02n.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Cosmetics_cat02_prod011_SKII_Essence_58fsm02n.jpg' WHERE `pic` = '2024/01/美妆护肤_cat02_prod011_SK-II_神仙水_58fsm02n.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Cosmetics_cat02_prod011_SKII_Essence_58fsm02n.jpg' WHERE `img_path` = '2024/01/美妆护肤_cat02_prod011_SK-II_神仙水_58fsm02n.jpg';

-- 更新文件: 美妆护肤_cat02_prod020_SK-II_神仙水_992u2vec.jpg -> Cosmetics_cat02_prod020_SKII_Essence_992u2vec.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Cosmetics_cat02_prod020_SKII_Essence_992u2vec.jpg' WHERE `pic` = '2024/01/美妆护肤_cat02_prod020_SK-II_神仙水_992u2vec.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/美妆护肤_cat02_prod020_SK-II_神仙水_992u2vec.jpg', '2024/01/Cosmetics_cat02_prod020_SKII_Essence_992u2vec.jpg') WHERE `imgs` LIKE '%2024/01/美妆护肤_cat02_prod020_SK-II_神仙水_992u2vec.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/美妆护肤_cat02_prod020_SK-II_神仙水_992u2vec.jpg', '2024/01/Cosmetics_cat02_prod020_SKII_Essence_992u2vec.jpg') WHERE `content` LIKE '%2024/01/美妆护肤_cat02_prod020_SK-II_神仙水_992u2vec.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Cosmetics_cat02_prod020_SKII_Essence_992u2vec.jpg' WHERE `pic` = '2024/01/美妆护肤_cat02_prod020_SK-II_神仙水_992u2vec.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Cosmetics_cat02_prod020_SKII_Essence_992u2vec.jpg' WHERE `img_path` = '2024/01/美妆护肤_cat02_prod020_SK-II_神仙水_992u2vec.jpg';

-- 更新文件: 美妆护肤_cat02_prod021_LOreal_粉底_fuma3aw7.jpg -> Cosmetics_cat02_prod021_LOreal_Foundation_fuma3aw7.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Cosmetics_cat02_prod021_LOreal_Foundation_fuma3aw7.jpg' WHERE `pic` = '2024/01/美妆护肤_cat02_prod021_LOreal_粉底_fuma3aw7.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/美妆护肤_cat02_prod021_LOreal_粉底_fuma3aw7.jpg', '2024/01/Cosmetics_cat02_prod021_LOreal_Foundation_fuma3aw7.jpg') WHERE `imgs` LIKE '%2024/01/美妆护肤_cat02_prod021_LOreal_粉底_fuma3aw7.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/美妆护肤_cat02_prod021_LOreal_粉底_fuma3aw7.jpg', '2024/01/Cosmetics_cat02_prod021_LOreal_Foundation_fuma3aw7.jpg') WHERE `content` LIKE '%2024/01/美妆护肤_cat02_prod021_LOreal_粉底_fuma3aw7.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Cosmetics_cat02_prod021_LOreal_Foundation_fuma3aw7.jpg' WHERE `pic` = '2024/01/美妆护肤_cat02_prod021_LOreal_粉底_fuma3aw7.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Cosmetics_cat02_prod021_LOreal_Foundation_fuma3aw7.jpg' WHERE `img_path` = '2024/01/美妆护肤_cat02_prod021_LOreal_粉底_fuma3aw7.jpg';

-- 更新文件: 美妆护肤_cat02_prod030_LOreal_粉底_15h6olra.jpg -> Cosmetics_cat02_prod030_LOreal_Foundation_15h6olra.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Cosmetics_cat02_prod030_LOreal_Foundation_15h6olra.jpg' WHERE `pic` = '2024/01/美妆护肤_cat02_prod030_LOreal_粉底_15h6olra.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/美妆护肤_cat02_prod030_LOreal_粉底_15h6olra.jpg', '2024/01/Cosmetics_cat02_prod030_LOreal_Foundation_15h6olra.jpg') WHERE `imgs` LIKE '%2024/01/美妆护肤_cat02_prod030_LOreal_粉底_15h6olra.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/美妆护肤_cat02_prod030_LOreal_粉底_15h6olra.jpg', '2024/01/Cosmetics_cat02_prod030_LOreal_Foundation_15h6olra.jpg') WHERE `content` LIKE '%2024/01/美妆护肤_cat02_prod030_LOreal_粉底_15h6olra.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Cosmetics_cat02_prod030_LOreal_Foundation_15h6olra.jpg' WHERE `pic` = '2024/01/美妆护肤_cat02_prod030_LOreal_粉底_15h6olra.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Cosmetics_cat02_prod030_LOreal_Foundation_15h6olra.jpg' WHERE `img_path` = '2024/01/美妆护肤_cat02_prod030_LOreal_粉底_15h6olra.jpg';

-- 更新文件: 美妆护肤_cat02_prod031_Dior_口红_97ieymi1.jpg -> Cosmetics_cat02_prod031_Dior_Lipstick_97ieymi1.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Cosmetics_cat02_prod031_Dior_Lipstick_97ieymi1.jpg' WHERE `pic` = '2024/01/美妆护肤_cat02_prod031_Dior_口红_97ieymi1.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/美妆护肤_cat02_prod031_Dior_口红_97ieymi1.jpg', '2024/01/Cosmetics_cat02_prod031_Dior_Lipstick_97ieymi1.jpg') WHERE `imgs` LIKE '%2024/01/美妆护肤_cat02_prod031_Dior_口红_97ieymi1.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/美妆护肤_cat02_prod031_Dior_口红_97ieymi1.jpg', '2024/01/Cosmetics_cat02_prod031_Dior_Lipstick_97ieymi1.jpg') WHERE `content` LIKE '%2024/01/美妆护肤_cat02_prod031_Dior_口红_97ieymi1.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Cosmetics_cat02_prod031_Dior_Lipstick_97ieymi1.jpg' WHERE `pic` = '2024/01/美妆护肤_cat02_prod031_Dior_口红_97ieymi1.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Cosmetics_cat02_prod031_Dior_Lipstick_97ieymi1.jpg' WHERE `img_path` = '2024/01/美妆护肤_cat02_prod031_Dior_口红_97ieymi1.jpg';

-- 更新文件: 美妆护肤_cat02_prod040_Dior_口红_7jbtudtv.jpg -> Cosmetics_cat02_prod040_Dior_Lipstick_7jbtudtv.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Cosmetics_cat02_prod040_Dior_Lipstick_7jbtudtv.jpg' WHERE `pic` = '2024/01/美妆护肤_cat02_prod040_Dior_口红_7jbtudtv.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/美妆护肤_cat02_prod040_Dior_口红_7jbtudtv.jpg', '2024/01/Cosmetics_cat02_prod040_Dior_Lipstick_7jbtudtv.jpg') WHERE `imgs` LIKE '%2024/01/美妆护肤_cat02_prod040_Dior_口红_7jbtudtv.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/美妆护肤_cat02_prod040_Dior_口红_7jbtudtv.jpg', '2024/01/Cosmetics_cat02_prod040_Dior_Lipstick_7jbtudtv.jpg') WHERE `content` LIKE '%2024/01/美妆护肤_cat02_prod040_Dior_口红_7jbtudtv.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Cosmetics_cat02_prod040_Dior_Lipstick_7jbtudtv.jpg' WHERE `pic` = '2024/01/美妆护肤_cat02_prod040_Dior_口红_7jbtudtv.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Cosmetics_cat02_prod040_Dior_Lipstick_7jbtudtv.jpg' WHERE `img_path` = '2024/01/美妆护肤_cat02_prod040_Dior_口红_7jbtudtv.jpg';

-- 更新文件: 美妆护肤_cat02_prod041_Chanel_香水_k8lhrwg5.jpg -> Cosmetics_cat02_prod041_Chanel_Perfume_k8lhrwg5.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Cosmetics_cat02_prod041_Chanel_Perfume_k8lhrwg5.jpg' WHERE `pic` = '2024/01/美妆护肤_cat02_prod041_Chanel_香水_k8lhrwg5.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/美妆护肤_cat02_prod041_Chanel_香水_k8lhrwg5.jpg', '2024/01/Cosmetics_cat02_prod041_Chanel_Perfume_k8lhrwg5.jpg') WHERE `imgs` LIKE '%2024/01/美妆护肤_cat02_prod041_Chanel_香水_k8lhrwg5.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/美妆护肤_cat02_prod041_Chanel_香水_k8lhrwg5.jpg', '2024/01/Cosmetics_cat02_prod041_Chanel_Perfume_k8lhrwg5.jpg') WHERE `content` LIKE '%2024/01/美妆护肤_cat02_prod041_Chanel_香水_k8lhrwg5.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Cosmetics_cat02_prod041_Chanel_Perfume_k8lhrwg5.jpg' WHERE `pic` = '2024/01/美妆护肤_cat02_prod041_Chanel_香水_k8lhrwg5.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Cosmetics_cat02_prod041_Chanel_Perfume_k8lhrwg5.jpg' WHERE `img_path` = '2024/01/美妆护肤_cat02_prod041_Chanel_香水_k8lhrwg5.jpg';

-- 更新文件: 运动服饰_cat03_prod001_Nike_Air_Max_psujsdav.jpg -> Sports_cat03_prod001_Nike_Air_Max_psujsdav.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Sports_cat03_prod001_Nike_Air_Max_psujsdav.jpg' WHERE `pic` = '2024/01/运动服饰_cat03_prod001_Nike_Air_Max_psujsdav.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/运动服饰_cat03_prod001_Nike_Air_Max_psujsdav.jpg', '2024/01/Sports_cat03_prod001_Nike_Air_Max_psujsdav.jpg') WHERE `imgs` LIKE '%2024/01/运动服饰_cat03_prod001_Nike_Air_Max_psujsdav.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/运动服饰_cat03_prod001_Nike_Air_Max_psujsdav.jpg', '2024/01/Sports_cat03_prod001_Nike_Air_Max_psujsdav.jpg') WHERE `content` LIKE '%2024/01/运动服饰_cat03_prod001_Nike_Air_Max_psujsdav.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Sports_cat03_prod001_Nike_Air_Max_psujsdav.jpg' WHERE `pic` = '2024/01/运动服饰_cat03_prod001_Nike_Air_Max_psujsdav.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Sports_cat03_prod001_Nike_Air_Max_psujsdav.jpg' WHERE `img_path` = '2024/01/运动服饰_cat03_prod001_Nike_Air_Max_psujsdav.jpg';

-- 更新文件: 运动服饰_cat03_prod002_Adidas_运动服_b1cnt9ct.jpg -> Sports_cat03_prod002_Adidas_Sportswear_b1cnt9ct.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Sports_cat03_prod002_Adidas_Sportswear_b1cnt9ct.jpg' WHERE `pic` = '2024/01/运动服饰_cat03_prod002_Adidas_运动服_b1cnt9ct.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/运动服饰_cat03_prod002_Adidas_运动服_b1cnt9ct.jpg', '2024/01/Sports_cat03_prod002_Adidas_Sportswear_b1cnt9ct.jpg') WHERE `imgs` LIKE '%2024/01/运动服饰_cat03_prod002_Adidas_运动服_b1cnt9ct.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/运动服饰_cat03_prod002_Adidas_运动服_b1cnt9ct.jpg', '2024/01/Sports_cat03_prod002_Adidas_Sportswear_b1cnt9ct.jpg') WHERE `content` LIKE '%2024/01/运动服饰_cat03_prod002_Adidas_运动服_b1cnt9ct.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Sports_cat03_prod002_Adidas_Sportswear_b1cnt9ct.jpg' WHERE `pic` = '2024/01/运动服饰_cat03_prod002_Adidas_运动服_b1cnt9ct.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Sports_cat03_prod002_Adidas_Sportswear_b1cnt9ct.jpg' WHERE `img_path` = '2024/01/运动服饰_cat03_prod002_Adidas_运动服_b1cnt9ct.jpg';

-- 更新文件: 运动服饰_cat03_prod003_Nike_篮球鞋_q19qylsp.jpg -> Sports_cat03_prod003_Nike_Basketball_q19qylsp.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Sports_cat03_prod003_Nike_Basketball_q19qylsp.jpg' WHERE `pic` = '2024/01/运动服饰_cat03_prod003_Nike_篮球鞋_q19qylsp.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/运动服饰_cat03_prod003_Nike_篮球鞋_q19qylsp.jpg', '2024/01/Sports_cat03_prod003_Nike_Basketball_q19qylsp.jpg') WHERE `imgs` LIKE '%2024/01/运动服饰_cat03_prod003_Nike_篮球鞋_q19qylsp.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/运动服饰_cat03_prod003_Nike_篮球鞋_q19qylsp.jpg', '2024/01/Sports_cat03_prod003_Nike_Basketball_q19qylsp.jpg') WHERE `content` LIKE '%2024/01/运动服饰_cat03_prod003_Nike_篮球鞋_q19qylsp.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Sports_cat03_prod003_Nike_Basketball_q19qylsp.jpg' WHERE `pic` = '2024/01/运动服饰_cat03_prod003_Nike_篮球鞋_q19qylsp.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Sports_cat03_prod003_Nike_Basketball_q19qylsp.jpg' WHERE `img_path` = '2024/01/运动服饰_cat03_prod003_Nike_篮球鞋_q19qylsp.jpg';

-- 更新文件: 运动服饰_cat03_prod004_Yoga_瑜伽垫_ihtgbfn3.jpg -> Sports_cat03_prod004_Yoga_Mat_ihtgbfn3.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Sports_cat03_prod004_Yoga_Mat_ihtgbfn3.jpg' WHERE `pic` = '2024/01/运动服饰_cat03_prod004_Yoga_瑜伽垫_ihtgbfn3.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/运动服饰_cat03_prod004_Yoga_瑜伽垫_ihtgbfn3.jpg', '2024/01/Sports_cat03_prod004_Yoga_Mat_ihtgbfn3.jpg') WHERE `imgs` LIKE '%2024/01/运动服饰_cat03_prod004_Yoga_瑜伽垫_ihtgbfn3.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/运动服饰_cat03_prod004_Yoga_瑜伽垫_ihtgbfn3.jpg', '2024/01/Sports_cat03_prod004_Yoga_Mat_ihtgbfn3.jpg') WHERE `content` LIKE '%2024/01/运动服饰_cat03_prod004_Yoga_瑜伽垫_ihtgbfn3.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Sports_cat03_prod004_Yoga_Mat_ihtgbfn3.jpg' WHERE `pic` = '2024/01/运动服饰_cat03_prod004_Yoga_瑜伽垫_ihtgbfn3.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Sports_cat03_prod004_Yoga_Mat_ihtgbfn3.jpg' WHERE `img_path` = '2024/01/运动服饰_cat03_prod004_Yoga_瑜伽垫_ihtgbfn3.jpg';

-- 更新文件: 运动服饰_cat03_prod010_Adidas_运动服_p2qoph3v.jpg -> Sports_cat03_prod010_Adidas_Sportswear_p2qoph3v.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Sports_cat03_prod010_Adidas_Sportswear_p2qoph3v.jpg' WHERE `pic` = '2024/01/运动服饰_cat03_prod010_Adidas_运动服_p2qoph3v.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/运动服饰_cat03_prod010_Adidas_运动服_p2qoph3v.jpg', '2024/01/Sports_cat03_prod010_Adidas_Sportswear_p2qoph3v.jpg') WHERE `imgs` LIKE '%2024/01/运动服饰_cat03_prod010_Adidas_运动服_p2qoph3v.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/运动服饰_cat03_prod010_Adidas_运动服_p2qoph3v.jpg', '2024/01/Sports_cat03_prod010_Adidas_Sportswear_p2qoph3v.jpg') WHERE `content` LIKE '%2024/01/运动服饰_cat03_prod010_Adidas_运动服_p2qoph3v.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Sports_cat03_prod010_Adidas_Sportswear_p2qoph3v.jpg' WHERE `pic` = '2024/01/运动服饰_cat03_prod010_Adidas_运动服_p2qoph3v.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Sports_cat03_prod010_Adidas_Sportswear_p2qoph3v.jpg' WHERE `img_path` = '2024/01/运动服饰_cat03_prod010_Adidas_运动服_p2qoph3v.jpg';

-- 更新文件: 运动服饰_cat03_prod011_Nike_篮球鞋_povufpxw.jpg -> Sports_cat03_prod011_Nike_Basketball_povufpxw.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Sports_cat03_prod011_Nike_Basketball_povufpxw.jpg' WHERE `pic` = '2024/01/运动服饰_cat03_prod011_Nike_篮球鞋_povufpxw.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/运动服饰_cat03_prod011_Nike_篮球鞋_povufpxw.jpg', '2024/01/Sports_cat03_prod011_Nike_Basketball_povufpxw.jpg') WHERE `imgs` LIKE '%2024/01/运动服饰_cat03_prod011_Nike_篮球鞋_povufpxw.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/运动服饰_cat03_prod011_Nike_篮球鞋_povufpxw.jpg', '2024/01/Sports_cat03_prod011_Nike_Basketball_povufpxw.jpg') WHERE `content` LIKE '%2024/01/运动服饰_cat03_prod011_Nike_篮球鞋_povufpxw.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Sports_cat03_prod011_Nike_Basketball_povufpxw.jpg' WHERE `pic` = '2024/01/运动服饰_cat03_prod011_Nike_篮球鞋_povufpxw.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Sports_cat03_prod011_Nike_Basketball_povufpxw.jpg' WHERE `img_path` = '2024/01/运动服饰_cat03_prod011_Nike_篮球鞋_povufpxw.jpg';

-- 更新文件: 运动服饰_cat03_prod020_Nike_篮球鞋_7gywrusp.jpg -> Sports_cat03_prod020_Nike_Basketball_7gywrusp.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Sports_cat03_prod020_Nike_Basketball_7gywrusp.jpg' WHERE `pic` = '2024/01/运动服饰_cat03_prod020_Nike_篮球鞋_7gywrusp.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/运动服饰_cat03_prod020_Nike_篮球鞋_7gywrusp.jpg', '2024/01/Sports_cat03_prod020_Nike_Basketball_7gywrusp.jpg') WHERE `imgs` LIKE '%2024/01/运动服饰_cat03_prod020_Nike_篮球鞋_7gywrusp.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/运动服饰_cat03_prod020_Nike_篮球鞋_7gywrusp.jpg', '2024/01/Sports_cat03_prod020_Nike_Basketball_7gywrusp.jpg') WHERE `content` LIKE '%2024/01/运动服饰_cat03_prod020_Nike_篮球鞋_7gywrusp.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Sports_cat03_prod020_Nike_Basketball_7gywrusp.jpg' WHERE `pic` = '2024/01/运动服饰_cat03_prod020_Nike_篮球鞋_7gywrusp.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Sports_cat03_prod020_Nike_Basketball_7gywrusp.jpg' WHERE `img_path` = '2024/01/运动服饰_cat03_prod020_Nike_篮球鞋_7gywrusp.jpg';

-- 更新文件: 运动服饰_cat03_prod021_Yoga_瑜伽垫_h5vip33j.jpg -> Sports_cat03_prod021_Yoga_Mat_h5vip33j.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Sports_cat03_prod021_Yoga_Mat_h5vip33j.jpg' WHERE `pic` = '2024/01/运动服饰_cat03_prod021_Yoga_瑜伽垫_h5vip33j.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/运动服饰_cat03_prod021_Yoga_瑜伽垫_h5vip33j.jpg', '2024/01/Sports_cat03_prod021_Yoga_Mat_h5vip33j.jpg') WHERE `imgs` LIKE '%2024/01/运动服饰_cat03_prod021_Yoga_瑜伽垫_h5vip33j.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/运动服饰_cat03_prod021_Yoga_瑜伽垫_h5vip33j.jpg', '2024/01/Sports_cat03_prod021_Yoga_Mat_h5vip33j.jpg') WHERE `content` LIKE '%2024/01/运动服饰_cat03_prod021_Yoga_瑜伽垫_h5vip33j.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Sports_cat03_prod021_Yoga_Mat_h5vip33j.jpg' WHERE `pic` = '2024/01/运动服饰_cat03_prod021_Yoga_瑜伽垫_h5vip33j.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Sports_cat03_prod021_Yoga_Mat_h5vip33j.jpg' WHERE `img_path` = '2024/01/运动服饰_cat03_prod021_Yoga_瑜伽垫_h5vip33j.jpg';

-- 更新文件: 运动服饰_cat03_prod030_Yoga_瑜伽垫_o9iqgaj9.jpg -> Sports_cat03_prod030_Yoga_Mat_o9iqgaj9.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Sports_cat03_prod030_Yoga_Mat_o9iqgaj9.jpg' WHERE `pic` = '2024/01/运动服饰_cat03_prod030_Yoga_瑜伽垫_o9iqgaj9.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/运动服饰_cat03_prod030_Yoga_瑜伽垫_o9iqgaj9.jpg', '2024/01/Sports_cat03_prod030_Yoga_Mat_o9iqgaj9.jpg') WHERE `imgs` LIKE '%2024/01/运动服饰_cat03_prod030_Yoga_瑜伽垫_o9iqgaj9.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/运动服饰_cat03_prod030_Yoga_瑜伽垫_o9iqgaj9.jpg', '2024/01/Sports_cat03_prod030_Yoga_Mat_o9iqgaj9.jpg') WHERE `content` LIKE '%2024/01/运动服饰_cat03_prod030_Yoga_瑜伽垫_o9iqgaj9.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Sports_cat03_prod030_Yoga_Mat_o9iqgaj9.jpg' WHERE `pic` = '2024/01/运动服饰_cat03_prod030_Yoga_瑜伽垫_o9iqgaj9.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Sports_cat03_prod030_Yoga_Mat_o9iqgaj9.jpg' WHERE `img_path` = '2024/01/运动服饰_cat03_prod030_Yoga_瑜伽垫_o9iqgaj9.jpg';

-- 更新文件: 运动服饰_cat03_prod031_Nike_Air_Max_zcf8ohl5.jpg -> Sports_cat03_prod031_Nike_Air_Max_zcf8ohl5.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Sports_cat03_prod031_Nike_Air_Max_zcf8ohl5.jpg' WHERE `pic` = '2024/01/运动服饰_cat03_prod031_Nike_Air_Max_zcf8ohl5.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/运动服饰_cat03_prod031_Nike_Air_Max_zcf8ohl5.jpg', '2024/01/Sports_cat03_prod031_Nike_Air_Max_zcf8ohl5.jpg') WHERE `imgs` LIKE '%2024/01/运动服饰_cat03_prod031_Nike_Air_Max_zcf8ohl5.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/运动服饰_cat03_prod031_Nike_Air_Max_zcf8ohl5.jpg', '2024/01/Sports_cat03_prod031_Nike_Air_Max_zcf8ohl5.jpg') WHERE `content` LIKE '%2024/01/运动服饰_cat03_prod031_Nike_Air_Max_zcf8ohl5.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Sports_cat03_prod031_Nike_Air_Max_zcf8ohl5.jpg' WHERE `pic` = '2024/01/运动服饰_cat03_prod031_Nike_Air_Max_zcf8ohl5.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Sports_cat03_prod031_Nike_Air_Max_zcf8ohl5.jpg' WHERE `img_path` = '2024/01/运动服饰_cat03_prod031_Nike_Air_Max_zcf8ohl5.jpg';

-- 更新文件: 运动服饰_cat03_prod040_Nike_Air_Max_dj82n584.jpg -> Sports_cat03_prod040_Nike_Air_Max_dj82n584.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Sports_cat03_prod040_Nike_Air_Max_dj82n584.jpg' WHERE `pic` = '2024/01/运动服饰_cat03_prod040_Nike_Air_Max_dj82n584.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/运动服饰_cat03_prod040_Nike_Air_Max_dj82n584.jpg', '2024/01/Sports_cat03_prod040_Nike_Air_Max_dj82n584.jpg') WHERE `imgs` LIKE '%2024/01/运动服饰_cat03_prod040_Nike_Air_Max_dj82n584.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/运动服饰_cat03_prod040_Nike_Air_Max_dj82n584.jpg', '2024/01/Sports_cat03_prod040_Nike_Air_Max_dj82n584.jpg') WHERE `content` LIKE '%2024/01/运动服饰_cat03_prod040_Nike_Air_Max_dj82n584.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Sports_cat03_prod040_Nike_Air_Max_dj82n584.jpg' WHERE `pic` = '2024/01/运动服饰_cat03_prod040_Nike_Air_Max_dj82n584.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Sports_cat03_prod040_Nike_Air_Max_dj82n584.jpg' WHERE `img_path` = '2024/01/运动服饰_cat03_prod040_Nike_Air_Max_dj82n584.jpg';

-- 更新文件: 运动服饰_cat03_prod041_Adidas_运动服_glmnwpxg.jpg -> Sports_cat03_prod041_Adidas_Sportswear_glmnwpxg.jpg
UPDATE `tz_prod` SET `pic` = '2024/01/Sports_cat03_prod041_Adidas_Sportswear_glmnwpxg.jpg' WHERE `pic` = '2024/01/运动服饰_cat03_prod041_Adidas_运动服_glmnwpxg.jpg';
UPDATE `tz_prod` SET `imgs` = REPLACE(`imgs`, '2024/01/运动服饰_cat03_prod041_Adidas_运动服_glmnwpxg.jpg', '2024/01/Sports_cat03_prod041_Adidas_Sportswear_glmnwpxg.jpg') WHERE `imgs` LIKE '%2024/01/运动服饰_cat03_prod041_Adidas_运动服_glmnwpxg.jpg%';
UPDATE `tz_prod` SET `content` = REPLACE(`content`, '2024/01/运动服饰_cat03_prod041_Adidas_运动服_glmnwpxg.jpg', '2024/01/Sports_cat03_prod041_Adidas_Sportswear_glmnwpxg.jpg') WHERE `content` LIKE '%2024/01/运动服饰_cat03_prod041_Adidas_运动服_glmnwpxg.jpg%';
UPDATE `tz_sku` SET `pic` = '2024/01/Sports_cat03_prod041_Adidas_Sportswear_glmnwpxg.jpg' WHERE `pic` = '2024/01/运动服饰_cat03_prod041_Adidas_运动服_glmnwpxg.jpg';
UPDATE `tz_prod_img` SET `img_path` = '2024/01/Sports_cat03_prod041_Adidas_Sportswear_glmnwpxg.jpg' WHERE `img_path` = '2024/01/运动服饰_cat03_prod041_Adidas_运动服_glmnwpxg.jpg';


-- 验证更新结果
SELECT COUNT(*) as remaining_chinese_pic FROM tz_prod WHERE pic LIKE '2024/01/%' AND pic REGEXP '[\\u4e00-\\u9fa5]';
SELECT COUNT(*) as remaining_chinese_imgs FROM tz_prod WHERE imgs REGEXP '[\\u4e00-\\u9fa5]';

COMMIT;
