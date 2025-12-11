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

/**
 * MCP工具调用响应
 * @author mall4j
 */
@Data
public class McpToolCallResponse {

    /**
     * 状态：ok/error/timeout
     */
    private String status;

    /**
     * 结果数据
     */
    private Object result;

    /**
     * 错误类型
     */
    private String errorType;

    /**
     * 错误信息
     */
    private String errorMessage;

    /**
     * 工具调用ID
     */
    private String toolCallId;

    /**
     * 耗时（毫秒）
     */
    private Integer duration;

    public static McpToolCallResponse success(Object result, String toolCallId, Integer duration) {
        McpToolCallResponse response = new McpToolCallResponse();
        response.setStatus("ok");
        response.setResult(result);
        response.setToolCallId(toolCallId);
        response.setDuration(duration);
        return response;
    }

    public static McpToolCallResponse error(String errorType, String errorMessage) {
        McpToolCallResponse response = new McpToolCallResponse();
        response.setStatus("error");
        response.setErrorType(errorType);
        response.setErrorMessage(errorMessage);
        return response;
    }

    public static McpToolCallResponse timeout(String message) {
        McpToolCallResponse response = new McpToolCallResponse();
        response.setStatus("timeout");
        response.setErrorType("TIMEOUT");
        response.setErrorMessage(message);
        return response;
    }
}

