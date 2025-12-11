FROM nginx:1.20

# 移除默认站点配置，避免与自定义配置冲突
RUN rm -f /etc/nginx/conf.d/default.conf

COPY ./front-end/mall4v/dist /usr/share/nginx/html/dist
COPY ./front-end/mall4v/nginx.conf /etc/nginx/conf.d/mall4v.conf