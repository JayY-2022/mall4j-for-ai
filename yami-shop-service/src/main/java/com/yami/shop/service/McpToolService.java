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
import com.yami.shop.bean.model.McpTool;

import java.util.List;

/**
 * MCP工具Service
 * @author mall4j
 */
public interface McpToolService extends IService<McpTool> {

    /**
     * 根据服务器ID获取工具列表
     * @param serverId 服务器ID
     * @return 工具列表
     */
    List<McpTool> listByServerId(String serverId);

    /**
     * 根据服务器ID和工具名称获取工具
     * @param serverId 服务器ID
     * @param toolName 工具名称
     * @return 工具信息
     */
    McpTool getByServerIdAndToolName(String serverId, String toolName);

    /**
     * 批量保存或更新工具
     * @param serverId 服务器ID
     * @param tools 工具列表
     */
    void batchSaveOrUpdate(String serverId, List<McpTool> tools);

    /**
     * 刷新工具缓存
     * @param serverId 服务器ID
     */
    void refreshToolsCache(String serverId);
}

