#!/bin/bash
# 导入生产数据到外部数据库

set -e

cd /home/devbox/project/mall4j

echo "=========================================="
echo "导入生产数据到外部数据库"
echo "=========================================="
echo ""

# 加载环境变量
if [ -f .env ]; then
    source .env
    echo "✅ 已加载环境变量"
else
    echo "❌ 未找到 .env 文件"
    exit 1
fi

# 检查数据库连接
echo "🔍 检查数据库连接..."
if ! mysql -h"$MYSQL_HOST" -P"$MYSQL_PORT" -u"$MYSQL_USERNAME" -p"$MYSQL_PASSWORD" --skip-ssl -e "SELECT 1" 2>&1 | grep -v "Using a password" | grep -v "ERROR" > /dev/null 2>&1; then
    echo "❌ 无法连接到数据库"
    exit 1
fi
echo "✅ 数据库连接成功"
echo ""

# 检查当前数据
echo "📊 当前数据统计:"
USER_COUNT=$(mysql -h"$MYSQL_HOST" -P"$MYSQL_PORT" -u"$MYSQL_USERNAME" -p"$MYSQL_PASSWORD" --skip-ssl "$MYSQL_DATABASE" -e "SELECT COUNT(*) FROM tz_user;" 2>&1 | grep -v "Using a password" | grep -v "ERROR" | tail -1)
echo "  用户数量: $USER_COUNT"

ADDR_COUNT=$(mysql -h"$MYSQL_HOST" -P"$MYSQL_PORT" -u"$MYSQL_USERNAME" -p"$MYSQL_PASSWORD" --skip-ssl "$MYSQL_DATABASE" -e "SELECT COUNT(*) FROM tz_user_addr;" 2>&1 | grep -v "Using a password" | grep -v "ERROR" | tail -1)
echo "  地址数量: $ADDR_COUNT"

PRODUCT_COUNT=$(mysql -h"$MYSQL_HOST" -P"$MYSQL_PORT" -u"$MYSQL_USERNAME" -p"$MYSQL_PASSWORD" --skip-ssl "$MYSQL_DATABASE" -e "SELECT COUNT(*) FROM tz_prod;" 2>&1 | grep -v "Using a password" | grep -v "ERROR" | tail -1)
echo "  商品数量: $PRODUCT_COUNT"

ORDER_COUNT=$(mysql -h"$MYSQL_HOST" -P"$MYSQL_PORT" -u"$MYSQL_USERNAME" -p"$MYSQL_PASSWORD" --skip-ssl "$MYSQL_DATABASE" -e "SELECT COUNT(*) FROM tz_order;" 2>&1 | grep -v "Using a password" | grep -v "ERROR" | tail -1)
echo "  订单数量: $ORDER_COUNT"
echo ""

# 导入用户数据
if [ -f "db/insert_20_users.sql" ]; then
    echo "📥 导入用户数据 (insert_20_users.sql)..."
    if [ "$USER_COUNT" -lt "20" ]; then
        mysql -h"$MYSQL_HOST" -P"$MYSQL_PORT" -u"$MYSQL_USERNAME" -p"$MYSQL_PASSWORD" --skip-ssl --default-character-set=utf8mb4 "$MYSQL_DATABASE" < db/insert_20_users.sql 2>&1 | grep -v "Using a password" | grep -E "ERROR|error" || true
        echo "✅ 用户数据导入完成"
    else
        echo "⚠️  用户数据已存在，跳过导入"
    fi
    echo ""
fi

# 导入用户地址数据
if [ -f "db/insert_user_addresses.sql" ]; then
    echo "📥 导入用户地址数据 (insert_user_addresses.sql)..."
    if [ "$ADDR_COUNT" -lt "20" ]; then
        mysql -h"$MYSQL_HOST" -P"$MYSQL_PORT" -u"$MYSQL_USERNAME" -p"$MYSQL_PASSWORD" --skip-ssl --default-character-set=utf8mb4 "$MYSQL_DATABASE" < db/insert_user_addresses.sql 2>&1 | grep -v "Using a password" | grep -E "ERROR|error" || true
        echo "✅ 用户地址数据导入完成"
    else
        echo "⚠️  用户地址数据已存在，跳过导入"
    fi
    echo ""
fi

# 导入商品数据
if [ -f "db/batch_insert_products.sql" ]; then
    echo "📥 导入商品数据 (batch_insert_products.sql)..."
    if [ "$PRODUCT_COUNT" -lt "40" ]; then
        echo "  文件大小: $(du -h db/batch_insert_products.sql | cut -f1)"
        echo "  正在导入，请稍候..."
        mysql -h"$MYSQL_HOST" -P"$MYSQL_PORT" -u"$MYSQL_USERNAME" -p"$MYSQL_PASSWORD" --skip-ssl --default-character-set=utf8mb4 "$MYSQL_DATABASE" < db/batch_insert_products.sql 2>&1 | grep -v "Using a password" | grep -E "ERROR|error" || true
        echo "✅ 商品数据导入完成"
    else
        echo "⚠️  商品数据已存在，跳过导入"
    fi
    echo ""
fi

# 导入订单数据（可选）
if [ -f "db/insert_100_orders.sql" ]; then
    if [ -t 0 ]; then
        read -p "是否导入订单数据（100条订单，文件较大）？(y/N): " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            echo "📥 导入订单数据 (insert_100_orders.sql)..."
            echo "  文件大小: $(du -h db/insert_100_orders.sql | cut -f1)"
            echo "  正在导入，请稍候..."
            mysql -h"$MYSQL_HOST" -P"$MYSQL_PORT" -u"$MYSQL_USERNAME" -p"$MYSQL_PASSWORD" --skip-ssl --default-character-set=utf8mb4 "$MYSQL_DATABASE" < db/insert_100_orders.sql 2>&1 | grep -v "Using a password" | grep -E "ERROR|error" || true
            echo "✅ 订单数据导入完成"
        else
            echo "⚠️  跳过订单数据导入"
        fi
    else
        echo "📥 导入订单数据 (insert_100_orders.sql)..."
        echo "  文件大小: $(du -h db/insert_100_orders.sql | cut -f1)"
        echo "  正在导入，请稍候..."
        mysql -h"$MYSQL_HOST" -P"$MYSQL_PORT" -u"$MYSQL_USERNAME" -p"$MYSQL_PASSWORD" --skip-ssl "$MYSQL_DATABASE" < db/insert_100_orders.sql 2>&1 | grep -v "Using a password" | grep -E "ERROR|error" || true
        echo "✅ 订单数据导入完成"
    fi
    echo ""
fi

# 导入智能客服相关表
if [ -f "db/chatbot_tables.sql" ]; then
    echo "📥 导入智能客服表结构 (chatbot_tables.sql)..."
    mysql -h"$MYSQL_HOST" -P"$MYSQL_PORT" -u"$MYSQL_USERNAME" -p"$MYSQL_PASSWORD" --skip-ssl --default-character-set=utf8mb4 "$MYSQL_DATABASE" < db/chatbot_tables.sql 2>&1 | grep -v "Using a password" | grep -E "ERROR|error" || true
    echo "✅ 智能客服表结构导入完成"
    echo ""
fi

if [ -f "db/chatbot_config_table.sql" ]; then
    echo "📥 导入智能客服配置表 (chatbot_config_table.sql)..."
    mysql -h"$MYSQL_HOST" -P"$MYSQL_PORT" -u"$MYSQL_USERNAME" -p"$MYSQL_PASSWORD" --skip-ssl --default-character-set=utf8mb4 "$MYSQL_DATABASE" < db/chatbot_config_table.sql 2>&1 | grep -v "Using a password" | grep -E "ERROR|error" || true
    echo "✅ 智能客服配置表导入完成"
    echo ""
fi

if [ -f "db/add_chatbot_config_menu.sql" ]; then
    echo "📥 导入智能客服菜单配置 (add_chatbot_config_menu.sql)..."
    mysql -h"$MYSQL_HOST" -P"$MYSQL_PORT" -u"$MYSQL_USERNAME" -p"$MYSQL_PASSWORD" --skip-ssl --default-character-set=utf8mb4 "$MYSQL_DATABASE" < db/add_chatbot_config_menu.sql 2>&1 | grep -v "Using a password" | grep -E "ERROR|error" || true
    echo "✅ 智能客服菜单配置导入完成"
    echo ""
fi

# 导入 MCP 相关表
if [ -f "db/mcp_tables.sql" ]; then
    echo "📥 导入 MCP 表结构 (mcp_tables.sql)..."
    mysql -h"$MYSQL_HOST" -P"$MYSQL_PORT" -u"$MYSQL_USERNAME" -p"$MYSQL_PASSWORD" --skip-ssl --default-character-set=utf8mb4 "$MYSQL_DATABASE" < db/mcp_tables.sql 2>&1 | grep -v "Using a password" | grep -E "ERROR|error" || true
    echo "✅ MCP 表结构导入完成"
    echo ""
fi

# 最终数据统计
echo "📊 导入后数据统计:"
FINAL_USER_COUNT=$(mysql -h"$MYSQL_HOST" -P"$MYSQL_PORT" -u"$MYSQL_USERNAME" -p"$MYSQL_PASSWORD" --skip-ssl "$MYSQL_DATABASE" -e "SELECT COUNT(*) FROM tz_user;" 2>&1 | grep -v "Using a password" | grep -v "ERROR" | tail -1)
echo "  用户数量: $FINAL_USER_COUNT"

FINAL_ADDR_COUNT=$(mysql -h"$MYSQL_HOST" -P"$MYSQL_PORT" -u"$MYSQL_USERNAME" -p"$MYSQL_PASSWORD" --skip-ssl "$MYSQL_DATABASE" -e "SELECT COUNT(*) FROM tz_user_addr;" 2>&1 | grep -v "Using a password" | grep -v "ERROR" | tail -1)
echo "  地址数量: $FINAL_ADDR_COUNT"

FINAL_PRODUCT_COUNT=$(mysql -h"$MYSQL_HOST" -P"$MYSQL_PORT" -u"$MYSQL_USERNAME" -p"$MYSQL_PASSWORD" --skip-ssl "$MYSQL_DATABASE" -e "SELECT COUNT(*) FROM tz_prod;" 2>&1 | grep -v "Using a password" | grep -v "ERROR" | tail -1)
echo "  商品数量: $FINAL_PRODUCT_COUNT"

FINAL_ORDER_COUNT=$(mysql -h"$MYSQL_HOST" -P"$MYSQL_PORT" -u"$MYSQL_USERNAME" -p"$MYSQL_PASSWORD" --skip-ssl "$MYSQL_DATABASE" -e "SELECT COUNT(*) FROM tz_order;" 2>&1 | grep -v "Using a password" | grep -v "ERROR" | tail -1)
echo "  订单数量: $FINAL_ORDER_COUNT"
echo ""

echo "=========================================="
echo "✅ 生产数据导入完成！"
echo "=========================================="

