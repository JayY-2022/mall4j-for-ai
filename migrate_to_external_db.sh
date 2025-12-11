#!/bin/bash
# 数据迁移脚本：将数据库迁移到外部 MySQL

set -e

cd /home/devbox/project/mall4j

echo "=========================================="
echo "Mall4j 数据迁移到外部数据库"
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

# 检查必要的环境变量
if [ -z "$MYSQL_HOST" ] || [ -z "$MYSQL_PORT" ] || [ -z "$MYSQL_DATABASE" ] || [ -z "$MYSQL_USERNAME" ] || [ -z "$MYSQL_PASSWORD" ]; then
    echo "❌ 环境变量不完整，请检查 .env 文件"
    exit 1
fi

echo "目标数据库信息:"
echo "  Host: $MYSQL_HOST"
echo "  Port: $MYSQL_PORT"
echo "  Database: $MYSQL_DATABASE"
echo "  Username: $MYSQL_USERNAME"
echo ""

# 检查 MySQL 客户端是否可用
if ! command -v mysql &> /dev/null; then
    echo "⚠️  MySQL 客户端未安装，尝试安装..."
    if command -v apt-get &> /dev/null; then
        sudo apt-get update -qq
        sudo apt-get install -y mysql-client -qq
    else
        echo "❌ 无法自动安装 MySQL 客户端，请手动安装"
        exit 1
    fi
fi

# 测试数据库连接
echo "🔍 测试数据库连接..."
MYSQL_CMD="mysql -h\"$MYSQL_HOST\" -P\"$MYSQL_PORT\" -u\"$MYSQL_USERNAME\" -p\"$MYSQL_PASSWORD\" --skip-ssl"
if ! $MYSQL_CMD -e "SELECT 1" 2>&1 | grep -v "Using a password" | grep -v "^1$" > /dev/null 2>&1; then
    CONN_TEST=$($MYSQL_CMD -e "SELECT 1" 2>&1)
    if echo "$CONN_TEST" | grep -q "ERROR"; then
        echo "❌ 无法连接到数据库"
        echo "错误信息: $CONN_TEST"
        echo ""
        echo "请检查："
        echo "  1. 数据库地址是否正确: $MYSQL_HOST:$MYSQL_PORT"
        echo "  2. 用户名和密码是否正确"
        echo "  3. 网络连接是否正常"
        exit 1
    fi
fi
echo "✅ 数据库连接成功"
echo ""

# 检查数据库是否存在
echo "🔍 检查数据库是否存在..."
MYSQL_CMD="mysql -h\"$MYSQL_HOST\" -P\"$MYSQL_PORT\" -u\"$MYSQL_USERNAME\" -p\"$MYSQL_PASSWORD\" --skip-ssl"
DB_EXISTS=$($MYSQL_CMD -e "SHOW DATABASES LIKE '$MYSQL_DATABASE';" 2>&1 | grep -v "Using a password" | grep -v "ERROR" | grep -c "$MYSQL_DATABASE" || echo "0")

if [ "$DB_EXISTS" -eq "0" ]; then
    echo "📦 数据库不存在，开始创建..."
    $MYSQL_CMD -e "CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;" 2>&1 | grep -v "Using a password" || true
    echo "✅ 数据库创建成功"
else
    echo "⚠️  数据库已存在"
    if [ -t 0 ]; then
        read -p "是否要删除并重新创建数据库？这将删除所有现有数据！(y/N): " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            echo "🗑️  删除现有数据库..."
            $MYSQL_CMD -e "DROP DATABASE IF EXISTS \`$MYSQL_DATABASE\`;" 2>&1 | grep -v "Using a password" || true
            $MYSQL_CMD -e "CREATE DATABASE \`$MYSQL_DATABASE\` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;" 2>&1 | grep -v "Using a password" || true
            echo "✅ 数据库已重新创建"
        else
            echo "⚠️  跳过数据库创建，继续导入数据..."
        fi
    else
        echo "⚠️  非交互式模式，跳过数据库创建，继续导入数据..."
    fi
fi
echo ""

# 导入主 SQL 文件（包含表结构和初始数据）
echo "📥 导入主 SQL 文件 (yami_shop.sql)..."
if [ -f "db/yami_shop.sql" ]; then
    echo "  文件大小: $(du -h db/yami_shop.sql | cut -f1)"
    echo "  正在导入，请稍候..."
    $MYSQL_CMD "$MYSQL_DATABASE" < db/yami_shop.sql 2>&1 | grep -v "Using a password" | grep -E "ERROR|error" || true
    echo "✅ 主 SQL 文件导入完成"
else
    echo "❌ 未找到 db/yami_shop.sql 文件"
    exit 1
fi
echo ""

# 导入其他数据文件（可选）
echo "📥 导入其他数据文件..."

# 用户数据
if [ -f "db/insert_20_users.sql" ]; then
    echo "  导入用户数据..."
    mysql -h"$MYSQL_HOST" -P"$MYSQL_PORT" -u"$MYSQL_USERNAME" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" < db/insert_20_users.sql 2>&1 | grep -v "Using a password" || true
    echo "  ✅ 用户数据导入完成"
fi

# 用户地址数据
if [ -f "db/insert_user_addresses.sql" ]; then
    echo "  导入用户地址数据..."
    mysql -h"$MYSQL_HOST" -P"$MYSQL_PORT" -u"$MYSQL_USERNAME" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" < db/insert_user_addresses.sql 2>&1 | grep -v "Using a password" || true
    echo "  ✅ 用户地址数据导入完成"
fi

# 商品数据
if [ -f "db/batch_insert_products.sql" ]; then
    echo "  导入商品数据..."
    mysql -h"$MYSQL_HOST" -P"$MYSQL_PORT" -u"$MYSQL_USERNAME" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" < db/batch_insert_products.sql 2>&1 | grep -v "Using a password" || true
    echo "  ✅ 商品数据导入完成"
fi

# 订单数据（可选，数据量大）
if [ -f "db/insert_100_orders.sql" ]; then
    if [ -t 0 ]; then
        read -p "是否导入订单数据（100条订单）？(y/N): " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            echo "  导入订单数据..."
            $MYSQL_CMD "$MYSQL_DATABASE" < db/insert_100_orders.sql 2>&1 | grep -v "Using a password" || true
            echo "  ✅ 订单数据导入完成"
        fi
    else
        echo "  跳过订单数据（非交互式模式）"
    fi
fi

# 其他表结构文件
for sql_file in db/chatbot_tables.sql db/chatbot_config_table.sql db/mcp_tables.sql; do
    if [ -f "$sql_file" ]; then
        echo "  导入 $(basename $sql_file)..."
        mysql -h"$MYSQL_HOST" -P"$MYSQL_PORT" -u"$MYSQL_USERNAME" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" < "$sql_file" 2>&1 | grep -v "Using a password" || true
        echo "  ✅ $(basename $sql_file) 导入完成"
    fi
done

echo ""

# 验证数据
echo "🔍 验证数据..."
TABLE_COUNT=$(mysql -h"$MYSQL_HOST" -P"$MYSQL_PORT" -u"$MYSQL_USERNAME" -p"$MYSQL_PASSWORD" --skip-ssl "$MYSQL_DATABASE" -e "SHOW TABLES;" 2>&1 | grep -v "Using a password" | grep -v "ERROR" | wc -l)
echo "  表数量: $((TABLE_COUNT - 1))"

USER_COUNT=$(mysql -h"$MYSQL_HOST" -P"$MYSQL_PORT" -u"$MYSQL_USERNAME" -p"$MYSQL_PASSWORD" --skip-ssl "$MYSQL_DATABASE" -e "SELECT COUNT(*) FROM tz_user;" 2>&1 | grep -v "Using a password" | grep -v "ERROR" | tail -1)
echo "  用户数量: $USER_COUNT"

AREA_COUNT=$(mysql -h"$MYSQL_HOST" -P"$MYSQL_PORT" -u"$MYSQL_USERNAME" -p"$MYSQL_PASSWORD" --skip-ssl "$MYSQL_DATABASE" -e "SELECT COUNT(*) FROM tz_area;" 2>&1 | grep -v "Using a password" | grep -v "ERROR" | tail -1)
echo "  地区数量: $AREA_COUNT"

echo ""
echo "=========================================="
echo "✅ 数据迁移完成！"
echo "=========================================="
echo ""
echo "数据库信息:"
echo "  Host: $MYSQL_HOST:$MYSQL_PORT"
echo "  Database: $MYSQL_DATABASE"
echo ""
echo "现在可以重启应用服务以使用外部数据库。"

