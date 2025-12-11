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
import com.yami.shop.bean.model.McpBinding;

import java.util.List;

/**
 * MCP工具绑定Service
 * @author mall4j
 */
public interface McpBindingService extends IService<McpBinding> {

    /**
     * 根据主体获取绑定列表
     * @param principalType 主体类型
     * @param principalId 主体ID
     * @return 绑定列表
     */
    List<McpBinding> listByPrincipal(String principalType, String principalId);

    /**
     * 检查工具是否绑定
     * @param principalType 主体类型
     * @param principalId 主体ID
     * @param serverId 服务器ID
     * @param toolName 工具名称
     * @return 是否绑定
     */
    boolean checkBinding(String principalType, String principalId, String serverId, String toolName);

    /**
     * 解析工具名称（支持别名）
     * @param principalType 主体类型
     * @param principalId 主体ID
     * @param toolNameOrAlias 工具名称或别名
     * @return 绑定信息
     */
    McpBinding resolveToolName(String principalType, String principalId, String toolNameOrAlias);
}

