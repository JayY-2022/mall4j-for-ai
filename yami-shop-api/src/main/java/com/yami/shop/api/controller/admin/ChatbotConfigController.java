package com.yami.shop.api.controller.admin;

import com.yami.shop.bean.model.ChatbotConfig;
import com.yami.shop.common.response.ServerResponseEntity;
import com.yami.shop.security.common.util.AuthUserContext;
import com.yami.shop.service.ChatbotConfigService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 * 智能客服配置管理
 * 注意：此接口用于管理员配置第三方 Agent 服务，与 MCP server 无关
 * 此接口需要管理员权限，通过 AuthFilter 验证用户身份
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
    public ServerResponseEntity<ChatbotConfig> getConfig() {
        // 验证用户已登录（通过 AuthFilter）
        // 使用 AuthUserContext 而不是 SecurityUtils，因为此接口不是 /p/ 开头
        AuthUserContext.get(); // 如果未登录会抛出异常
        ChatbotConfig config = chatbotConfigService.getOrCreateDefault();
        return ServerResponseEntity.success(config);
    }

    /**
     * 更新配置
     */
    @PutMapping
    public ServerResponseEntity<Void> updateConfig(@RequestBody ChatbotConfig config) {
        // 验证用户已登录（通过 AuthFilter）
        // 使用 AuthUserContext 而不是 SecurityUtils，因为此接口不是 /p/ 开头
        AuthUserContext.get(); // 如果未登录会抛出异常
        chatbotConfigService.saveOrUpdate(config);
        return ServerResponseEntity.success();
    }
}

