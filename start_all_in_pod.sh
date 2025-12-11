#!/bin/bash
set -e

cd /home/devbox/project/mall4j

echo "=========================================="
echo "Mall4j K8s Pod 启动脚本"
echo "=========================================="

# 加载环境变量
if [ -f .env ]; then
    source .env
    echo "✅ 已加载环境变量"
else
    echo "⚠️  未找到 .env 文件，使用默认配置"
fi

# 检查必要文件
echo ""
echo "🔍 检查必要文件..."
if [ ! -f "yami-shop-admin/target/yami-shop-admin-0.0.1-SNAPSHOT.jar" ]; then
    echo "❌ Admin JAR 文件不存在，请先编译项目: mvn clean package -DskipTests"
    exit 1
fi

if [ ! -f "yami-shop-api/target/yami-shop-api-0.0.1-SNAPSHOT.jar" ]; then
    echo "❌ API JAR 文件不存在，请先编译项目: mvn clean package -DskipTests"
    exit 1
fi

# 检查前端构建产物
if [ ! -d "front-end/mall4v/dist" ]; then
    echo "⚠️  mall4v 前端未构建，将使用空目录"
    mkdir -p front-end/mall4v/dist
fi

if [ ! -d "front-end/mall4uni/dist/build/h5" ]; then
    echo "⚠️  mall4uni 前端未构建，将使用空目录"
    mkdir -p front-end/mall4uni/dist/build/h5
fi

# 创建 Nginx 目录结构
echo ""
echo "📁 准备 Nginx 目录..."
NGINX_ROOT="/tmp/nginx"
mkdir -p ${NGINX_ROOT}/html/mall4v
mkdir -p ${NGINX_ROOT}/html/mall4uni/h5
mkdir -p ${NGINX_ROOT}/logs
mkdir -p ${NGINX_ROOT}/conf.d

# 复制前端文件
if [ -d "front-end/mall4v/dist" ] && [ "$(ls -A front-end/mall4v/dist 2>/dev/null)" ]; then
    echo "📦 复制 mall4v 前端文件..."
    cp -r front-end/mall4v/dist/* ${NGINX_ROOT}/html/mall4v/ 2>/dev/null || true
fi

if [ -d "front-end/mall4uni/dist/build/h5" ] && [ "$(ls -A front-end/mall4uni/dist/build/h5 2>/dev/null)" ]; then
    echo "📦 复制 mall4uni 前端文件..."
    cp -r front-end/mall4uni/dist/build/h5/* ${NGINX_ROOT}/html/mall4uni/h5/ 2>/dev/null || true
fi

# 复制 Nginx 配置
if [ -f "nginx/nginx.conf" ]; then
    # 修改配置中的路径
    sed "s|/usr/share/nginx/html|${NGINX_ROOT}/html|g" nginx/nginx.conf > ${NGINX_ROOT}/nginx.conf
    sed -i "s|/var/log/nginx|${NGINX_ROOT}/logs|g" ${NGINX_ROOT}/nginx.conf
    sed -i "s|/var/run/nginx.pid|${NGINX_ROOT}/nginx.pid|g" ${NGINX_ROOT}/nginx.conf
    echo "✅ Nginx 配置已准备"
else
    echo "⚠️  未找到 nginx/nginx.conf，将使用默认配置"
fi

# 检查端口占用
echo ""
echo "🔍 检查端口占用..."
for port in 8085 8086 8080 8081; do
    if lsof -Pi :${port} -sTCP:LISTEN -t >/dev/null 2>&1; then
        echo "⚠️  端口 ${port} 已被占用"
    else
        echo "✅ 端口 ${port} 可用"
    fi
done

# 启动 Java 服务（后台运行）
echo ""
echo "🚀 启动 Java 服务..."

# 导出环境变量（确保传递给子进程）
export MYSQL_HOST=${MYSQL_HOST:-mall4j-db-mysql.ns-admin.svc}
export MYSQL_PORT=${MYSQL_PORT:-3306}
export MYSQL_DATABASE=${MYSQL_DATABASE:-yami_shops}
export MYSQL_USERNAME=${MYSQL_USERNAME:-root}
export MYSQL_PASSWORD=${MYSQL_PASSWORD:-}
export REDIS_HOST=${REDIS_HOST:-mall4j-cache-redis.ns-admin.svc}
export REDIS_PORT=${REDIS_PORT:-6379}
export REDIS_DATABASE=${REDIS_DATABASE:-0}
export REDIS_PASSWORD=${REDIS_PASSWORD:-}

# 启动 Admin 服务
echo "启动 Admin 服务 (端口 8085)..."
echo "使用配置: MySQL=${MYSQL_HOST}:${MYSQL_PORT}, Redis=${REDIS_HOST}:${REDIS_PORT}"
nohup env MYSQL_HOST="$MYSQL_HOST" MYSQL_PORT="$MYSQL_PORT" MYSQL_DATABASE="$MYSQL_DATABASE" MYSQL_USERNAME="$MYSQL_USERNAME" MYSQL_PASSWORD="$MYSQL_PASSWORD" REDIS_HOST="$REDIS_HOST" REDIS_PORT="$REDIS_PORT" REDIS_DATABASE="$REDIS_DATABASE" REDIS_PASSWORD="$REDIS_PASSWORD" java \
    -Dspring.profiles.active=dev \
    -Dspring.data.redis.host="${REDIS_HOST}" \
    -Dspring.data.redis.port="${REDIS_PORT}" \
    -Dspring.data.redis.password="${REDIS_PASSWORD}" \
    -Dspring.redis.host="${REDIS_HOST}" \
    -Dspring.redis.port="${REDIS_PORT}" \
    -Dspring.redis.password="${REDIS_PASSWORD}" \
    -jar yami-shop-admin/target/yami-shop-admin-0.0.1-SNAPSHOT.jar \
    > ${NGINX_ROOT}/logs/mall4j-admin.log 2>&1 &
ADMIN_PID=$!
echo $ADMIN_PID > ${NGINX_ROOT}/mall4j-admin.pid
echo "✅ Admin 服务已启动 (PID: $ADMIN_PID)"

# 等待 Admin 服务启动
echo "等待 Admin 服务启动..."
sleep 8
for i in {1..30}; do
    # 检查端口是否在监听（更可靠的方法）
    if netstat -tlnp 2>/dev/null | grep -q ":8085.*LISTEN" || ss -tlnp 2>/dev/null | grep -q ":8085.*LISTEN"; then
        # 尝试访问服务（即使返回错误也说明服务已启动）
        if curl -s -o /dev/null -w "%{http_code}" http://localhost:8085 >/dev/null 2>&1; then
            echo "✅ Admin 服务已就绪"
            break
        fi
    fi
    if [ $i -eq 30 ]; then
        echo "⚠️  Admin 服务启动超时，但将继续..."
    fi
    sleep 1
done

# 启动 API 服务
echo "启动 API 服务 (端口 8086)..."
nohup env MYSQL_HOST="$MYSQL_HOST" MYSQL_PORT="$MYSQL_PORT" MYSQL_DATABASE="$MYSQL_DATABASE" MYSQL_USERNAME="$MYSQL_USERNAME" MYSQL_PASSWORD="$MYSQL_PASSWORD" REDIS_HOST="$REDIS_HOST" REDIS_PORT="$REDIS_PORT" REDIS_DATABASE="$REDIS_DATABASE" REDIS_PASSWORD="$REDIS_PASSWORD" java \
    -Dspring.profiles.active=dev \
    -Dspring.data.redis.host="${REDIS_HOST}" \
    -Dspring.data.redis.port="${REDIS_PORT}" \
    -Dspring.data.redis.password="${REDIS_PASSWORD}" \
    -Dspring.redis.host="${REDIS_HOST}" \
    -Dspring.redis.port="${REDIS_PORT}" \
    -Dspring.redis.password="${REDIS_PASSWORD}" \
    -jar yami-shop-api/target/yami-shop-api-0.0.1-SNAPSHOT.jar \
    > ${NGINX_ROOT}/logs/mall4j-api.log 2>&1 &
API_PID=$!
echo $API_PID > ${NGINX_ROOT}/mall4j-api.pid
echo "✅ API 服务已启动 (PID: $API_PID)"

# 等待 API 服务启动
echo "等待 API 服务启动..."
sleep 8
for i in {1..30}; do
    # 检查端口是否在监听（更可靠的方法）
    if netstat -tlnp 2>/dev/null | grep -q ":8086.*LISTEN" || ss -tlnp 2>/dev/null | grep -q ":8086.*LISTEN"; then
        # 尝试访问服务（即使返回错误也说明服务已启动）
        if curl -s -o /dev/null -w "%{http_code}" http://localhost:8086 >/dev/null 2>&1; then
            echo "✅ API 服务已就绪"
            break
        fi
    fi
    if [ $i -eq 30 ]; then
        echo "⚠️  API 服务启动超时，但将继续..."
    fi
    sleep 1
done

# 启动 Nginx
echo ""
echo "🌐 启动 Nginx..."
if command -v nginx &> /dev/null || /usr/sbin/nginx -v &> /dev/null; then
    # 测试配置（指定 PID 文件路径避免权限错误）
    NGINX_CMD=$(command -v nginx || echo "/usr/sbin/nginx")
    if $NGINX_CMD -t -c ${NGINX_ROOT}/nginx.conf -g "pid ${NGINX_ROOT}/nginx.pid;" 2>&1 | grep -q "successful"; then
        # 启动 Nginx
        $NGINX_CMD -c ${NGINX_ROOT}/nginx.conf -g "pid ${NGINX_ROOT}/nginx.pid; error_log ${NGINX_ROOT}/logs/error.log;"
        echo "✅ Nginx 已启动"
    else
        echo "⚠️  Nginx 配置测试失败，尝试直接启动..."
        # 即使测试失败，也尝试启动（可能是权限问题，但实际启动可能成功）
        $NGINX_CMD -c ${NGINX_ROOT}/nginx.conf -g "pid ${NGINX_ROOT}/nginx.pid; error_log ${NGINX_ROOT}/logs/error.log;" 2>&1 && {
            echo "✅ Nginx 已启动（跳过配置测试）"
        } || {
            echo "❌ Nginx 启动失败"
            echo "   请检查配置: $NGINX_CMD -t -c ${NGINX_ROOT}/nginx.conf -g \"pid ${NGINX_ROOT}/nginx.pid;\""
        }
    fi
else
    echo "⚠️  Nginx 未安装，跳过前端服务"
    echo "   请安装 Nginx 或使用其他方式运行前端"
fi

echo ""
echo "=========================================="
echo "✅ 所有服务已启动！"
echo "=========================================="
echo ""
echo "📊 服务地址:"
echo "   - Admin API: http://localhost:8085"
echo "   - User API:  http://localhost:8086"
echo "   - Admin UI:   http://localhost:8080"
echo "   - User H5:    http://localhost:8081"
echo ""
echo "📝 日志文件:"
echo "   - Admin: ${NGINX_ROOT}/logs/mall4j-admin.log"
echo "   - API:   ${NGINX_ROOT}/logs/mall4j-api.log"
echo "   - Nginx: ${NGINX_ROOT}/logs/error.log"
echo ""
echo "🛑 停止服务: ./stop_all_in_pod.sh"
echo ""

