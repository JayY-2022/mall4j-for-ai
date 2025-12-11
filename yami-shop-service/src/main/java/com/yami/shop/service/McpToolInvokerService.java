/*
 * Copyright (c) 2018-2999 广州市蓝海创新科技有限公司 All rights reserved.
 *
 * https://www.mall4j.com/
 *
 * 未经允许，不可做商业用途！
 *
 * 版权所有，侵权必究！
 */

package com.yami.shop.service;

import com.yami.shop.bean.mcp.dto.McpToolCallRequest;
import com.yami.shop.bean.mcp.dto.McpToolCallResponse;

/**
 * MCP工具调用Service
 * @author mall4j
 */
public interface McpToolInvokerService {

    /**
     * 调用MCP工具
     * @param request 调用请求
     * @return 调用响应
     */
    McpToolCallResponse invokeTool(McpToolCallRequest request);

    /**
     * 验证输入参数
     * @param toolName 工具名称
     * @param arguments 参数
     * @return 验证结果
     */
    boolean validateInput(String toolName, Object arguments);
}

