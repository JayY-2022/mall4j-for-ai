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
 * MCP工具绑定关系实体
 * @author mall4j
 */
@Data
@TableName("mcp_bindings")
public class McpBinding implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键ID
     */
    @TableId
    private Long id;

    /**
     * 主体类型：agent/api_key/tenant
     */
    private String principalType;

    /**
     * 主体ID
     */
    private String principalId;

    /**
     * MCP服务器ID
     */
    private String serverId;

    /**
     * 工具名称
     */
    private String toolName;

    /**
     * 工具别名
     */
    private String alias;

    /**
     * 状态：1-启用，0-禁用
     */
    private Integer status;

    /**
     * 店铺ID
     */
    private Long shopId;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 更新时间
     */
    private Date updateTime;
}

