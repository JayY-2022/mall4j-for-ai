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

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yami.shop.bean.model.McpBinding;
import com.yami.shop.dao.McpBindingMapper;
import com.yami.shop.service.McpBindingService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * MCP工具绑定Service实现
 * @author mall4j
 */
@Slf4j
@Service
public class McpBindingServiceImpl extends ServiceImpl<McpBindingMapper, McpBinding> implements McpBindingService {

    @Override
    @Cacheable(value = "mcpBindings", key = "#principalType + ':' + #principalId")
    public List<McpBinding> listByPrincipal(String principalType, String principalId) {
        return baseMapper.listByPrincipal(principalType, principalId);
    }

    @Override
    public boolean checkBinding(String principalType, String principalId, String serverId, String toolName) {
        McpBinding binding = baseMapper.checkBinding(principalType, principalId, serverId, toolName);
        return binding != null;
    }

    @Override
    public McpBinding resolveToolName(String principalType, String principalId, String toolNameOrAlias) {
        // 先尝试按别名查找
        if (StrUtil.isNotBlank(toolNameOrAlias)) {
            McpBinding binding = baseMapper.getByAlias(principalType, principalId, toolNameOrAlias);
            if (binding != null) {
                return binding;
            }
        }

        // 如果不是别名，尝试按工具名称查找（格式：server_id.tool_name）
        List<McpBinding> bindings = listByPrincipal(principalType, principalId);
        for (McpBinding binding : bindings) {
            String fullName = binding.getServerId() + "." + binding.getToolName();
            if (fullName.equals(toolNameOrAlias) || binding.getToolName().equals(toolNameOrAlias)) {
                return binding;
            }
        }

        return null;
    }
}

