FROM nginx:1.20

# 移除默认站点配置
RUN rm -f /etc/nginx/conf.d/default.conf

# 拷贝构建产物与自定义配置
# 注意：构建上下文是 ./mall4j，所以路径是相对于 mall4j 目录的
COPY ./front-end/mall4uni/dist/build/h5 /usr/share/nginx/html/h5
COPY ./front-end/mall4uni/nginx.conf /etc/nginx/conf.d/mall4uni.conf
