# 变更：定义 Mall4j 电商系统 MCP 工具接入规范

## 原因
- Mall4j 作为一个功能完整的电商系统，包含商品管理、订单处理、用户管理、权限控制等核心业务能力，但缺少与 AI Agent 交互的标准化接口规范。
- 现有 RESTful API 接口虽然完善，但未针对 AI Agent 的工具调用场景进行抽象和封装，导致 Agent 需要理解复杂的业务逻辑和接口细节。
- 需要建立一套基于 MCP (Model Context Protocol) 的工具接入规范，使 AI Agent 能够以标准化、可追溯、安全可控的方式访问电商系统能力。
- 必须确保 MCP 工具调用遵循现有的 OAuth2.0 认证体系、权限管理机制和业务规则约束，避免引入安全风险。

## 变更内容

### 新增能力：`mall4j-mcp-tooling`

定义 Mall4j 电商系统的 MCP 工具接入与管理规范，具体包括：

#### 1. MCP 服务器注册与连接管理

**1.1 连接方式与协议**
- 采用 **SSE (Server-Sent Events)** 作为 MCP 连接协议，非 stdio 方式
- MCP Server 运行在独立端口（默认 8087），与现有 API 服务（8085/8086）隔离
- 支持通过 HTTP/HTTPS 进行连接，兼容现有的 Nginx 反向代理和跨域配置

**1.2 服务器注册与发现**
- MCP Server 启动时自动向注册中心（Redis）注册自身信息：
  - 服务器标识（server_id）
  - 服务地址（host:port）
  - 支持的工具列表（tool_list）
  - 服务状态（active/inactive）
  - 健康检查端点（/health）
- 支持多实例部署，通过 Redis 实现服务发现和负载均衡

**1.3 连接握手与认证**
- 客户端连接时需提供 OAuth2.0 访问令牌（Access Token）
- MCP Server 通过 Spring Security 验证令牌有效性
- 握手成功后建立 SSE 连接，返回可用工具列表和会话标识（session_id）
- 令牌过期或失效时自动断开连接，要求重新认证

**1.4 健康检查与缓存**
- 提供 `/mcp/health` 端点，返回服务器状态和工具可用性
- 工具列表缓存机制：
  - 首次连接时从数据库加载完整工具定义
  - 缓存至 Redis（TTL 30分钟，可配置）
  - 定期同步更新，支持工具热更新
- 健康探测周期：每 30 秒进行一次心跳检测

#### 2. 工具定义与注册规范

**2.1 电商业务工具分类**

按照 Mall4j 业务模块，定义以下工具类别：

**A. 商品管理工具（Product Tools）**
- `mall4j.product.search` - 商品搜索（支持关键词、分类、价格区间、状态筛选）
- `mall4j.product.get_detail` - 获取商品详情（包含 SKU、规格、库存、价格）
- `mall4j.product.create` - 创建商品（需要 `admin:product:save` 权限）
- `mall4j.product.update` - 更新商品信息（需要 `admin:product:update` 权限）
- `mall4j.product.update_stock` - 更新库存（乐观锁机制，防止超卖）
- `mall4j.product.list_by_tag` - 按分组标签查询商品

**B. 订单管理工具（Order Tools）**
- `mall4j.order.search` - 订单搜索（支持订单号、用户ID、状态、时间范围）
- `mall4j.order.get_detail` - 获取订单详情（包含商品明细、地址、物流、支付信息）
- `mall4j.order.confirm` - 确认订单（计算价格、运费、优惠券）
- `mall4j.order.submit` - 提交订单（扣减库存、生成订单号）
- `mall4j.order.cancel` - 取消订单（恢复库存、退款处理）
- `mall4j.order.get_statistics` - 订单统计分析（销售额、订单量、转化率）

**C. 购物车工具（Cart Tools）**
- `mall4j.cart.get_items` - 获取购物车商品列表
- `mall4j.cart.add_item` - 添加商品到购物车
- `mall4j.cart.update_item` - 更新购物车商品数量
- `mall4j.cart.remove_item` - 从购物车移除商品
- `mall4j.cart.clear` - 清空购物车

**D. 用户管理工具（User Tools）**
- `mall4j.user.search` - 用户搜索
- `mall4j.user.get_profile` - 获取用户资料
- `mall4j.user.get_addresses` - 获取收货地址列表
- `mall4j.user.add_address` - 新增收货地址
- `mall4j.user.get_coupons` - 获取用户优惠券列表

**E. 系统管理工具（Admin Tools）**
- `mall4j.admin.menu.list` - 获取菜单列表（根据权限过滤）
- `mall4j.admin.role.list` - 角色列表查询
- `mall4j.admin.user.create` - 创建管理员用户（需要 `sys:user:save` 权限）
- `mall4j.admin.permission.check` - 权限检查

**2.2 工具定义结构**

每个工具遵循以下 JSON Schema 定义：

```json
{
  "name": "mall4j.product.search",
  "description": "搜索商品，支持关键词、分类、价格区间等多条件组合查询",
  "category": "product",
  "inputSchema": {
    "type": "object",
    "properties": {
      "keyword": {
        "type": "string",
        "description": "商品名称关键词"
      },
      "categoryId": {
        "type": "integer",
        "description": "商品分类ID"
      },
      "minPrice": {
        "type": "number",
        "description": "最低价格（元）"
      },
      "maxPrice": {
        "type": "number",
        "description": "最高价格（元）"
      },
      "status": {
        "type": "integer",
        "enum": [-1, 0, 1],
        "description": "商品状态：1-正常，0-下架，-1-删除"
      },
      "pageNum": {
        "type": "integer",
        "default": 1,
        "description": "页码"
      },
      "pageSize": {
        "type": "integer",
        "default": 10,
        "description": "每页数量"
      }
    }
  },
  "outputSchema": {
    "type": "object",
    "properties": {
      "code": {
        "type": "string",
        "description": "响应状态码"
      },
      "data": {
        "type": "object",
        "properties": {
          "total": {
            "type": "integer",
            "description": "总记录数"
          },
          "list": {
            "type": "array",
            "items": {
              "type": "object",
              "properties": {
                "prodId": {"type": "integer"},
                "prodName": {"type": "string"},
                "price": {"type": "number"},
                "oriPrice": {"type": "number"},
                "pic": {"type": "string"},
                "brief": {"type": "string"},
                "soldNum": {"type": "integer"},
                "totalStocks": {"type": "integer"},
                "status": {"type": "integer"}
              }
            }
          }
        }
      }
    }
  },
  "requiredPermissions": [],
  "rateLimit": {
    "maxCallsPerMinute": 60,
    "maxCallsPerHour": 1000
  },
  "timeout": 5000,
  "retryable": true
}
```

**2.3 工具注册机制**
- 工具定义存储在数据库表 `mcp_tool_definition`
- 支持通过后台管理界面进行工具的启用/禁用/配置修改
- 工具变更后自动推送更新通知到活跃的 MCP 连接
- 版本管理：每个工具定义包含版本号，支持灰度发布

#### 3. 工具权限与绑定关系

**3.1 多维度权限控制**

**按用户角色限定（Role-Based）**
- 继承现有的角色权限体系（`sys_role`、`sys_menu`）
- 每个工具映射到对应的权限标识（如 `admin:product:save`）
- 调用工具前通过 `@PreAuthorize` 注解进行权限校验
- 无权限时返回统一的 401 未授权响应

**按店铺隔离（Shop-Based）**
- 多租户场景下，用户只能访问所属店铺的数据
- 工具调用自动注入 `shopId` 参数（从 OAuth2.0 令牌中提取）
- 数据查询和修改操作强制添加 `shop_id` 过滤条件

**按 API Key 限定（API Key-Based）**
- 支持为第三方系统分配独立的 API Key
- API Key 可绑定特定的工具白名单和调用配额
- 存储在 `mcp_api_key` 表，包含：
  - `api_key`：密钥（加密存储）
  - `shop_id`：所属店铺
  - `allowed_tools`：允许调用的工具列表（JSON 数组）
  - `rate_limit`：调用频率限制
  - `expire_time`：过期时间
  - `status`：启用状态

**3.2 工具绑定关系表**

新增数据库表 `mcp_tool_binding`：

```sql
CREATE TABLE `mcp_tool_binding` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '绑定ID',
  `tool_name` varchar(100) NOT NULL COMMENT '工具名称',
  `bind_type` tinyint NOT NULL COMMENT '绑定类型：1-角色，2-用户，3-API Key',
  `bind_id` bigint NOT NULL COMMENT '绑定对象ID（角色ID/用户ID/API Key ID）',
  `shop_id` bigint DEFAULT NULL COMMENT '店铺ID',
  `status` tinyint DEFAULT 1 COMMENT '状态：1-启用，0-禁用',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_tool_name` (`tool_name`),
  KEY `idx_bind_type_id` (`bind_type`,`bind_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='MCP工具绑定关系表';
```

**3.3 工具选择策略**
- 单一 MCP Server 可注册多个工具源（如商品、订单、用户模块）
- Agent 调用时通过工具名称前缀路由到对应模块（如 `mall4j.product.*`）
- 支持工具别名（alias）机制，允许自定义工具名称映射

#### 4. 工具调用与适配

**4.1 调用流程**

1. **请求接收**：MCP Server 接收 Agent 发送的工具调用请求
2. **身份验证**：验证 OAuth2.0 令牌或 API Key 有效性
3. **权限检查**：根据绑定关系检查工具调用权限
4. **参数校验**：使用 `@Valid` 注解和 Bean Validation 进行参数校验
5. **业务调用**：调用对应的 Service 层方法执行业务逻辑
6. **响应封装**：将业务结果封装为 MCP 标准响应格式
7. **审计日志**：记录调用日志到 `mcp_tool_call_log` 表

**4.2 输入输出校验**

**输入校验**
- 使用 JSON Schema 定义输入参数结构
- Spring Validation 注解进行自动校验（`@NotNull`、`@Size`、`@Min`、`@Max`、`@Email`、`@Pattern`）
- 自定义校验器处理复杂业务规则（如商品价格必须大于 0.01 元）
- 校验失败返回标准错误响应（`METHOD_ARGUMENT_NOT_VALID`）

**输出校验**
- 确保响应符合定义的 Output Schema
- 敏感字段脱敏处理（如用户密码、支付信息）
- 统一响应格式：`ServerResponseEntity<T>`

**4.3 超时与错误降级**

**超时控制**
- 每个工具定义包含 `timeout` 参数（默认 5000ms）
- 使用 `@Async` 和 `CompletableFuture` 实现异步调用
- 超时后返回 `TIMEOUT` 错误码，避免阻塞 Agent 执行流程

**错误降级策略**
- 区分可重试错误（如网络抖动、数据库连接超时）和不可重试错误（如参数错误、权限不足）
- 可重试错误自动重试（最多 3 次，指数退避策略）
- 降级响应：当工具不可用时，返回缓存数据或默认值（如商品搜索失败时返回热门商品列表）
- 熔断机制：连续失败超过阈值时暂时禁用工具，避免雪崩效应

**4.4 事件驱动机制集成**

- 继承现有的事件驱动架构（`ApplicationEventPublisher`）
- 工具调用过程中发布事件：
  - `ToolInvokedEvent` - 工具调用开始
  - `ToolCompletedEvent` - 工具调用成功
  - `ToolFailedEvent` - 工具调用失败
- 事件监听器可实现以下功能：
  - 实时监控和告警
  - 性能指标采集（调用次数、平均耗时、成功率）
  - 业务规则触发（如订单提交后自动发送通知）

#### 5. 追踪与审计

**5.1 调用元数据传递**

在整个工具调用链路中传递以下元数据：

- `trace_id`：全局追踪 ID，标识一次完整的 Agent 执行流程
- `session_id`：会话 ID，对应 MCP SSE 连接
- `user_id`：用户 ID，从 OAuth2.0 令牌中提取
- `shop_id`：店铺 ID，多租户隔离标识
- `agent_id`：Agent 标识，区分不同的 AI Agent 实例
- `tool_call_id`：工具调用 ID，唯一标识单次工具调用
- `parent_call_id`：父调用 ID，支持嵌套调用的追踪

**5.2 审计日志表**

新增数据库表 `mcp_tool_call_log`：

```sql
CREATE TABLE `mcp_tool_call_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `trace_id` varchar(64) NOT NULL COMMENT '追踪ID',
  `session_id` varchar(64) DEFAULT NULL COMMENT '会话ID',
  `tool_call_id` varchar(64) NOT NULL COMMENT '工具调用ID',
  `parent_call_id` varchar(64) DEFAULT NULL COMMENT '父调用ID',
  `tool_name` varchar(100) NOT NULL COMMENT '工具名称',
  `user_id` varchar(64) DEFAULT NULL COMMENT '用户ID',
  `shop_id` bigint DEFAULT NULL COMMENT '店铺ID',
  `agent_id` varchar(100) DEFAULT NULL COMMENT 'Agent标识',
  `input_params` text COMMENT '输入参数（JSON）',
  `output_result` text COMMENT '输出结果（JSON）',
  `status` tinyint NOT NULL COMMENT '状态：1-成功，0-失败',
  `error_code` varchar(20) DEFAULT NULL COMMENT '错误码',
  `error_message` text DEFAULT NULL COMMENT '错误信息',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `duration` int DEFAULT NULL COMMENT '耗时（毫秒）',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_trace_id` (`trace_id`),
  KEY `idx_tool_call_id` (`tool_call_id`),
  KEY `idx_tool_name` (`tool_name`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='MCP工具调用日志表';
```

**5.3 日志收集与分析**

- 实时日志输出到标准输出（stdout），由日志采集系统（如 ELK）统一收集
- 异步写入数据库，避免影响工具调用性能
- 提供日志查询和分析接口：
  - 按追踪 ID 查询完整调用链路
  - 按用户 ID 查询操作历史
  - 按工具名称统计调用频率和成功率
  - 按时间范围生成报表

**5.4 与现有日志系统集成**

- 继承现有的统一日志注解 `@SysLog`
- MCP 工具调用自动记录到系统日志表 `sys_log`
- 日志内容包括：操作类型（MCP_TOOL_CALL）、工具名称、执行结果、IP 地址、执行时长

#### 6. 数据结构定义

**6.1 新增数据库表汇总**

- `mcp_tool_definition` - 工具定义表
- `mcp_tool_binding` - 工具绑定关系表
- `mcp_api_key` - API Key 管理表
- `mcp_tool_call_log` - 工具调用日志表
- `mcp_server_registry` - MCP 服务器注册表（可选，用于多实例管理）

**6.2 配置文件扩展**

在 `application.yml` 中新增配置段：

```yaml
mall4j:
  mcp:
    # MCP Server 基础配置
    server:
      enabled: true
      port: 8087
      context-path: /mcp
      max-connections: 1000
      sse-timeout: 300000  # SSE 连接超时时间（毫秒）
    
    # 工具调用配置
    tool:
      default-timeout: 5000  # 默认超时时间（毫秒）
      max-retries: 3         # 最大重试次数
      cache-enabled: true    # 是否启用工具定义缓存
      cache-ttl: 1800        # 缓存过期时间（秒）
    
    # 权限控制
    security:
      require-auth: true           # 是否要求认证
      token-header: Authorization  # 令牌请求头名称
      api-key-header: X-API-Key    # API Key 请求头名称
    
    # 限流配置
    rate-limit:
      enabled: true
      default-rpm: 60    # 默认每分钟请求数
      default-rph: 1000  # 默认每小时请求数
    
    # 日志审计
    audit:
      enabled: true
      log-input: true    # 是否记录输入参数
      log-output: true   # 是否记录输出结果
      async-write: true  # 是否异步写入日志
```

#### 7. 与现有系统协同

**7.1 与 OAuth2.0 认证模块协同**
- 复用 `yami-shop-security` 模块的认证逻辑
- MCP Server 作为新的资源服务器（Resource Server）
- 令牌验证通过 Spring Security 拦截器实现
- 无需修改现有认证流程，仅扩展资源服务器配置

**7.2 与权限管理模块协同**
- 引用 `yami-shop-sys` 模块的权限管理能力
- 工具权限映射到菜单权限标识（`sys_menu.perms`）
- 通过 `@PreAuthorize("@pms.hasPermission('xxx')")` 进行权限校验
- 新增工具时在菜单管理中配置对应的按钮权限

**7.3 与业务模块协同**
- MCP Server 不实现业务逻辑，仅作为工具调用的入口和适配层
- 底层调用 `yami-shop-service` 中的 Service 接口
- 继承现有的事件驱动机制（`ApplicationEventPublisher`）
- 事务管理、缓存策略、分布式锁等保持一致

**7.4 与异常处理协同**
- 复用 `DefaultExceptionHandlerConfig` 统一异常处理
- MCP 特定异常映射到标准 HTTP 状态码和业务错误码
- 前端错误提示与现有体系一致

## 影响

### 受影响规范
- **新增规范**：`mall4j-mcp-tooling` 能力定义
- **协同规范**（引用，不修改）：
  - `oauth2-authentication`：依赖现有的 OAuth2.0 认证体系
  - `permission-management`：依赖现有的角色权限管理机制
  - `event-driven-architecture`：集成现有的事件驱动架构
  - `unified-exception-handling`：复用统一异常处理规范
  - `distributed-lock`：继承分布式锁机制（如用户操作防重）
  - `audit-logging`：扩展现有的系统日志审计能力

### 受影响代码
- **无直接影响**（仅规范定义，暂不包含实现）
- **未来实现涉及的模块**：
  - 新增模块 `yami-shop-mcp-server`：MCP Server 核心实现
  - 新增模块 `yami-shop-mcp-tools`：电商业务工具定义和适配器
  - 扩展模块 `yami-shop-security`：新增 MCP 资源服务器配置
  - 扩展模块 `yami-shop-sys`：新增 MCP 工具管理界面

### 受影响的部署架构
- 新增 MCP Server 实例部署（端口 8087）
- Nginx 配置需新增 MCP 服务的反向代理规则
- 防火墙规则需开放 8087 端口（可选，根据实际部署方案）

### 不受影响的部分
- 现有 API 接口（8085/8086）功能和行为完全不变
- 前端项目（mall4v、mall4m、mall4uni）无需修改
- 数据库表结构（除新增 MCP 相关表外）无变动
- 现有业务流程和逻辑保持不变

## 附录

### A. 术语表

- **MCP (Model Context Protocol)**：模型上下文协议，用于 AI 模型与外部工具交互的标准协议
- **SSE (Server-Sent Events)**：服务器推送事件，一种基于 HTTP 的服务器向客户端推送数据的技术
- **Trace ID**：追踪标识，用于关联一次完整的分布式调用链路
- **Rate Limit**：限流，限制单位时间内工具调用的频率，防止滥用

### B. 参考资料

- Mall4j 项目文档：`/root/cb/mall4j/doc/`
- Spring Security OAuth2.0 官方文档
- MCP 协议规范（待补充具体链接）

### C. 后续工作

1. **阶段一：基础设施建设**
   - 实现 MCP Server 核心框架（SSE 连接、工具注册、调用路由）
   - 创建数据库表和初始化数据
   - 集成 OAuth2.0 认证和权限校验

2. **阶段二：核心工具实现**
   - 实现商品管理类工具（搜索、详情、创建、更新）
   - 实现订单管理类工具（搜索、详情、确认、提交、取消）
   - 实现购物车类工具（增删改查）

3. **阶段三：高级特性**
   - 实现工具调用的追踪和审计
   - 实现限流和熔断机制
   - 开发后台管理界面（工具配置、权限绑定、日志查询）

4. **阶段四：测试与优化**
   - 单元测试和集成测试
   - 性能测试和压力测试
   - 文档完善和示例代码

### D. 风险评估

| 风险项 | 影响程度 | 缓解措施 |
|--------|---------|---------|
| MCP 协议兼容性问题 | 中 | 采用标准 SSE 协议，提供适配层 |
| 性能开销（日志、追踪） | 中 | 异步处理、批量写入、可配置开关 |
| 权限绕过风险 | 高 | 多层权限校验、审计日志、定期安全审查 |
| 工具调用失败影响业务 | 中 | 降级策略、熔断机制、监控告警 |
| 多实例部署的一致性 | 低 | Redis 缓存同步、分布式锁 |

### E. 变更审批

- **提出人**：[待填写]
- **审批人**：[待填写]
- **审批日期**：[待填写]
- **实施计划**：[待填写]

