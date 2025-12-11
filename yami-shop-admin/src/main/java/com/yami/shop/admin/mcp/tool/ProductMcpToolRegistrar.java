package com.yami.shop.admin.mcp.tool;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yami.shop.bean.dto.SearchProdDto;
import com.yami.shop.bean.model.Category;
import com.yami.shop.common.bean.Qiniu;
import com.yami.shop.common.util.ImgUploadUtil;
import com.yami.shop.service.CategoryService;
import com.yami.shop.service.ProductService;
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
 * Registers product related MCP tools.
 */
@Slf4j
@Component
public class ProductMcpToolRegistrar extends BaseMcpToolRegistrar {

    // 手机数码分类关键词枚举值
    private static final List<String> MOBILE_KEYWORDS = List.of(
        // 品牌关键词
        "iPhone", "Apple", "华为", "Huawei", "小米", "Xiaomi", "Samsung", "三星",
        // 产品类型关键词
        "手机", "智能手机", "5G手机", "平板", "平板电脑", "iPad", "笔记本", "笔记本电脑", "MacBook",
        "耳机", "无线耳机", "蓝牙耳机", "AirPods", "智能手表", "Watch", "Apple Watch",
        // 具体型号关键词
        "iPhone 15 Pro", "iPhone 15", "iPhone 14", "iPhone 13", "iPhone 12",
        "华为Mate 60", "华为Mate 60 Pro", "华为P60", "华为nova",
        "小米14", "小米13", "小米12", "Redmi",
        "Samsung Galaxy S24", "Samsung Galaxy S23", "Galaxy Note",
        "iPad Pro", "iPad Air", "iPad mini",
        "MacBook Pro", "MacBook Air",
        "AirPods Pro", "AirPods", "AirPods Max",
        "Apple Watch Series 9", "Apple Watch Series 8", "Apple Watch SE"
    );

    // 美妆护肤分类关键词枚举值
    private static final List<String> COSMETICS_KEYWORDS = List.of(
        // 品牌关键词
        "Dior", "Chanel", "SK-II", "L'Oreal", "欧莱雅", "兰蔻", "Lancome", "雅诗兰黛", "Estee Lauder",
        // 产品类型关键词
        "口红", "唇膏", "粉底", "粉底液", "香水", "面膜", "精华", "护肤品", "彩妆", "美妆",
        // 具体产品关键词
        "Dior 口红", "Chanel 香水", "SK-II 神仙水", "L'Oreal 粉底"
    );

    // 运动服饰分类关键词枚举值
    private static final List<String> CLOTHING_KEYWORDS = List.of(
        // 品牌关键词
        "Nike", "Adidas", "阿迪达斯", "Puma", "New Balance",
        // 产品类型关键词
        "运动鞋", "跑步鞋", "篮球鞋", "运动服", "运动套装", "瑜伽垫", "健身器材", "运动", "跑步", "健身",
        // 具体产品关键词
        "Nike Air Max", "Adidas 运动服", "Nike 篮球鞋", "Yoga 瑜伽垫"
    );

    // 美味零食分类关键词枚举值
    private static final List<String> FOOD_KEYWORDS = List.of(
        // 产品类型关键词
        "零食", "薯片", "巧克力", "饮料", "饼干", "糖果", "坚果", "食品",
        // 具体产品关键词
        "费列罗巧克力", "乐事薯片", "奥利奥饼干", "可口可乐", "三只松鼠坚果"
    );

    // 通用商品搜索 Schema（不限制关键词枚举）
    private static final McpSchema.JsonSchema PRODUCT_SEARCH_SCHEMA = new McpSchema.JsonSchema(
        "object",
        Map.of(
            "keyword", Map.of(
                "type", "string", 
                "description", "搜索关键词，支持商品名称、品牌、型号等关键词搜索"
            ),
            "page", Map.of("type", "integer", "minimum", 1, "default", 1, "description", "页码"),
            "pageSize", Map.of("type", "integer", "minimum", 1, "maximum", 100, "default", 10, "description", "每页数量"),
            "sort", Map.of("type", "integer", "enum", List.of(0, 1, 2), "description", "排序方式：0-默认，1-销量，2-价格"),
            "orderBy", Map.of("type", "integer", "enum", List.of(0, 1), "description", "排序顺序：0-降序，1-升序")
        ),
        List.of("keyword"),
        false,
        null,
        null
    );

    // 手机数码搜索 Schema（限制关键词枚举）
    private static final McpSchema.JsonSchema PRODUCT_SEARCH_MOBILE_SCHEMA = new McpSchema.JsonSchema(
        "object",
        Map.of(
            "keyword", Map.of(
                "type", "string",
                "enum", MOBILE_KEYWORDS,
                "description", buildKeywordDescription("手机数码类", MOBILE_KEYWORDS)
            ),
            "page", Map.of("type", "integer", "minimum", 1, "default", 1, "description", "页码"),
            "pageSize", Map.of("type", "integer", "minimum", 1, "maximum", 100, "default", 10, "description", "每页数量"),
            "sort", Map.of("type", "integer", "enum", List.of(0, 1, 2), "description", "排序方式：0-默认，1-销量，2-价格"),
            "orderBy", Map.of("type", "integer", "enum", List.of(0, 1), "description", "排序顺序：0-降序，1-升序")
        ),
        List.of("keyword"),
        false,
        null,
        null
    );

    // 美妆护肤搜索 Schema（限制关键词枚举）
    private static final McpSchema.JsonSchema PRODUCT_SEARCH_COSMETICS_SCHEMA = new McpSchema.JsonSchema(
        "object",
        Map.of(
            "keyword", Map.of(
                "type", "string",
                "enum", COSMETICS_KEYWORDS,
                "description", buildKeywordDescription("美妆护肤类", COSMETICS_KEYWORDS)
            ),
            "page", Map.of("type", "integer", "minimum", 1, "default", 1, "description", "页码"),
            "pageSize", Map.of("type", "integer", "minimum", 1, "maximum", 100, "default", 10, "description", "每页数量"),
            "sort", Map.of("type", "integer", "enum", List.of(0, 1, 2), "description", "排序方式：0-默认，1-销量，2-价格"),
            "orderBy", Map.of("type", "integer", "enum", List.of(0, 1), "description", "排序顺序：0-降序，1-升序")
        ),
        List.of("keyword"),
        false,
        null,
        null
    );

    // 运动服饰搜索 Schema（限制关键词枚举）
    private static final McpSchema.JsonSchema PRODUCT_SEARCH_CLOTHING_SCHEMA = new McpSchema.JsonSchema(
        "object",
        Map.of(
            "keyword", Map.of(
                "type", "string",
                "enum", CLOTHING_KEYWORDS,
                "description", buildKeywordDescription("运动服饰类", CLOTHING_KEYWORDS)
            ),
            "page", Map.of("type", "integer", "minimum", 1, "default", 1, "description", "页码"),
            "pageSize", Map.of("type", "integer", "minimum", 1, "maximum", 100, "default", 10, "description", "每页数量"),
            "sort", Map.of("type", "integer", "enum", List.of(0, 1, 2), "description", "排序方式：0-默认，1-销量，2-价格"),
            "orderBy", Map.of("type", "integer", "enum", List.of(0, 1), "description", "排序顺序：0-降序，1-升序")
        ),
        List.of("keyword"),
        false,
        null,
        null
    );

    // 美味零食搜索 Schema（限制关键词枚举）
    private static final McpSchema.JsonSchema PRODUCT_SEARCH_FOOD_SCHEMA = new McpSchema.JsonSchema(
        "object",
        Map.of(
            "keyword", Map.of(
                "type", "string",
                "enum", FOOD_KEYWORDS,
                "description", buildKeywordDescription("美味零食类", FOOD_KEYWORDS)
            ),
            "page", Map.of("type", "integer", "minimum", 1, "default", 1, "description", "页码"),
            "pageSize", Map.of("type", "integer", "minimum", 1, "maximum", 100, "default", 10, "description", "每页数量"),
            "sort", Map.of("type", "integer", "enum", List.of(0, 1, 2), "description", "排序方式：0-默认，1-销量，2-价格"),
            "orderBy", Map.of("type", "integer", "enum", List.of(0, 1), "description", "排序顺序：0-降序，1-升序")
        ),
        List.of("keyword"),
        false,
        null,
        null
    );

    private static final McpSchema.JsonSchema CATEGORY_LIST_SCHEMA = new McpSchema.JsonSchema(
        "object",
        Map.of(
            "parentId", Map.of("type", "integer", "default", 0, "description", "父分类ID，0表示顶级分类")
        ),
        List.of(),
        false,
        null,
        null
    );

    private final ProductService productService;
    private final CategoryService categoryService;
    private final ImgUploadUtil imgUploadUtil;
    private final Qiniu qiniu;

    public ProductMcpToolRegistrar(ObjectMapper objectMapper, ProductService productService,
                                   CategoryService categoryService, ImgUploadUtil imgUploadUtil, Qiniu qiniu) {
        super(objectMapper);
        this.productService = productService;
        this.categoryService = categoryService;
        this.imgUploadUtil = imgUploadUtil;
        this.qiniu = qiniu;
    }

    @Override
    public void register(McpServer.SyncSpecification<?> builder) {
        builder.toolCall(productSearchTool(), this::handleProductSearch);
        builder.toolCall(productSearchMobileTool(), this::handleProductSearchMobile);
        builder.toolCall(productSearchCosmeticsTool(), this::handleProductSearchCosmetics);
        builder.toolCall(productSearchClothingTool(), this::handleProductSearchClothing);
        builder.toolCall(productSearchFoodTool(), this::handleProductSearchFood);
        builder.toolCall(categoryListTool(), this::handleCategoryList);
        log.info("Registered MCP product tools");
    }

    /**
     * 生成关键词参数的描述文本（用于 inputSchema）
     * 注意：此方法在静态字段初始化时调用，必须是静态方法
     * 
     * @param categoryName 分类名称
     * @param enumValues 枚举值列表
     * @return 关键词参数描述
     */
    private static String buildKeywordDescription(String categoryName, List<String> enumValues) {
        if (enumValues == null || enumValues.isEmpty()) {
            return "搜索关键词，支持商品名称、品牌、型号等关键词搜索";
        }
        
        StringBuilder desc = new StringBuilder("搜索关键词，必须是").append(categoryName).append("有效关键词。");
        desc.append("有效值包括（共").append(enumValues.size()).append("个）：");
        
        if (enumValues.size() <= 15) {
            // 如果枚举值较少，列出所有值
            desc.append(String.join("、", enumValues));
        } else {
            // 如果枚举值较多，显示前10个和后5个
            desc.append(String.join("、", enumValues.subList(0, 10)))
                .append("...")
                .append(String.join("、", enumValues.subList(enumValues.size() - 5, enumValues.size())));
            desc.append("等，完整列表请参考 enum 字段");
        }
        
        return desc.toString();
    }

    /**
     * 生成包含枚举值的工具描述文本
     * 
     * @param baseDescription 基础描述
     * @param enumValues 枚举值列表
     * @return 包含枚举值的完整描述
     */
    private String buildDescriptionWithEnums(String baseDescription, List<String> enumValues) {
        if (enumValues == null || enumValues.isEmpty()) {
            return baseDescription;
        }
        
        StringBuilder description = new StringBuilder(baseDescription);
        description.append("\n\n支持的有效关键词枚举值（共").append(enumValues.size()).append("个）：");
        
        // 如果枚举值数量较少（<=20），列出所有值
        if (enumValues.size() <= 20) {
            String enumList = enumValues.stream()
                .map(v -> "\"" + v + "\"")
                .collect(Collectors.joining("、"));
            description.append(enumList);
        } else {
            // 如果枚举值较多，显示前15个和后5个
            String firstPart = enumValues.subList(0, 15).stream()
                .map(v -> "\"" + v + "\"")
                .collect(Collectors.joining("、"));
            String lastPart = enumValues.subList(enumValues.size() - 5, enumValues.size()).stream()
                .map(v -> "\"" + v + "\"")
                .collect(Collectors.joining("、"));
            description.append(firstPart).append("...").append(lastPart);
            description.append("\n完整列表请参考 inputSchema.keyword.enum");
        }
        
        return description.toString();
    }

    private McpSchema.Tool productSearchTool() {
        return McpSchema.Tool.builder()
            .name("product_search")
            .title("商品搜索")
            .description("根据关键字搜索商城商品。支持搜索所有分类的商品，包括手机数码、美妆护肤、运动服饰、美味零食等。关键词示例：\"iPhone\"、\"华为\"、\"口红\"、\"运动鞋\"、\"零食\"等。\n\n注意：此工具不限制关键词枚举值，可以使用任意关键词进行搜索。")
            .inputSchema(PRODUCT_SEARCH_SCHEMA)
            .build();
    }

    private McpSchema.Tool productSearchMobileTool() {
        String baseDescription = "专门搜索手机数码类商品（包括手机、平板、智能设备等），提高搜索精准度。";
        String description = buildDescriptionWithEnums(baseDescription, MOBILE_KEYWORDS);
        
        return McpSchema.Tool.builder()
            .name("product_search_mobile")
            .title("手机数码搜索")
            .description(description)
            .inputSchema(PRODUCT_SEARCH_MOBILE_SCHEMA)
            .build();
    }

    private McpSchema.Tool productSearchCosmeticsTool() {
        String baseDescription = "专门搜索美妆护肤类商品（包括化妆品、护肤品等），提高搜索精准度。";
        String description = buildDescriptionWithEnums(baseDescription, COSMETICS_KEYWORDS);
        
        return McpSchema.Tool.builder()
            .name("product_search_cosmetics")
            .title("美妆护肤搜索")
            .description(description)
            .inputSchema(PRODUCT_SEARCH_COSMETICS_SCHEMA)
            .build();
    }

    private McpSchema.Tool productSearchClothingTool() {
        String baseDescription = "专门搜索运动服饰类商品（包括运动鞋、运动服、健身器材等），提高搜索精准度。";
        String description = buildDescriptionWithEnums(baseDescription, CLOTHING_KEYWORDS);
        
        return McpSchema.Tool.builder()
            .name("product_search_clothing")
            .title("运动服饰搜索")
            .description(description)
            .inputSchema(PRODUCT_SEARCH_CLOTHING_SCHEMA)
            .build();
    }

    private McpSchema.Tool productSearchFoodTool() {
        String baseDescription = "专门搜索美味零食类商品（包括零食、饮料、食品等），提高搜索精准度。";
        String description = buildDescriptionWithEnums(baseDescription, FOOD_KEYWORDS);
        
        return McpSchema.Tool.builder()
            .name("product_search_food")
            .title("美味零食搜索")
            .description(description)
            .inputSchema(PRODUCT_SEARCH_FOOD_SCHEMA)
            .build();
    }

    private McpSchema.Tool categoryListTool() {
        return McpSchema.Tool.builder()
            .name("category_list")
            .title("分类列表")
            .description("获取商城商品分类，可按父级分类过滤")
            .inputSchema(CATEGORY_LIST_SCHEMA)
            .build();
    }

    private CallToolResult handleProductSearch(McpSyncServerExchange exchange, CallToolRequest request) {
        Map<String, Object> args = request.arguments() == null ? Map.of() : request.arguments();
        String keyword = getString(args, "keyword");
        if (!StringUtils.hasText(keyword)) {
            throw invalidParams("keyword 参数不能为空");
        }

        int pageNum = validateIntRange(args, "page", 1, 1, Integer.MAX_VALUE);
        int pageSize = validateIntRange(args, "pageSize", 10, 1, 100);
        int sort = validateEnum(args, "sort", 0, 0, 1, 2);
        int orderBy = validateEnum(args, "orderBy", 0, 0, 1);

        Page<SearchProdDto> page = new Page<>(pageNum, pageSize);
        IPage<SearchProdDto> productPage = productService.getSearchProdDtoPageByProdName(page, keyword, sort, orderBy);

        // 手动处理图片 URL，避免依赖 ImgJsonSerializer 的注入
        List<Map<String, Object>> records = productPage.getRecords().stream()
            .map(dto -> {
                Map<String, Object> item = new HashMap<>();
                item.put("prodId", dto.getProdId());
                item.put("prodName", dto.getProdName());
                item.put("price", dto.getPrice());
                item.put("prodCommNumber", dto.getProdCommNumber());
                item.put("positiveRating", dto.getPositiveRating());
                item.put("praiseNumber", dto.getPraiseNumber());
                item.put("pic", processImageUrl(dto.getPic()));
                return item;
            })
            .collect(Collectors.toList());

        Map<String, Object> result = new HashMap<>();
        result.put("keyword", keyword);
        result.put("page", productPage.getCurrent());
        result.put("pageSize", productPage.getSize());
        result.put("total", productPage.getTotal());
        result.put("records", records);

        return success(result);
    }

    /**
     * 处理手机数码分类搜索
     * 分类ID: 85 (手机数码，包含子分类：手机通讯、智能设备、珠宝钟表)
     */
    private CallToolResult handleProductSearchMobile(McpSyncServerExchange exchange, CallToolRequest request) {
        return handleProductSearchByCategory(exchange, request, 85L, "手机数码", MOBILE_KEYWORDS);
    }

    /**
     * 处理美妆护肤分类搜索
     * 分类ID: 87
     */
    private CallToolResult handleProductSearchCosmetics(McpSyncServerExchange exchange, CallToolRequest request) {
        return handleProductSearchByCategory(exchange, request, 87L, "美妆护肤", COSMETICS_KEYWORDS);
    }

    /**
     * 处理运动服饰分类搜索
     * 分类ID: 88
     */
    private CallToolResult handleProductSearchClothing(McpSyncServerExchange exchange, CallToolRequest request) {
        return handleProductSearchByCategory(exchange, request, 88L, "运动服饰", CLOTHING_KEYWORDS);
    }

    /**
     * 处理美味零食分类搜索
     * 分类ID: 95
     */
    private CallToolResult handleProductSearchFood(McpSyncServerExchange exchange, CallToolRequest request) {
        return handleProductSearchByCategory(exchange, request, 95L, "美味零食", FOOD_KEYWORDS);
    }

    /**
     * 按分类搜索商品的通用处理方法
     * 支持父分类及其所有子分类的搜索
     */
    private CallToolResult handleProductSearchByCategory(McpSyncServerExchange exchange, CallToolRequest request, Long categoryId, String categoryName, List<String> validKeywords) {
        Map<String, Object> args = request.arguments() == null ? Map.of() : request.arguments();
        
        // 验证关键词枚举值（如果验证失败会抛出 McpError 异常）
        String keyword;
        try {
            keyword = validateKeywordEnum(args, "keyword", validKeywords);
        } catch (io.modelcontextprotocol.spec.McpError e) {
            // 重新抛出 MCP 错误，确保框架能正确处理
            log.error("关键词枚举验证失败: {}", e.getMessage());
            throw e;
        }

        int pageNum = validateIntRange(args, "page", 1, 1, Integer.MAX_VALUE);
        int pageSize = validateIntRange(args, "pageSize", 10, 1, 100);
        int sort = validateEnum(args, "sort", 0, 0, 1, 2);
        int orderBy = validateEnum(args, "orderBy", 0, 0, 1);

        // 获取分类ID列表（包括父分类及其所有子分类）
        List<Long> categoryIds = getCategoryIdsWithChildren(categoryId);

        Page<SearchProdDto> page = new Page<>(pageNum, pageSize);
        IPage<SearchProdDto> productPage = productService.getSearchProdDtoPageByCategoryIdsAndName(page, categoryIds, keyword, sort, orderBy);

        // 手动处理图片 URL，避免依赖 ImgJsonSerializer 的注入
        List<Map<String, Object>> records = productPage.getRecords().stream()
            .map(dto -> {
                Map<String, Object> item = new HashMap<>();
                item.put("prodId", dto.getProdId());
                item.put("prodName", dto.getProdName());
                item.put("price", dto.getPrice());
                item.put("prodCommNumber", dto.getProdCommNumber());
                item.put("positiveRating", dto.getPositiveRating());
                item.put("praiseNumber", dto.getPraiseNumber());
                item.put("pic", processImageUrl(dto.getPic()));
                return item;
            })
            .collect(Collectors.toList());

        Map<String, Object> result = new HashMap<>();
        result.put("categoryId", categoryId);
        result.put("categoryName", categoryName);
        result.put("categoryIds", categoryIds); // 包含所有搜索的分类ID
        result.put("keyword", keyword);
        result.put("page", productPage.getCurrent());
        result.put("pageSize", productPage.getSize());
        result.put("total", productPage.getTotal());
        result.put("records", records);

        return success(result);
    }

    /**
     * 获取分类ID及其所有子分类ID的列表
     * @param categoryId 分类ID
     * @return 包含自身及所有子分类ID的列表
     */
    private List<Long> getCategoryIdsWithChildren(Long categoryId) {
        List<Long> categoryIds = new java.util.ArrayList<>();
        categoryIds.add(categoryId);

        // 获取直接子分类
        List<Category> children = categoryService.listByParentId(categoryId);
        for (Category child : children) {
            categoryIds.add(child.getCategoryId());
            // 如果分类有多级，可以递归获取，但根据当前数据库结构，只有两级，所以这里只获取一级子分类
        }

        return categoryIds;
    }

    private CallToolResult handleCategoryList(McpSyncServerExchange exchange, CallToolRequest request) {
        Map<String, Object> args = request.arguments() == null ? Map.of() : request.arguments();
        long parentId = getLong(args, "parentId", 0L);
        List<Category> categories = categoryService.listByParentId(parentId);

        // 手动处理图片 URL，避免依赖 ImgJsonSerializer 的注入
        List<Map<String, Object>> categoryList = categories.stream()
            .map(category -> {
                Map<String, Object> item = new HashMap<>();
                item.put("categoryId", category.getCategoryId());
                item.put("categoryName", category.getCategoryName());
                item.put("pic", processImageUrl(category.getPic()));
                item.put("parentId", category.getParentId());
                item.put("seq", category.getSeq());
                return item;
            })
            .collect(Collectors.toList());

        Map<String, Object> result = new HashMap<>();
        result.put("parentId", parentId);
        result.put("count", categoryList.size());
        result.put("categories", categoryList);

        return success(result);
    }

    private String getString(Map<String, Object> args, String key) {
        return valueAsString(args.get(key));
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


