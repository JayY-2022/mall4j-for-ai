package com.yami.shop.admin.mcp.tool;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.yami.shop.bean.app.dto.ShopCartItemDto;
import com.yami.shop.common.bean.Qiniu;
import com.yami.shop.common.util.ImgUploadUtil;
import com.yami.shop.service.BasketService;
import io.modelcontextprotocol.server.McpServer;
import io.modelcontextprotocol.server.McpSyncServerExchange;
import io.modelcontextprotocol.spec.McpSchema;
import io.modelcontextprotocol.spec.McpSchema.CallToolRequest;
import io.modelcontextprotocol.spec.McpSchema.CallToolResult;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * Registers cart related MCP tools.
 */
@Slf4j
@Component
public class CartMcpToolRegistrar extends BaseMcpToolRegistrar {

    private static final McpSchema.JsonSchema CART_VIEW_SCHEMA = new McpSchema.JsonSchema(
        "object",
        Map.of("userId", Map.of("type", "string", "description", "用户ID（可选，如果未提供则从 HTTP Header X-User-Id 获取）")),
        List.of(),
        false,
        null,
        null
    );

    private final BasketService basketService;
    private final ImgUploadUtil imgUploadUtil;
    private final Qiniu qiniu;

    public CartMcpToolRegistrar(ObjectMapper objectMapper, BasketService basketService,
                                ImgUploadUtil imgUploadUtil, Qiniu qiniu) {
        super(objectMapper);
        this.basketService = basketService;
        this.imgUploadUtil = imgUploadUtil;
        this.qiniu = qiniu;
    }

    @Override
    public void register(McpServer.SyncSpecification<?> builder) {
        builder.toolCall(cartViewTool(), this::handleCartView);
        log.info("Registered MCP cart tools");
    }

    private McpSchema.Tool cartViewTool() {
        return McpSchema.Tool.builder()
            .name("cart_view")
            .title("查看购物车")
            .description("根据用户ID获取购物车内容与统计信息。用户ID可通过参数或 HTTP Header X-User-Id 提供")
            .inputSchema(CART_VIEW_SCHEMA)
            .build();
    }

    private CallToolResult handleCartView(McpSyncServerExchange exchange, CallToolRequest request) {
        Map<String, Object> args = request.arguments() == null ? Map.of() : request.arguments();
        
        // 获取用户ID（优先从参数，其次从上下文）
        String userId = getUserId(exchange, args);

        try {
            List<ShopCartItemDto> items = basketService.getShopCartItems(userId);
            
            // 手动处理图片 URL，避免依赖 ImgJsonSerializer 的注入
            List<Map<String, Object>> itemList = items.stream()
                .map(item -> {
                    Map<String, Object> itemMap = new HashMap<>();
                    itemMap.put("basketId", item.getBasketId());
                    itemMap.put("shopId", item.getShopId());
                    itemMap.put("prodId", item.getProdId());
                    itemMap.put("skuId", item.getSkuId());
                    itemMap.put("prodName", item.getProdName());
                    itemMap.put("skuName", item.getSkuName());
                    itemMap.put("pic", processImageUrl(item.getPic()));
                    itemMap.put("price", item.getPrice());
                    itemMap.put("prodCount", item.getProdCount());
                    itemMap.put("productTotalAmount", item.getProductTotalAmount());
                    itemMap.put("actualTotal", item.getActualTotal());
                    itemMap.put("shopName", item.getShopName());
                    itemMap.put("oriPrice", item.getOriPrice());
                    itemMap.put("distributionCardNo", item.getDistributionCardNo());
                    itemMap.put("basketDate", item.getBasketDate());
                    itemMap.put("discountId", item.getDiscountId());
                    itemMap.put("shareReduce", item.getShareReduce());
                    // 不包含 discounts 列表，避免序列化问题
                    return itemMap;
                })
                .collect(Collectors.toList());
            
            int totalCount = items.stream()
                .mapToInt(item -> item.getProdCount() == null ? 0 : item.getProdCount())
                .sum();
            double totalAmount = items.stream()
                .mapToDouble(item -> {
                    Double amount = item.getActualTotal() != null ? item.getActualTotal() : item.getProductTotalAmount();
                    return amount == null ? 0.0 : amount;
                })
                .sum();

            Map<String, Object> result = new HashMap<>();
            result.put("userId", userId);
            result.put("found", !items.isEmpty());
            result.put("count", items.size());
            result.put("totalCount", totalCount);
            result.put("totalAmount", totalAmount);
            result.put("items", itemList);

            return success(result);
        } catch (Exception e) {
            log.error("查询购物车失败: userId={}", userId, e);
            throw internalError("查询购物车失败: " + e.getMessage(), e);
        }
    }


    /**
     * 处理图片 URL，添加资源路径前缀
     */
    private String processImageUrl(String pic) {
        if (pic == null || pic.isEmpty()) {
            return "";
        }
        // 如果已经是完整 URL，直接返回
        if (pic.startsWith("http://") || pic.startsWith("https://")) {
            return pic;
        }
        try {
            Integer uploadType = imgUploadUtil.getUploadType();
            String resourceUrl = "";
            if (uploadType != null) {
                if (uploadType == 2) {
                    // 七牛云
                    resourceUrl = qiniu.getResourcesUrl();
                } else if (uploadType == 1) {
                    // 本地存储
                    resourceUrl = imgUploadUtil.getResourceUrl();
                }
            }
            return resourceUrl + pic;
        } catch (Exception e) {
            log.warn("处理图片 URL 失败: {}", e.getMessage());
            return pic; // 失败时返回原始值
        }
    }
}


