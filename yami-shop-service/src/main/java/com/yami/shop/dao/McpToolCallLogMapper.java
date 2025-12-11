/*
 * Copyright (c) 2018-2999 广州市蓝海创新科技有限公司 All rights reserved.
 *
 * https://www.mall4j.com/
 *
 * 未经允许，不可做商业用途！
 *
 * 版权所有，侵权必究！
 */

package com.yami.shop.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yami.shop.bean.model.McpToolCallLog;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * MCP工具调用日志Mapper
 * @author mall4j
 */
public interface McpToolCallLogMapper extends BaseMapper<McpToolCallLog> {

    /**
     * 根据trace_id查询调用链路
     * @param traceId 追踪ID
     * @return 日志列表
     */
    List<McpToolCallLog> listByTraceId(@Param("traceId") String traceId);

    /**
     * 根据用户ID查询操作历史
     * @param page 分页参数
     * @param userId 用户ID
     * @return 日志分页
     */
    IPage<McpToolCallLog> pageByUserId(Page<McpToolCallLog> page, @Param("userId") String userId);

    /**
     * 统计工具调用情况
     * @param serverId 服务器ID（可选）
     * @param toolName 工具名称（可选）
     * @param startTime 开始时间
     * @param endTime 结束时间
     * @return 统计结果
     */
    List<Map<String, Object>> getStatistics(@Param("serverId") String serverId,
                                             @Param("toolName") String toolName,
                                             @Param("startTime") Date startTime,
                                             @Param("endTime") Date endTime);

    /**
     * 批量插入日志（异步）
     * @param logs 日志列表
     * @return 影响行数
     */
    int batchInsert(@Param("logs") List<McpToolCallLog> logs);
}

