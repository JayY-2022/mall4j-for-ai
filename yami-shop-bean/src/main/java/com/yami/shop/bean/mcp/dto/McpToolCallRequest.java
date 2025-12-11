/*
 * Copyright (c) 2018-2999 广州市蓝海创新科技有限公司 All rights reserved.
 *
 * https://www.mall4j.com/
 *
 * 未经允许，不可做商业用途！
 *
 * 版权所有，侵权必究！
 */

package com.yami.shop.bean.mcp.dto;

import lombok.Data;

import java.util.Map;

/**
 * MCP工具调用请求
 * @author mall4j
 */
@Data
public class McpToolCallRequest {

    /**
     * 工具名称或别名
     */
    private String toolName;

    /**
     * 输入参数
     */
    private Map<String, Object> arguments;

    /**
     * 追踪ID
     */
    private String traceId;

    /**
     * 会话ID
     */
    private String sessionId;

    /**
     * Agent ID
     */
    private String agentId;

    /**
     * 用户ID
     */
    private String userId;

    /**
     * 店铺ID
     */
    private Long shopId;
}

