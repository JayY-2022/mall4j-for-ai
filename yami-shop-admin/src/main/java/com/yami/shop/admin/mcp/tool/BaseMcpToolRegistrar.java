package com.yami.shop.admin.mcp.tool;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yami.shop.admin.mcp.McpToolRegistrar;
import com.yami.shop.bean.model.User;
import com.yami.shop.service.UserService;
import io.modelcontextprotocol.common.McpTransportContext;
import io.modelcontextprotocol.server.McpServer;
import io.modelcontextprotocol.server.McpSyncServerExchange;
import io.modelcontextprotocol.spec.McpError;
import io.modelcontextprotocol.spec.McpSchema;
import io.modelcontextprotocol.spec.McpSchema.CallToolResult;
import io.modelcontextprotocol.spec.McpSchema.JSONRPCResponse.JSONRPCError;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * MCP 工具注册器基类
 * 提供公共的错误处理和响应构建方法
 */
@Slf4j
public abstract class BaseMcpToolRegistrar implements McpToolRegistrar {

    protected final ObjectMapper objectMapper;
    
    @Autowired(required = false)
    protected UserService userService;
    
    /**
     * 构造函数
     * @param objectMapper JSON 对象映射器
     */
    protected BaseMcpToolRegistrar(ObjectMapper objectMapper) {
        this.objectMapper = objectMapper;
    }

    /**
     * 构建成功响应
     */
    protected CallToolResult success(Object payload) {
        try {
            return CallToolResult.builder()
                .structuredContent(payload)
                .addTextContent(objectMapper.writeValueAsString(payload))
                .isError(false)
                .build();
        } catch (JsonProcessingException e) {
            log.error("结果序列化失败", e);
            throw internalError("结果序列化失败", e);
        }
    }

    /**
     * 构建参数错误
     */
    protected McpError invalidParams(String message) {
        return new McpError(new JSONRPCError(McpSchema.ErrorCodes.INVALID_PARAMS, message, null));
    }

    /**
     * 构建内部错误
     */
    protected McpError internalError(String message, Exception e) {
        // 过滤敏感信息，只返回必要的错误信息
        String detail = e.getMessage();
        if (detail != null && detail.length() > 200) {
            detail = detail.substring(0, 200) + "...";
        }
        return new McpError(new JSONRPCError(McpSchema.ErrorCodes.INTERNAL_ERROR, message,
            Map.of("detail", detail != null ? detail : "未知错误")));
    }

    /**
     * 将参数值转换为字符串
     */
    protected String valueAsString(Object value) {
        return value == null ? null : value.toString();
    }

    /**
     * 将参数值转换为整数
     */
    protected int getInt(Map<String, Object> args, String key, int defaultValue) {
        Object value = args.get(key);
        if (value instanceof Number number) {
            return number.intValue();
        }
        if (value != null) {
            try {
                return Integer.parseInt(value.toString());
            } catch (NumberFormatException e) {
                log.warn("参数 {} 转换失败，使用默认值 {}: {}", key, defaultValue, e.getMessage());
            }
        }
        return defaultValue;
    }

    /**
     * 将参数值转换为长整数
     */
    protected long getLong(Map<String, Object> args, String key, long defaultValue) {
        Object value = args.get(key);
        if (value instanceof Number number) {
            return number.longValue();
        }
        if (value != null) {
            try {
                return Long.parseLong(value.toString());
            } catch (NumberFormatException e) {
                log.warn("参数 {} 转换失败，使用默认值 {}: {}", key, defaultValue, e.getMessage());
            }
        }
        return defaultValue;
    }

    /**
     * 验证整数参数是否在有效范围内
     */
    protected int validateIntRange(Map<String, Object> args, String key, int defaultValue, int min, int max) {
        int value = getInt(args, key, defaultValue);
        if (value < min) {
            log.warn("参数 {} 值 {} 小于最小值 {}，使用最小值", key, value, min);
            return min;
        }
        if (value > max) {
            log.warn("参数 {} 值 {} 大于最大值 {}，使用最大值", key, value, max);
            return max;
        }
        return value;
    }

    /**
     * 验证枚举值
     * 如果值不在有效枚举值中，抛出参数错误异常
     * 
     * @param args 参数映射
     * @param key 参数键
     * @param defaultValue 默认值（当参数不存在时使用）
     * @param validValues 有效的枚举值列表
     * @return 验证后的枚举值
     * @throws McpError 如果值不在有效枚举值中
     */
    protected int validateEnum(Map<String, Object> args, String key, int defaultValue, int... validValues) {
        // 如果参数不存在，使用默认值
        if (!args.containsKey(key)) {
            return defaultValue;
        }
        
        int value = getInt(args, key, defaultValue);
        
        // 检查值是否在有效枚举值中
        for (int validValue : validValues) {
            if (value == validValue) {
                return value;
            }
        }
        
        // 值不在有效枚举值中，抛出错误
        String validValuesStr = Arrays.stream(validValues)
            .mapToObj(String::valueOf)
            .collect(Collectors.joining(", "));
        throw invalidParams(String.format("参数 %s 的值 %d 不在有效枚举值中，有效值为: %s", key, value, validValuesStr));
    }

    /**
     * 验证字符串枚举值（关键词）
     * 如果值不在有效枚举值中，抛出参数错误异常
     * 
     * @param args 参数映射
     * @param key 参数键
     * @param validValues 有效的枚举值列表
     * @return 验证后的关键词
     * @throws McpError 如果值不在有效枚举值中或参数为空
     */
    protected String validateKeywordEnum(Map<String, Object> args, String key, List<String> validValues) {
        String value = valueAsString(args.get(key));
        if (!StringUtils.hasText(value)) {
            log.warn("参数 {} 为空", key);
            throw invalidParams(String.format("参数 %s 不能为空", key));
        }
        
        // 检查值是否在有效枚举值中（不区分大小写）
        String valueLower = value.toLowerCase().trim();
        for (String validValue : validValues) {
            if (validValue.toLowerCase().equals(valueLower)) {
                log.debug("参数 {} 验证通过: {}", key, value);
                return value; // 返回原始值（保持大小写）
            }
        }
        
        // 值不在有效枚举值中，抛出错误
        String validValuesStr = validValues.stream()
            .limit(20) // 限制显示前20个，避免错误信息过长
            .collect(Collectors.joining(", "));
        if (validValues.size() > 20) {
            validValuesStr += " 等（共" + validValues.size() + "个有效值）";
        }
        String errorMessage = String.format("参数 %s 的值 \"%s\" 不在有效枚举值中。有效值包括: %s", key, value, validValuesStr);
        log.warn("参数验证失败: {}", errorMessage);
        throw invalidParams(errorMessage);
    }

    /**
     * 获取用户ID
     * 从参数中获取用户ID
     * 
     * @param exchange MCP 交换对象（暂未使用，保留用于未来扩展）
     * @param args 工具参数
     * @return 用户ID
     * @throws McpError 如果用户ID不存在
     */
    protected String getUserId(McpSyncServerExchange exchange, Map<String, Object> args) {
        // 从参数中获取用户ID
        String userId = valueAsString(args.get("userId"));
        if (StringUtils.hasText(userId)) {
            log.debug("从参数中获取用户ID: {}", userId);
            // 验证用户是否存在
            validateUserId(userId);
            return userId;
        }

        // 如果参数中没有，抛出错误
        throw invalidParams("用户ID不能为空，请通过参数 userId 提供");
    }
    
    /**
     * 验证用户ID是否存在
     * 
     * @param userId 用户ID
     * @throws McpError 如果用户不存在
     */
    protected void validateUserId(String userId) {
        if (userService == null) {
            log.warn("UserService 未注入，跳过用户验证");
            return;
        }
        
        try {
            User user = userService.getUserByUserId(userId);
            if (user == null) {
                log.warn("用户不存在: userId={}", userId);
                throw invalidParams("用户不存在: " + userId);
            }
            log.debug("用户验证通过: userId={}", userId);
        } catch (McpError e) {
            // 重新抛出 MCP 错误
            throw e;
        } catch (Exception e) {
            log.error("验证用户失败: userId={}", userId, e);
            throw internalError("验证用户失败: " + e.getMessage(), e);
        }
    }

    /**
     * 获取用户ID（可选，如果不存在返回null）
     * 
     * @param exchange MCP 交换对象
     * @param args 工具参数
     * @return 用户ID，如果不存在返回null
     */
    protected String getUserIdOptional(McpSyncServerExchange exchange, Map<String, Object> args) {
        try {
            return getUserId(exchange, args);
        } catch (McpError e) {
            return null;
        }
    }
}

