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

import com.baomidou.mybatisplus.extension.service.IService;
import com.yami.shop.bean.mcp.dto.McpToolCallRequest;
import com.yami.shop.bean.model.McpBinding;
import com.yami.shop.bean.model.McpToolCallLog;

import java.util.Date;
import java.util.List;

/**
 * MCP审计Service
 * @author mall4j
 */
public interface McpAuditService extends IService<McpToolCallLog> {

    /**
     * 记录工具调用日志
     * @param request 请求
     * @param binding 绑定信息
     * @param toolCallId 调用ID
     * @param status 状态
     * @param result 结果
     * @param errorMessage 错误信息
     * @param startTime 开始时间
     * @param endTime 结束时间
     * @param duration 耗时
     */
    void logToolCall(McpToolCallRequest request, McpBinding binding, String toolCallId,
                     Integer status, Object result, String errorMessage,
                     Date startTime, Date endTime, Integer duration);

    /**
     * 根据traceId查询调用链路
     * @param traceId 追踪ID
     * @return 日志列表
     */
    List<McpToolCallLog> listByTraceId(String traceId);
}

