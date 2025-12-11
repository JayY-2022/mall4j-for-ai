package com.yami.shop.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yami.shop.bean.model.ChatbotConfig;
import org.apache.ibatis.annotations.Mapper;

/**
 * 智能客服配置 Mapper
 */
@Mapper
public interface ChatbotConfigMapper extends BaseMapper<ChatbotConfig> {
}

