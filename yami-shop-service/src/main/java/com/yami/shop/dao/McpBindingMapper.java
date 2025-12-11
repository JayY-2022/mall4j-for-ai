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
import com.yami.shop.bean.model.McpBinding;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * MCP工具绑定Mapper
 * @author mall4j
 */
public interface McpBindingMapper extends BaseMapper<McpBinding> {

    /**
     * 根据主体类型和ID获取绑定列表
     * @param principalType 主体类型
     * @param principalId 主体ID
     * @return 绑定列表
     */
    List<McpBinding> listByPrincipal(@Param("principalType") String principalType, 
                                      @Param("principalId") String principalId);

    /**
     * 检查工具是否绑定
     * @param principalType 主体类型
     * @param principalId 主体ID
     * @param serverId 服务器ID
     * @param toolName 工具名称
     * @return 绑定信息
     */
    McpBinding checkBinding(@Param("principalType") String principalType,
                            @Param("principalId") String principalId,
                            @Param("serverId") String serverId,
                            @Param("toolName") String toolName);

    /**
     * 根据别名查找绑定
     * @param principalType 主体类型
     * @param principalId 主体ID
     * @param alias 别名
     * @return 绑定信息
     */
    McpBinding getByAlias(@Param("principalType") String principalType,
                          @Param("principalId") String principalId,
                          @Param("alias") String alias);
}

