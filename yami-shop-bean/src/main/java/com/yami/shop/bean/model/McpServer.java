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
 * MCP服务器实体
 * @author mall4j
 */
@Data
@TableName("mcp_servers")
public class McpServer implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键ID
     */
    @TableId
    private Long id;

    /**
     * 服务器唯一标识
     */
    private String serverId;

    /**
     * 服务器名称
     */
    private String serverName;

    /**
     * SSE连接端点URL
     */
    private String sseUrl;

    /**
     * 认证信息（JSON格式）
     */
    private String authHeader;

    /**
     * 代理配置
     */
    private String proxy;

    /**
     * 超时时间（毫秒）
     */
    private Integer timeoutMs;

    /**
     * 状态：1-UP，0-DOWN
     */
    private Integer status;

    /**
     * 最后健康检查时间
     */
    private Date lastChecked;

    /**
     * 重试退避系数（秒）
     */
    private Integer retryBackoff;

    /**
     * 服务器描述
     */
    private String description;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 更新时间
     */
    private Date updateTime;
}

