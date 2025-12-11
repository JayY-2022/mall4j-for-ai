# 图片URL配置修复说明

## 问题描述

外部环境访问图片时使用了 `localhost` 地址，导致外部用户无法正常访问图片。

## 问题原因

1. **前端环境变量配置错误**：
   - `mall4uni` 前端环境变量中 `VITE_APP_RESOURCES_URL` 配置为 `https://img.mall4j.com/`（七牛云地址）
   - 应该使用服务器实际IP地址

2. **后端配置正确**：
   - `shop.properties` 中 `resourceUrl` 已正确配置为 `http://175.178.163.41:8085/mall4j/img/`

## 已完成的修复

### 1. 前端环境变量更新

已更新 `mall4uni` 前端的所有环境变量文件：

- **`.env.production`**: `VITE_APP_RESOURCES_URL = 'http://175.178.163.41:8085/mall4j/img/'`
- **`.env.development`**: `VITE_APP_RESOURCES_URL = 'http://175.178.163.41:8085/mall4j/img/'`
- **`.env.testing`**: `VITE_APP_RESOURCES_URL = 'http://175.178.163.41:8085/mall4j/img/'`

### 2. 配置验证

- ✅ 后端配置：`http://175.178.163.41:8085/mall4j/img/`
- ✅ 前端配置（mall4uni）：`http://175.178.163.41:8085/mall4j/img/`
- ✅ 前端配置（mall4v）：`http://175.178.163.41:8085/mall4j/img/`
- ✅ 图片文件存在：`/root/cb/mall4j/IMG/2019/04/eaa8c9bd3e7b41eaa310adbde10b6401.jpg`
- ✅ 图片访问测试：HTTP 200

## 图片URL生成机制

### 后端（ImgJsonSerializer）

后端通过 `ImgJsonSerializer` 自动处理图片URL：

1. 如果图片路径以 `http://` 或 `https://` 开头，直接返回
2. 否则，在相对路径前添加 `resourceUrl`（来自 `shop.properties`）

**示例**：
- 数据库存储：`2019/04/eaa8c9bd3e7b41eaa310adbde10b6401.jpg`
- 后端返回：`http://175.178.163.41:8085/mall4j/img/2019/04/eaa8c9bd3e7b41eaa310adbde10b6401.jpg`

### 前端（util.checkFileUrl）

前端通过 `util.checkFileUrl` 处理图片URL：

1. 如果URL已包含基础路径，直接返回
2. 否则，在相对路径前添加 `VITE_APP_RESOURCES_URL`

## 下一步操作

### 需要重新构建前端

由于环境变量是在构建时注入的，需要重新构建前端才能生效：

```bash
# 进入前端目录
cd /root/cb/mall4j/front-end/mall4uni

# 重新构建（根据实际使用的环境）
npm run build:h5  # 或 build:mp-weixin 等
```

### 验证修复

1. 重新构建前端后，清除浏览器缓存
2. 访问商品列表页面，检查图片URL是否为 `http://175.178.163.41:8085/mall4j/img/...`
3. 确认图片能正常显示

## 配置说明

### 服务器信息

- **服务器IP**: `175.178.163.41`
- **Admin服务端口**: `8085`
- **API服务端口**: `8086`
- **图片访问路径**: `/mall4j/img/**`

### 图片存储路径

- **本地存储路径**: `/root/cb/mall4j/IMG/`
- **Docker挂载**: `./IMG:/root/cb/mall4j/IMG`

## 注意事项

1. **环境变量生效**：前端环境变量需要在构建时注入，修改后必须重新构建
2. **后端配置**：后端配置在 `shop.properties` 中，修改后需要重启服务
3. **图片路径格式**：数据库中的图片路径应为相对路径（如 `2019/04/xxx.jpg`），不要包含完整URL
4. **跨域问题**：如果前端和后端不在同一域名，可能需要配置CORS

## 完成时间

2025-11-19

