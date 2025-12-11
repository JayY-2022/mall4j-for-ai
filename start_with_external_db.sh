#!/bin/bash
# Mall4j 使用外部MySQL和Redis启动脚本

# 加载环境变量（如果存在.env文件）
if [ -f .env ]; then
    export $(cat .env | grep -v '^#' | xargs)
fi

# 检查必需的环境变量
if [ -z "$MYSQL_HOST" ] || [ -z "$REDIS_HOST" ]; then
    echo "错误: 请设置以下环境变量:"
    echo "  MYSQL_HOST - MySQL服务器地址"
    echo "  MYSQL_PORT - MySQL端口 (默认: 3306)"
    echo "  MYSQL_DATABASE - 数据库名 (默认: yami_shops)"
    echo "  MYSQL_USERNAME - MySQL用户名 (默认: root)"
    echo "  MYSQL_PASSWORD - MySQL密码 (默认: root)"
    echo ""
    echo "  REDIS_HOST - Redis服务器地址"
    echo "  REDIS_PORT - Redis端口 (默认: 6379)"
    echo "  REDIS_DATABASE - Redis数据库编号 (默认: 0)"
    echo "  REDIS_PASSWORD - Redis密码 (可选)"
    echo ""
    echo "使用方法:"
    echo "  1. 复制 .env.example 为 .env 并填写配置"
    echo "  2. 运行: source .env && ./start_with_external_db.sh"
    echo "  或直接: MYSQL_HOST=xxx REDIS_HOST=xxx ./start_with_external_db.sh"
    exit 1
fi

echo "=========================================="
echo "Mall4j 启动配置"
echo "=========================================="
echo "MySQL: ${MYSQL_HOST}:${MYSQL_PORT:-3306}/${MYSQL_DATABASE:-yami_shops}"
echo "Redis: ${REDIS_HOST}:${REDIS_PORT:-6379}"
echo "=========================================="

# 测试MySQL连接
echo "测试MySQL连接..."
mysql -h"${MYSQL_HOST}" -P"${MYSQL_PORT:-3306}" -u"${MYSQL_USERNAME:-root}" -p"${MYSQL_PASSWORD:-root}" -e "SELECT 1" 2>/dev/null
if [ $? -eq 0 ]; then
    echo "✅ MySQL连接成功"
else
    echo "⚠️  MySQL连接测试失败，但将继续启动..."
fi

# 测试Redis连接
echo "测试Redis连接..."
if command -v redis-cli &> /dev/null; then
    if [ -n "$REDIS_PASSWORD" ]; then
        redis-cli -h "${REDIS_HOST}" -p "${REDIS_PORT:-6379}" -a "${REDIS_PASSWORD}" ping 2>/dev/null | grep -q PONG
    else
        redis-cli -h "${REDIS_HOST}" -p "${REDIS_PORT:-6379}" ping 2>/dev/null | grep -q PONG
    fi
    if [ $? -eq 0 ]; then
        echo "✅ Redis连接成功"
    else
        echo "⚠️  Redis连接测试失败，但将继续启动..."
    fi
else
    echo "⚠️  redis-cli未安装，跳过Redis连接测试"
fi

echo ""
echo "启动服务..."
echo "Admin服务将在端口 8085 启动"
echo "API服务将在端口 8086 启动"
echo ""
echo "提示: 使用以下命令启动:"
echo "  java -jar yami-shop-admin/target/yami-shop-admin-0.0.1-SNAPSHOT.jar"
echo "  java -jar yami-shop-api/target/yami-shop-api-0.0.1-SNAPSHOT.jar"
