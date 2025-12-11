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
import com.yami.shop.bean.model.McpServer;

import java.util.List;

/**
 * MCP服务器Service
 * @author mall4j
 */
public interface McpServerService extends IService<McpServer> {

    /**
     * 获取所有活跃的服务器
     * @return 服务器列表
     */
    List<McpServer> listActiveServers();

    /**
     * 根据服务器ID获取服务器
     * @param serverId 服务器ID
     * @return 服务器信息
     */
    McpServer getByServerId(String serverId);

    /**
     * 更新服务器状态
     * @param serverId 服务器ID
     * @param status 状态
     */
    void updateStatus(String serverId, Integer status);

    /**
     * 更新健康检查信息
     * @param serverId 服务器ID
     * @param retryBackoff 退避系数
     */
    void updateHealthCheck(String serverId, Integer retryBackoff);

    /**
     * 注册或更新服务器
     * @param server 服务器信息
     */
    void registerOrUpdate(McpServer server);
}

