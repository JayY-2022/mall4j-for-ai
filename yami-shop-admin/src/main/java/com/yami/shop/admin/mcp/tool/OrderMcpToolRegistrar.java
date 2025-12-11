package com.yami.shop.admin.mcp.tool;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yami.shop.bean.app.dto.MyOrderDto;
import com.yami.shop.service.MyOrderService;
import io.modelcontextprotocol.server.McpServer;
import io.modelcontextprotocol.server.McpSyncServerExchange;
import io.modelcontextprotocol.spec.McpSchema;
import io.modelcontextprotocol.spec.McpSchema.CallToolRequest;
import io.modelcontextprotocol.spec.McpSchema.CallToolResult;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * Registers order related MCP tools.
 */
@Slf4j
@Component
public class OrderMcpToolRegistrar extends BaseMcpToolRegistrar {

    private static final McpSchema.JsonSchema ORDER_QUERY_SCHEMA = new McpSchema.JsonSchema(
        "object",
        Map.of(
            "userId", Map.of(
                "type", "string",
                "description", "用户ID（可选，如果未提供则从 HTTP Header X-User-Id 获取）"
            ),
            "status", Map.of(
                "type", "integer",
                "enum", List.of(0, 1, 2, 3, 4, 5, 6),
                "description", "订单状态：0-全部，1-待付款，2-待发货，3-待收货，4-待评价，5-交易成功，6-交易失败",
                "default", 0
            ),
            "page", Map.of("type", "integer", "minimum", 1, "default", 1, "description", "页码"),
            "pageSize", Map.of("type", "integer", "minimum", 1, "maximum", 100, "default", 10, "description", "每页数量")
        ),
        List.of(),
        false,
        null,
        null
    );

    private final MyOrderService myOrderService;

    public OrderMcpToolRegistrar(ObjectMapper objectMapper, MyOrderService myOrderService) {
        super(objectMapper);
        this.myOrderService = myOrderService;
    }

    @Override
    public void register(McpServer.SyncSpecification<?> builder) {
        builder.toolCall(orderQueryTool(), this::handleOrderQuery);
        log.info("Registered MCP order tools");
    }

    private McpSchema.Tool orderQueryTool() {
        String description = "根据用户ID和订单状态查询订单列表，支持分页。用户ID可通过参数或 HTTP Header X-User-Id 提供。\n\n" +
            "订单状态枚举值（status参数）：\n" +
            "- 0: 全部\n" +
            "- 1: 待付款\n" +
            "- 2: 待发货\n" +
            "- 3: 待收货\n" +
            "- 4: 待评价\n" +
            "- 5: 交易成功\n" +
            "- 6: 交易失败";
        
        return McpSchema.Tool.builder()
            .name("order_query")
            .title("订单查询")
            .description(description)
            .inputSchema(ORDER_QUERY_SCHEMA)
            .build();
    }

    private CallToolResult handleOrderQuery(McpSyncServerExchange exchange, CallToolRequest request) {
        Map<String, Object> args = request.arguments() == null ? Map.of() : request.arguments();
        
        // 获取用户ID（优先从参数，其次从上下文）
        String userId = getUserId(exchange, args);
        
        // 获取订单状态（0表示全部）
        int status = validateEnum(args, "status", 0, 0, 1, 2, 3, 4, 5, 6);
        
        // 分页参数
        int pageNum = validateIntRange(args, "page", 1, 1, Integer.MAX_VALUE);
        int pageSize = validateIntRange(args, "pageSize", 10, 1, 100);

        try {
            Page<MyOrderDto> page = new Page<>(pageNum, pageSize);
            IPage<MyOrderDto> orderPage = myOrderService.pageMyOrderByUserIdAndStatus(page, userId, status == 0 ? null : status);

            // 构建订单列表（MyOrderDto 包含订单项列表）
            List<Map<String, Object>> orderList = orderPage.getRecords().stream()
                .map(order -> {
                    Map<String, Object> orderMap = new HashMap<>();
                    orderMap.put("orderNumber", order.getOrderNumber());
                    orderMap.put("status", order.getStatus());
                    orderMap.put("statusText", getStatusText(order.getStatus()));
                    orderMap.put("actualTotal", order.getActualTotal());
                    
                    // 处理订单项列表
                    if (order.getOrderItemDtos() != null && !order.getOrderItemDtos().isEmpty()) {
                        List<Map<String, Object>> items = order.getOrderItemDtos().stream()
                            .map(item -> {
                                Map<String, Object> itemMap = new HashMap<>();
                                itemMap.put("pic", item.getPic());
                                itemMap.put("price", item.getPrice());
                                itemMap.put("prodName", item.getProdName());
                                itemMap.put("skuName", item.getSkuName());
                                itemMap.put("prodCount", item.getProdCount());
                                return itemMap;
                            })
                            .collect(Collectors.toList());
                        orderMap.put("items", items);
                        orderMap.put("itemCount", items.size());
                    } else {
                        orderMap.put("items", List.of());
                        orderMap.put("itemCount", 0);
                    }
                    
                    return orderMap;
                })
                .collect(Collectors.toList());

            Map<String, Object> result = new HashMap<>();
            result.put("userId", userId);
            result.put("status", status);
            result.put("statusText", getStatusText(status));
            result.put("page", orderPage.getCurrent());
            result.put("pageSize", orderPage.getSize());
            result.put("total", orderPage.getTotal());
            result.put("count", orderList.size());
            result.put("orders", orderList);

            return success(result);
        } catch (Exception e) {
            log.error("查询订单失败: userId={}, status={}", userId, status, e);
            throw internalError("查询订单失败: " + e.getMessage(), e);
        }
    }

    /**
     * 获取订单状态文本描述
     */
    private String getStatusText(int status) {
        return switch (status) {
            case 0 -> "全部";
            case 1 -> "待付款";
            case 2 -> "待发货";
            case 3 -> "待收货";
            case 4 -> "待评价";
            case 5 -> "交易成功";
            case 6 -> "交易失败";
            default -> "未知";
        };
    }

}


