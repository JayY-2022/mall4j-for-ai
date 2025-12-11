package com.yami.shop.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yami.shop.bean.model.ChatbotConversation;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ChatbotConversationMapper extends BaseMapper<ChatbotConversation> {
}

