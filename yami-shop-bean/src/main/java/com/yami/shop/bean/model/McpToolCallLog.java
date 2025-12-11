/*
 * Copyright (c) 2018-2999 广州市蓝海创新科技有限公司 All rights reserved.
 *
 * https://www.mall4j.com/
 *
 * 未经允许，不可做商业用途！
 *
 * 版权所有，侵权必究！
 */

package com.yami.shop.bean.model;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * MCP工具调用日志实体
 * @author mall4j
 */
@Data
@TableName("mcp_tool_call_log")
public class McpToolCallLog implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 日志ID
     */
    @TableId
    private Long id;

    /**
     * 追踪ID
     */
    private String traceId;

    /**
     * 会话ID
     */
    private String sessionId;

    /**
     * 工具调用ID
     */
    private String toolCallId;

    /**
     * 父调用ID
     */
    private String parentCallId;

    /**
     * MCP服务器ID
     */
    private String serverId;

    /**
     * 工具名称
     */
    private String toolName;

    /**
     * 用户ID
     */
    private String userId;

    /**
     * 店铺ID
     */
    private Long shopId;

    /**
     * Agent标识
     */
    private String agentId;

    /**
     * 输入参数（JSON）
     */
    private String inputParams;

    /**
     * 输出结果（JSON）
     */
    private String outputResult;

    /**
     * 状态：1-成功，0-失败，2-超时
     */
    private Integer status;

    /**
     * 错误码
     */
    private String errorCode;

    /**
     * 错误信息
     */
    private String errorMessage;

    /**
     * 开始时间
     */
    private Date startTime;

    /**
     * 结束时间
     */
    private Date endTime;

    /**
     * 耗时（毫秒）
     */
    private Integer duration;

    /**
     * 创建时间
     */
    private Date createTime;
}

