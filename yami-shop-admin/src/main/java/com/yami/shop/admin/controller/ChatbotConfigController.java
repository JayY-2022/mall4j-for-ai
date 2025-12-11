package com.yami.shop.admin.controller;

import com.yami.shop.bean.model.ChatbotConfig;
import com.yami.shop.common.response.ServerResponseEntity;
import com.yami.shop.service.ChatbotConfigService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

/**
 * 智能客服配置管理
 */
@RestController
@RequestMapping("/admin/chatbot/config")
@RequiredArgsConstructor
public class ChatbotConfigController {

    private final ChatbotConfigService chatbotConfigService;

    /**
     * 获取配置
     */
    @GetMapping
    @PreAuthorize("@pms.hasPermission('sys:chatbot:config')")
    public ServerResponseEntity<ChatbotConfig> getConfig() {
        ChatbotConfig config = chatbotConfigService.getOrCreateDefault();
        return ServerResponseEntity.success(config);
    }

    /**
     * 更新配置
     */
    @PutMapping
    @PreAuthorize("@pms.hasPermission('sys:chatbot:config')")
    public ServerResponseEntity<Void> updateConfig(@RequestBody ChatbotConfig config) {
        chatbotConfigService.saveOrUpdate(config);
        return ServerResponseEntity.success();
    }
}

