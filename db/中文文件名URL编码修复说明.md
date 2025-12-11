# 中文文件名URL编码修复说明

## 问题描述

当图片文件名包含中文字符时，前端访问图片会出现失败。这是因为URL中的中文字符没有被正确编码，导致浏览器和服务器无法正确解析路径。

## 问题原因

### 1. **后端未对中文路径进行URL编码**

**位置**: `ImgJsonSerializer.java`

**问题**:
- 后端在生成图片URL时，直接将图片路径拼接到 `resourceUrl` 后面
- 如果图片路径包含中文字符（如 `2019/04/测试图片.jpg`），生成的URL是 `/mall4j/img/2019/04/测试图片.jpg`
- 这个URL在HTTP请求中会被错误解析，因为中文字符在URL中需要编码为 `%E6%B5%8B%E8%AF%95%E5%9B%BE%E7%89%87.jpg`

### 2. **前端未对中文路径进行URL编码**

**位置**: 
- `front-end/mall4uni/src/utils/util.js` 的 `checkFileUrl` 函数
- `front-end/mall4v/src/utils/index.js` 的 `checkFileUrl` 函数

**问题**:
- 前端在处理图片URL时，没有对路径中的中文字符进行编码
- 即使后端返回了编码后的URL，前端在处理相对路径时也可能产生未编码的URL

## 解决方案

### 1. **后端修复** ✅

**修改文件**: `yami-shop-common/src/main/java/com/yami/shop/common/serializer/json/ImgJsonSerializer.java`

**修改内容**:
1. 添加了 `encodeImageUrl()` 方法，用于对图片URL中的路径部分进行编码
2. 添加了 `encodePath()` 方法，用于对路径进行编码（保留路径分隔符）
3. 在 `serialize()` 方法中，对所有图片URL进行编码处理

**编码逻辑**:
- 对于完整URL（`http://` 或 `https://`），分别处理协议、域名和路径部分
- 只对路径部分进行编码，保留协议和域名不变
- 按路径分隔符 `/` 分割路径，对每个路径段进行编码
- 使用 `URLEncoder.encode()` 进行编码，并将 `+` 替换为 `%20`（更符合URL编码规范）

**示例**:
```java
// 原始路径: 2019/04/测试图片.jpg
// 编码后: 2019/04/%E6%B5%8B%E8%AF%95%E5%9B%BE%E7%89%87.jpg

// 完整URL: http://example.com/mall4j/img/2019/04/测试图片.jpg
// 编码后: http://example.com/mall4j/img/2019/04/%E6%B5%8B%E8%AF%95%E5%9B%BE%E7%89%87.jpg
```

### 2. **前端修复（mall4uni）** ✅

**修改文件**: `front-end/mall4uni/src/utils/util.js`

**修改内容**:
1. 在 `checkFileUrl()` 函数中，对所有返回的URL调用 `encodeUrlPath()` 进行编码
2. 添加了 `encodeUrlPath()` 方法，用于对URL中的路径部分进行编码

**编码逻辑**:
- 检查URL是否已经编码过（包含 `%`）
- 检查路径段是否包含中文字符或特殊字符
- 使用 `encodeURIComponent()` 进行编码
- 保留路径分隔符 `/` 不变

### 3. **前端修复（mall4v）** ✅

**修改文件**: `front-end/mall4v/src/utils/index.js`

**修改内容**:
1. 在 `checkFileUrl()` 函数中，对所有返回的URL调用 `encodeUrlPath()` 进行编码
2. 添加了 `encodeUrlPath()` 函数，用于对URL中的路径部分进行编码

**编码逻辑**: 与 mall4uni 相同

### 4. **Spring静态资源处理** ✅

**位置**: `ResourceConfigAdapter.java`

**说明**:
- Spring的 `ResourceHandler` 默认能够正确处理URL编码的路径
- 不需要额外配置，Spring会自动解码URL中的编码字符
- 文件系统路径匹配时会自动处理编码/解码

## 编码规则

### URL编码规范

1. **保留字符**: 以下字符在URL中有特殊含义，需要编码：
   - `!` → `%21`
   - `#` → `%23`
   - `$` → `%24`
   - `&` → `%26`
   - `'` → `%27`
   - `(` → `%28`
   - `)` → `%29`
   - `*` → `%2A`
   - `+` → `%2B` 或 `%20`（空格）
   - `,` → `%2C`
   - `/` → `%2F`（但路径分隔符通常保留）
   - `:` → `%3A`
   - `;` → `%3B`
   - `=` → `%3D`
   - `?` → `%3F`
   - `@` → `%40`

2. **中文字符编码**: 使用UTF-8编码
   - `测试` → `%E6%B5%8B%E8%AF%95`
   - `图片` → `%E5%9B%BE%E7%89%87`

3. **路径分隔符**: 通常保留 `/` 不编码，只编码路径段中的字符

## 测试验证

### 测试用例

1. **中文文件名测试**:
   ```
   原始路径: 2019/04/测试图片.jpg
   期望URL: http://example.com/mall4j/img/2019/04/%E6%B5%8B%E8%AF%95%E5%9B%BE%E7%89%87.jpg
   ```

2. **混合字符测试**:
   ```
   原始路径: 2019/04/测试_图片(1).jpg
   期望URL: http://example.com/mall4j/img/2019/04/%E6%B5%8B%E8%AF%95_%E5%9B%BE%E7%89%87%281%29.jpg
   ```

3. **已编码URL测试**:
   ```
   输入URL: http://example.com/mall4j/img/2019/04/%E6%B5%8B%E8%AF%95.jpg
   期望输出: http://example.com/mall4j/img/2019/04/%E6%B5%8B%E8%AF%95.jpg（不重复编码）
   ```

### 验证步骤

1. **后端验证**:
   ```bash
   # 调用API获取商品列表
   curl http://175.178.163.41:8086/p/prod/list
   
   # 检查返回的JSON中图片URL是否已编码
   # 应该看到类似: "pic":"http://175.178.163.41:8085/mall4j/img/2019/04/%E6%B5%8B%E8%AF%95.jpg"
   ```

2. **前端验证**:
   - 打开浏览器开发者工具
   - 查看Network标签页
   - 检查图片请求的URL是否包含编码后的中文字符
   - 确认图片能正常加载

3. **文件系统验证**:
   ```bash
   # 确认文件系统中的文件名是中文
   ls -la /root/cb/mall4j/IMG/2019/04/
   
   # 确认URL编码后的路径能正确访问文件
   curl "http://175.178.163.41:8085/mall4j/img/2019/04/%E6%B5%8B%E8%AF%95.jpg"
   ```

## 部署步骤

### 1. 重新编译后端

```bash
cd /home/devbox/project/mall4j
# 使用Maven编译
mvn clean compile -DskipTests
# 或者使用Docker编译
docker run -it --rm -v $(pwd):/workspace -w /workspace maven:3.8-openjdk-11 mvn clean compile -DskipTests
```

### 2. 重新构建后端Docker镜像

```bash
cd /home/devbox/project/mall4j
docker-compose build mall4j-admin
docker-compose build mall4j-api
```

### 3. 重新构建前端

```bash
# mall4uni
cd /home/devbox/project/mall4j/front-end/mall4uni
npm run build:h5

# mall4v
cd /home/devbox/project/mall4j/front-end/mall4v
npm run build
```

### 4. 重启服务

```bash
cd /home/devbox/project/mall4j
docker-compose restart mall4j-admin
docker-compose restart mall4j-api
docker-compose restart mall4uni-frontend
docker-compose restart mall4v-frontend
```

## 注意事项

1. **编码一致性**: 确保前后端使用相同的编码方式（UTF-8）
2. **避免重复编码**: 检查URL是否已经编码过，避免重复编码
3. **路径分隔符**: 保留路径分隔符 `/` 不编码，只编码路径段中的字符
4. **特殊字符**: 注意处理文件名中的特殊字符（如空格、括号等）
5. **浏览器兼容性**: 现代浏览器都支持UTF-8 URL编码，但要注意旧版浏览器的兼容性

## 相关文件

- `yami-shop-common/src/main/java/com/yami/shop/common/serializer/json/ImgJsonSerializer.java`
- `front-end/mall4uni/src/utils/util.js`
- `front-end/mall4v/src/utils/index.js`
- `yami-shop-common/src/main/java/com/yami/shop/common/config/ResourceConfigAdapter.java`

## 完成时间

2025-01-XX

