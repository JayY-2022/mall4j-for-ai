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

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yami.shop.bean.model.McpServer;
import com.yami.shop.dao.McpServerMapper;
import com.yami.shop.service.McpServerService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * MCP服务器Service实现
 * @author mall4j
 */
@Slf4j
@Service
public class McpServerServiceImpl extends ServiceImpl<McpServerMapper, McpServer> implements McpServerService {

    @Override
    public List<McpServer> listActiveServers() {
        return baseMapper.listActiveServers();
    }

    @Override
    public McpServer getByServerId(String serverId) {
        return baseMapper.getByServerId(serverId);
    }

    @Override
    public void updateStatus(String serverId, Integer status) {
        baseMapper.updateStatus(serverId, status);
        log.info("Updated MCP server status: serverId={}, status={}", serverId, status);
    }

    @Override
    public void updateHealthCheck(String serverId, Integer retryBackoff) {
        baseMapper.updateHealthCheck(serverId, retryBackoff);
        log.debug("Updated MCP server health check: serverId={}, retryBackoff={}", serverId, retryBackoff);
    }

    @Override
    public void registerOrUpdate(McpServer server) {
        McpServer existing = getByServerId(server.getServerId());
        if (existing != null) {
            server.setId(existing.getId());
            updateById(server);
            log.info("Updated MCP server: {}", server.getServerId());
        } else {
            save(server);
            log.info("Registered new MCP server: {}", server.getServerId());
        }
    }
}

