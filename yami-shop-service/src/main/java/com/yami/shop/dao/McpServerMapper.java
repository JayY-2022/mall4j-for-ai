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
import com.yami.shop.bean.model.McpServer;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * MCP服务器Mapper
 * @author mall4j
 */
public interface McpServerMapper extends BaseMapper<McpServer> {

    /**
     * 获取所有启用的服务器
     * @return 服务器列表
     */
    List<McpServer> listActiveServers();

    /**
     * 根据服务器ID获取服务器信息
     * @param serverId 服务器ID
     * @return 服务器信息
     */
    McpServer getByServerId(@Param("serverId") String serverId);

    /**
     * 更新服务器状态
     * @param serverId 服务器ID
     * @param status 状态
     * @return 影响行数
     */
    int updateStatus(@Param("serverId") String serverId, @Param("status") Integer status);

    /**
     * 更新服务器健康检查时间和退避系数
     * @param serverId 服务器ID
     * @param retryBackoff 退避系数
     * @return 影响行数
     */
    int updateHealthCheck(@Param("serverId") String serverId, @Param("retryBackoff") Integer retryBackoff);
}

