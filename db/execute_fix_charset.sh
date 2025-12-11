#!/bin/bash
# 执行字符集修复脚本

set -e

cd /home/devbox/project/mall4j

echo "=========================================="
echo "开始修复数据库字符集为 utf8mb4"
echo "=========================================="
echo ""

# 尝试多种连接方式
MYSQL_HOST="${MYSQL_HOST:-127.0.0.1}"
MYSQL_PORT="${MYSQL_PORT:-3306}"
MYSQL_USER="${MYSQL_USERNAME:-root}"
MYSQL_PASS="${MYSQL_PASSWORD:-root}"
MYSQL_DB="${MYSQL_DATABASE:-yami_shops}"

# 如果 MySQL 在 Docker 容器中，尝试通过容器执行
if command -v docker &> /dev/null; then
    if docker ps --format "{{.Names}}" | grep -q "mall4j-mysql"; then
        echo "检测到 MySQL 容器，通过容器执行修复..."
        docker exec -i mall4j-mysql mysql -uroot -proot --default-character-set=utf8mb4 yami_shops < db/fix_charset_utf8mb4.sql
        echo "✅ 字符集修复完成（通过 Docker 容器）"
        exit 0
    fi
fi

# 尝试直接连接
echo "尝试直接连接 MySQL..."
if mysql -h"$MYSQL_HOST" -P"$MYSQL_PORT" -u"$MYSQL_USER" -p"$MYSQL_PASS" --default-character-set=utf8mb4 "$MYSQL_DB" -e "SELECT 1" &>/dev/null; then
    echo "✅ 连接成功，开始执行修复..."
    mysql -h"$MYSQL_HOST" -P"$MYSQL_PORT" -u"$MYSQL_USER" -p"$MYSQL_PASS" --default-character-set=utf8mb4 "$MYSQL_DB" < db/fix_charset_utf8mb4.sql
    echo "✅ 字符集修复完成"
else
    echo "❌ 无法连接到 MySQL 数据库"
    echo ""
    echo "请手动执行以下命令之一："
    echo ""
    echo "方式1: 如果 MySQL 在 Docker 容器中："
    echo "  docker exec -i mall4j-mysql mysql -uroot -proot --default-character-set=utf8mb4 yami_shops < db/fix_charset_utf8mb4.sql"
    echo ""
    echo "方式2: 如果 MySQL 在本地："
    echo "  mysql -h127.0.0.1 -P3306 -uroot -proot --default-character-set=utf8mb4 yami_shops < db/fix_charset_utf8mb4.sql"
    echo ""
    echo "方式3: 在 MySQL 客户端中执行："
    echo "  source /home/devbox/project/mall4j/db/fix_charset_utf8mb4.sql;"
    exit 1
fi

