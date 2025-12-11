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
 * MCP工具实体
 * @author mall4j
 */
@Data
@TableName("mcp_tools")
public class McpTool implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键ID
     */
    @TableId
    private Long id;

    /**
     * 所属服务器ID
     */
    private String serverId;

    /**
     * 工具名称
     */
    private String toolName;

    /**
     * 工具描述
     */
    private String toolDescription;

    /**
     * 工具版本
     */
    private String version;

    /**
     * 输入参数Schema（JSON）
     */
    private String inputSchema;

    /**
     * 输出结果Schema（JSON）
     */
    private String outputSchema;

    /**
     * 工具分类
     */
    private String category;

    /**
     * 调用超时时间（毫秒）
     */
    private Integer timeoutMs;

    /**
     * 是否可重试：1-是，0-否
     */
    private Integer retryable;

    /**
     * 最后发现时间
     */
    private Date lastSeen;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 更新时间
     */
    private Date updateTime;
}

