# 生产数据导入总结报告

## ✅ 导入完成

**导入时间**: 2025-12-08

## 📊 数据统计

### 导入前数据
- 用户数量: 2
- 地址数量: 1
- 商品数量: 12
- 订单数量: 5

### 导入后数据
- **用户数量**: 22 (+20)
- **地址数量**: 37 (+36)
- **商品数量**: 59 (+47)
- **订单数量**: 105 (+100)

## 📁 已导入的 SQL 文件

### 1. 用户数据 ✅
- **文件**: `db/insert_20_users.sql` (6.9K)
- **内容**: 20 个测试用户
- **密码**: 统一为 `123456`（已 BCrypt 加密）
- **状态**: ✅ 已导入

### 2. 用户地址数据 ✅
- **文件**: `db/insert_user_addresses.sql` (8.6K)
- **内容**: 用户地址数据，每个用户 1-3 个地址
- **状态**: ✅ 已导入

### 3. 商品数据 ✅
- **文件**: `db/batch_insert_products.sql` (85K)
- **内容**: 47 个测试商品
- **状态**: ✅ 已导入

### 4. 订单数据 ✅
- **文件**: `db/insert_100_orders.sql` (98K)
- **内容**: 100 条订单测试数据
- **包含**: 订单主表、订单项、订单地址快照、订单结算
- **状态**: ✅ 已导入

### 5. 智能客服表结构 ✅
- **文件**: `db/chatbot_tables.sql` (714B)
- **内容**: 智能客服相关表结构
- **状态**: ✅ 已导入

### 6. 智能客服配置表 ✅
- **文件**: `db/chatbot_config_table.sql` (1.1K)
- **内容**: 智能客服配置表和初始配置
- **状态**: ✅ 已导入

### 7. 智能客服菜单配置 ✅
- **文件**: `db/add_chatbot_config_menu.sql` (588B)
- **内容**: 智能客服菜单配置
- **状态**: ✅ 已导入

### 8. MCP 表结构 ✅
- **文件**: `db/mcp_tables.sql` (7.3K)
- **内容**: MCP 相关表结构
- **状态**: ✅ 已导入

## 📋 未导入的文件（测试文件）

以下文件为测试文件，不需要导入：
- `test_one_order.sql` - 单条订单测试
- `test_product_insert.sql` - 商品测试插入

## 🔍 数据验证

### 用户数据
- 20 个新用户已导入
- 密码统一为 `123456`（BCrypt 加密）
- 用户邮箱格式: `user001@qq.com`, `user002@gmail.com` 等

### 商品数据
- 47 个新商品已导入
- 包含商品基本信息、价格、库存等

### 订单数据
- 100 条订单已导入
- 包含完整的订单信息：
  - 订单主表 (`tz_order`)
  - 订单项 (`tz_order_item`)
  - 订单地址快照 (`tz_user_addr_order`)
  - 订单结算 (`tz_order_settlement`)

### 功能表
- 智能客服相关表已创建
- MCP 相关表已创建

## 📝 使用说明

### 测试用户登录

导入的用户可以使用以下信息登录：
- **邮箱**: `user001@qq.com` 到 `user020@xxx.com`
- **密码**: `123456`
- **手机号**: 对应的手机号（见 SQL 文件）

### 查看数据

```bash
cd /home/devbox/project/mall4j
source .env

# 查看用户列表
mysql -h"$MYSQL_HOST" -P"$MYSQL_PORT" -u"$MYSQL_USERNAME" -p"$MYSQL_PASSWORD" --skip-ssl \
  "$MYSQL_DATABASE" -e "SELECT user_id, nick_name, user_mail, user_mobile FROM tz_user LIMIT 10;"

# 查看商品列表
mysql -h"$MYSQL_HOST" -P"$MYSQL_PORT" -u"$MYSQL_USERNAME" -p"$MYSQL_PASSWORD" --skip-ssl \
  "$MYSQL_DATABASE" -e "SELECT prod_id, prod_name, price FROM tz_prod LIMIT 10;"

# 查看订单列表
mysql -h"$MYSQL_HOST" -P"$MYSQL_PORT" -u"$MYSQL_USERNAME" -p"$MYSQL_PASSWORD" --skip-ssl \
  "$MYSQL_DATABASE" -e "SELECT order_id, order_number, total, status FROM tz_order LIMIT 10;"
```

## 🔧 重新导入

如果需要重新导入数据，可以：

1. **删除现有数据**（谨慎操作）:
   ```bash
   # 删除测试用户
   mysql -h"$MYSQL_HOST" -P"$MYSQL_PORT" -u"$MYSQL_USERNAME" -p"$MYSQL_PASSWORD" --skip-ssl \
     "$MYSQL_DATABASE" -e "DELETE FROM tz_user WHERE user_mail LIKE 'user%';"
   ```

2. **重新运行导入脚本**:
   ```bash
   ./import_production_data.sh
   ```

## ✨ 总结

所有生产数据已成功导入到外部数据库：
- ✅ 用户数据：22 个用户
- ✅ 地址数据：37 个地址
- ✅ 商品数据：59 个商品
- ✅ 订单数据：105 条订单
- ✅ 功能表：智能客服和 MCP 相关表

现在数据库已包含完整的测试数据，可以用于开发和测试。

