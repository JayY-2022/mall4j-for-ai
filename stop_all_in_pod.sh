#!/bin/bash

echo "=========================================="
echo "停止 Mall4j 所有服务"
echo "=========================================="

NGINX_ROOT="/tmp/nginx"

# 停止 Java 服务
echo "🛑 停止 Java 服务..."

if [ -f ${NGINX_ROOT}/mall4j-admin.pid ]; then
    ADMIN_PID=$(cat ${NGINX_ROOT}/mall4j-admin.pid)
    if kill -0 $ADMIN_PID 2>/dev/null; then
        echo "停止 Admin 服务 (PID: $ADMIN_PID)..."
        kill $ADMIN_PID
        sleep 2
        # 强制杀死（如果还在运行）
        if kill -0 $ADMIN_PID 2>/dev/null; then
            kill -9 $ADMIN_PID 2>/dev/null
        fi
        echo "✅ 已停止 Admin 服务"
    fi
    rm -f ${NGINX_ROOT}/mall4j-admin.pid
fi

if [ -f ${NGINX_ROOT}/mall4j-api.pid ]; then
    API_PID=$(cat ${NGINX_ROOT}/mall4j-api.pid)
    if kill -0 $API_PID 2>/dev/null; then
        echo "停止 API 服务 (PID: $API_PID)..."
        kill $API_PID
        sleep 2
        # 强制杀死（如果还在运行）
        if kill -0 $API_PID 2>/dev/null; then
            kill -9 $API_PID 2>/dev/null
        fi
        echo "✅ 已停止 API 服务"
    fi
    rm -f ${NGINX_ROOT}/mall4j-api.pid
fi

# 停止 Nginx
echo ""
echo "🛑 停止 Nginx..."
if [ -f ${NGINX_ROOT}/nginx.pid ]; then
    NGINX_PID=$(cat ${NGINX_ROOT}/nginx.pid)
    if kill -0 $NGINX_PID 2>/dev/null; then
        nginx -s quit -c ${NGINX_ROOT}/nginx.conf 2>/dev/null || kill $NGINX_PID
        sleep 1
        if kill -0 $NGINX_PID 2>/dev/null; then
            kill -9 $NGINX_PID 2>/dev/null
        fi
        echo "✅ 已停止 Nginx"
    fi
    rm -f ${NGINX_ROOT}/nginx.pid
fi

# 清理进程（备用方案）
echo ""
echo "🧹 清理残留进程..."
pkill -f "yami-shop-admin" 2>/dev/null && echo "✅ 清理 Admin 进程" || true
pkill -f "yami-shop-api" 2>/dev/null && echo "✅ 清理 API 进程" || true

echo ""
echo "=========================================="
echo "✅ 所有服务已停止"
echo "=========================================="

