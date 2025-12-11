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

import cn.hutool.json.JSONUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yami.shop.bean.mcp.dto.McpToolCallRequest;
import com.yami.shop.bean.model.McpBinding;
import com.yami.shop.bean.model.McpToolCallLog;
import com.yami.shop.dao.McpToolCallLogMapper;
import com.yami.shop.service.McpAuditService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * MCP审计Service实现
 * @author mall4j
 */
@Slf4j
@Service
public class McpAuditServiceImpl extends ServiceImpl<McpToolCallLogMapper, McpToolCallLog> implements McpAuditService {

    @Override
    @Async
    public void logToolCall(McpToolCallRequest request, McpBinding binding, String toolCallId,
                           Integer status, Object result, String errorMessage,
                           Date startTime, Date endTime, Integer duration) {
        try {
            McpToolCallLog callLog = new McpToolCallLog();
            callLog.setTraceId(request.getTraceId());
            callLog.setSessionId(request.getSessionId());
            callLog.setToolCallId(toolCallId);
            callLog.setToolName(request.getToolName());
            callLog.setUserId(request.getUserId());
            callLog.setShopId(request.getShopId());
            callLog.setAgentId(request.getAgentId());
            callLog.setInputParams(JSONUtil.toJsonStr(request.getArguments()));
            callLog.setStatus(status);
            callLog.setStartTime(startTime);
            callLog.setEndTime(endTime);
            callLog.setDuration(duration);

            if (binding != null) {
                callLog.setServerId(binding.getServerId());
            }

            if (status == 1) {
                callLog.setOutputResult(result != null ? result.toString() : null);
            } else {
                callLog.setErrorCode("ERROR");
                callLog.setErrorMessage(errorMessage);
            }

            save(callLog);
            
            log.info("Logged tool call: toolCallId={}, status={}, duration={}ms", 
                toolCallId, status, duration);
        } catch (Exception e) {
            log.error("Failed to log tool call: {}", toolCallId, e);
        }
    }

    @Override
    public List<McpToolCallLog> listByTraceId(String traceId) {
        return baseMapper.listByTraceId(traceId);
    }
}

