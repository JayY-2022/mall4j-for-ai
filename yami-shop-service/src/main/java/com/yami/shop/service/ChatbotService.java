package com.yami.shop.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.yami.shop.bean.model.ChatbotConversation;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import java.util.List;

public interface ChatbotService extends IService<ChatbotConversation> {

    SseEmitter chat(String userId, String sessionId, String message);

    List<ChatbotConversation> listHistory(String userId, String sessionId, Integer limit);

    void deleteBySession(String sessionId);
}

