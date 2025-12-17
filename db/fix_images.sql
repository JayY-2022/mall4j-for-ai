-- 修复首页轮播图图片路径
-- 使用实际存在的图片文件

UPDATE tz_index_img SET img_url = '2019/04/01c585d96f2b4e2b9693833e859afd49.jpg' WHERE img_id = 2;
UPDATE tz_index_img SET img_url = '2019/04/0bfd73f43d764d20b2f0b92813abdc56.jpg' WHERE img_id = 4;
UPDATE tz_index_img SET img_url = '2019/04/0cabb44de08345e2b5db9c9ea98ef1f3.jpg' WHERE img_id = 5;

-- 修复分类图片路径
UPDATE tz_category SET pic = '2019/04/11175723eae8431cabda164e0e197cb1.jpg' WHERE category_id = 85;
UPDATE tz_category SET pic = '2019/04/16c40e0a9a2c403e8fa64af68f46e330.jpg' WHERE category_id = 87;
UPDATE tz_category SET pic = '2019/04/17ba70d217644839a381df0dc3682b11.jpg' WHERE category_id = 88;
UPDATE tz_category SET pic = '2019/04/1be7d4e321f24c188bb694c50dc37a8e.jpg' WHERE category_id = 93;
UPDATE tz_category SET pic = '2019/04/1cfc26bed5084caaa439ed4e49b41885.jpg' WHERE category_id = 94;
UPDATE tz_category SET pic = '2019/04/20824781b8f24771b12cf273450aaaae.jpg' WHERE category_id = 95;
UPDATE tz_category SET pic = '2019/04/26bf2e07ecbf41b6a67029acb8f22cfc.jpg' WHERE category_id = 96;
