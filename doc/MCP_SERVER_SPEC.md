## ADDED Requirements

### Requirement: MCP 服务器注册、SSE 握手与健康

系统 MUST 支持对 MCP 服务器进行注册（`server_id`、SSE URL、认证头、超时、代理等配置），通过 SSE 通道（非 stdio）完成握手/工具发现，并保持健康检查；不可用的服务器不得暴露其工具。

#### Scenario: SSE 握手并缓存工具目录

- **GIVEN** 管理员配置了一个 MCP 服务器（包含 `server_id`、SSE 端点、认证信息）
- **WHEN** MCP Server 组件与该服务器建立 SSE 连接并完成握手
- **THEN** 系统 MUST 拉取该服务器的工具列表（名称、描述、输入/输出 schema、版本）并缓存至内存与 `mcp_tools` 表
- **AND** 若握手/健康探测失败（超时/401/404/断线），系统 MUST 将该服务器标记为不可用并停止向 Agent 暴露其工具，同时按指数退避策略重连。

### Requirement: 工具目录持久化与允许列表绑定

系统 MUST 将每个 MCP 工具的元数据持久化，并按 `agent_id` 或 `api_key` 维度维护允许列表；仅允许调用绑定的工具，禁止跨 Agent/租户泄露。

#### Scenario: 拒绝未绑定工具调用

- **GIVEN** Agent A 仅绑定工具 `mall4j.order.get_detail`
- **WHEN** Agent A 请求调用 `mall4j.product.search`
- **THEN** 系统 MUST 拒绝该调用并返回 403/业务错误码，记录到追踪
- **AND** 其他 Agent 对 `mall4j.product.search` 的绑定不受影响。

### Requirement: 输入/输出 schema 校验

系统 MUST 在调用 MCP 工具前后执行 schema 校验；缺少必填字段或类型不符时返回结构化错误，避免产生不确定行为。

#### Scenario: 入参缺失导致校验失败

- **GIVEN** 工具 schema 要求 `orderId` 为必填字符串
- **WHEN** Agent 调用时缺少 `orderId`
- **THEN** 系统 MUST 拒绝调用并返回包含缺失字段说明的错误对象
- **AND** 将该错误写入 trace/audit，供 Agent 生成澄清回复。

### Requirement: 调用超时、重试与降级

系统 MUST 为 MCP 调用设置超时和（可选）幂等重试策略；超时或服务错误时返回可读错误，并不中断整次会话。

#### Scenario: MCP 调用超时

- **GIVEN** 工具调用配置了 5s 超时
- **WHEN** 目标 MCP 服务器在 5s 内无响应
- **THEN** 系统 MUST 返回超时错误并提示可重试/降级
- **AND** 继续运行后续逻辑（如默认回复或其他工具），而不是终止整个 run。

### Requirement: 追踪与审计元数据

系统 MUST 在每次 MCP 工具调用中透传并记录 `trace_id`、`user_id`、`session_id`、`agent_id`、`server_id`、`tool_name`、schema 版本、耗时与结果状态，禁止记录密钥；失败与成功都要闭合 span。

#### Scenario: 记录工具调用追踪

- **GIVEN** 会话携带 `trace_id`、`user_id`、`session_id`、`agent_id`
- **WHEN** Agent 触发 MCP 工具调用
- **THEN** 系统 MUST 在 Langfuse/审计日志中记录工具名、输入校验结果、开始/结束时间、状态（ok/error/timeout）
- **AND** 响应中不得包含敏感凭据，失败同样闭合 span 并写入 `mcp_tool_call_log`。

### Requirement: 多 MCP 服务器并行接入与隔离

系统 MUST 支持多个 MCP 服务器的并行注册与使用，按 `server_id` 或别名区分；绑定、健康状态与追踪互不影响。

#### Scenario: 多服务器隔离与选择

- **GIVEN** 配置了 `serverA` 与 `serverB`，两者部分工具同名
- **WHEN** Agent 调用绑定在 `serverB` 的 `mall4j.product.search`
- **THEN** 系统 MUST 根据绑定解析到 `serverB` 并仅在该服务器上执行；`serverA` 故障不影响此次调用
- **AND** 健康检查与追踪记录需包含 `server_id`，方便区分。

