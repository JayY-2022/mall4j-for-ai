/*
 * Copyright (c) 2018-2999 广州市蓝海创新科技有限公司 All rights reserved.
 *
 * https://www.mall4j.com/
 *
 * 未经允许，不可做商业用途！
 *
 * 版权所有，侵权必究！
 */

package com.yami.shop.service.impl;

import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.StrUtil;
import com.yami.shop.bean.mcp.dto.McpToolCallRequest;
import com.yami.shop.bean.mcp.dto.McpToolCallResponse;
import com.yami.shop.bean.model.McpBinding;
import com.yami.shop.bean.model.McpServer;
import com.yami.shop.bean.model.McpTool;
import com.yami.shop.bean.model.McpToolCallLog;
import com.yami.shop.common.exception.YamiShopBindException;
import com.yami.shop.service.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * MCP工具调用Service实现（MVP版本）
 * @author mall4j
 */
@Slf4j
@Service
public class McpToolInvokerServiceImpl implements McpToolInvokerService {

    @Autowired
    private McpServerService mcpServerService;

    @Autowired
    private McpToolService mcpToolService;

    @Autowired
    private McpBindingService mcpBindingService;

    @Autowired
    private McpAuditService mcpAuditService;

    @Override
    public McpToolCallResponse invokeTool(McpToolCallRequest request) {
        String toolCallId = IdUtil.simpleUUID();
        Date startTime = new Date();

        try {
            // 1. 解析工具绑定
            McpBinding binding = resolveBinding(request);
            if (binding == null) {
                log.warn("Tool not bound: {}, agent: {}", request.getToolName(), request.getAgentId());
                return McpToolCallResponse.error("BINDING_NOT_FOUND", 
                    "Tool not bound or unauthorized: " + request.getToolName());
            }

            // 2. 检查服务器状态
            McpServer server = mcpServerService.getByServerId(binding.getServerId());
            if (server == null || server.getStatus() != 1) {
                log.warn("Server unavailable: {}", binding.getServerId());
                return McpToolCallResponse.error("SERVER_UNAVAILABLE", 
                    "MCP server is not available: " + binding.getServerId());
            }

            // 3. 获取工具信息
            McpTool tool = mcpToolService.getByServerIdAndToolName(binding.getServerId(), binding.getToolName());
            if (tool == null) {
                return McpToolCallResponse.error("TOOL_NOT_FOUND", 
                    "Tool not found: " + binding.getToolName());
            }

            // 4. 输入校验
            if (!validateInput(tool.getToolName(), request.getArguments())) {
                return McpToolCallResponse.error("INPUT_INVALID", 
                    "Input validation failed for tool: " + tool.getToolName());
            }

            // 5. 调用工具（MVP版本：模拟调用）
            Object result = simulateToolCall(tool, request.getArguments());

            // 6. 记录审计日志
            Date endTime = new Date();
            int duration = (int) (endTime.getTime() - startTime.getTime());
            mcpAuditService.logToolCall(request, binding, toolCallId, 1, result, null, startTime, endTime, duration);

            return McpToolCallResponse.success(result, toolCallId, duration);

        } catch (Exception e) {
            log.error("Tool invocation failed: {}", request.getToolName(), e);
            
            // 记录失败日志
            Date endTime = new Date();
            int duration = (int) (endTime.getTime() - startTime.getTime());
            mcpAuditService.logToolCall(request, null, toolCallId, 0, null, 
                e.getMessage(), startTime, endTime, duration);

            return McpToolCallResponse.error("INVOCATION_ERROR", e.getMessage());
        }
    }

    @Override
    public boolean validateInput(String toolName, Object arguments) {
        // MVP版本：简单校验
        return arguments != null;
    }

    /**
     * 解析工具绑定
     */
    private McpBinding resolveBinding(McpToolCallRequest request) {
        String principalType = "agent";
        String principalId = StrUtil.isNotBlank(request.getAgentId()) ? 
            request.getAgentId() : "default";

        return mcpBindingService.resolveToolName(principalType, principalId, request.getToolName());
    }

    /**
     * 模拟工具调用（MVP版本）
     */
    private Object simulateToolCall(McpTool tool, Object arguments) {
        // MVP版本：返回模拟数据
        log.info("Simulating tool call: {}, args: {}", tool.getToolName(), arguments);
        
        return "{\n" +
               "  \"status\": \"success\",\n" +
               "  \"message\": \"Tool " + tool.getToolName() + " executed successfully (simulated)\",\n" +
               "  \"data\": " + arguments + "\n" +
               "}";
    }
}

