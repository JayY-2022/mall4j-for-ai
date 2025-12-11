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
import com.yami.shop.bean.model.McpTool;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * MCP工具Mapper
 * @author mall4j
 */
public interface McpToolMapper extends BaseMapper<McpTool> {

    /**
     * 根据服务器ID获取工具列表
     * @param serverId 服务器ID
     * @return 工具列表
     */
    List<McpTool> listByServerId(@Param("serverId") String serverId);

    /**
     * 根据服务器ID和工具名称获取工具
     * @param serverId 服务器ID
     * @param toolName 工具名称
     * @return 工具信息
     */
    McpTool getByServerIdAndToolName(@Param("serverId") String serverId, @Param("toolName") String toolName);

    /**
     * 批量插入或更新工具
     * @param tools 工具列表
     * @return 影响行数
     */
    int batchInsertOrUpdate(@Param("tools") List<McpTool> tools);

    /**
     * 删除服务器的所有工具
     * @param serverId 服务器ID
     * @return 影响行数
     */
    int deleteByServerId(@Param("serverId") String serverId);
}

