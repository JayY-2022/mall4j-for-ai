#!/bin/bash

# 修复图片路径的脚本
# 这个脚本会更新数据库中的图片路径，使用实际存在的图片文件

set -e

# 加载环境变量
source .env

echo "正在修复图片路径..."

# 执行SQL修复脚本
mysql -h"${MYSQL_HOST}" -P"${MYSQL_PORT}" -u"${MYSQL_USERNAME}" -p"${MYSQL_PASSWORD}" --skip-ssl "${MYSQL_DATABASE}" < db/fix_images.sql

echo "图片路径修复完成！"
echo ""
echo "已更新："
echo "- 3个首页轮播图"
echo "- 7个分类图片"
