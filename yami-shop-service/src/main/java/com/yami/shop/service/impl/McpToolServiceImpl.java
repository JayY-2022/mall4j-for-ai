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

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yami.shop.bean.model.McpTool;
import com.yami.shop.dao.McpToolMapper;
import com.yami.shop.service.McpToolService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * MCP工具Service实现
 * @author mall4j
 */
@Slf4j
@Service
public class McpToolServiceImpl extends ServiceImpl<McpToolMapper, McpTool> implements McpToolService {

    @Override
    @Cacheable(value = "mcpTools", key = "#serverId")
    public List<McpTool> listByServerId(String serverId) {
        return baseMapper.listByServerId(serverId);
    }

    @Override
    public McpTool getByServerIdAndToolName(String serverId, String toolName) {
        return baseMapper.getByServerIdAndToolName(serverId, toolName);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void batchSaveOrUpdate(String serverId, List<McpTool> tools) {
        if (CollUtil.isEmpty(tools)) {
            return;
        }

        Date now = new Date();
        for (McpTool tool : tools) {
            tool.setServerId(serverId);
            tool.setLastSeen(now);
            
            McpTool existing = getByServerIdAndToolName(serverId, tool.getToolName());
            if (existing != null) {
                tool.setId(existing.getId());
                updateById(tool);
            } else {
                save(tool);
            }
        }

        log.info("Batch saved/updated {} tools for server: {}", tools.size(), serverId);
        refreshToolsCache(serverId);
    }

    @Override
    @CacheEvict(value = "mcpTools", key = "#serverId")
    public void refreshToolsCache(String serverId) {
        log.debug("Refreshed tools cache for server: {}", serverId);
    }
}

