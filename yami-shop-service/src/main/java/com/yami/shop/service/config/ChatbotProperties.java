package com.yami.shop.service.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Data
@Component
@ConfigurationProperties(prefix = "chatbot.api")
public class ChatbotProperties {

    /**
     * 智能客服系统基础地址
     */
    private String url;

    /**
     * 请求超时时间（毫秒）
     */
    private Integer timeout = 30000;

    /**
     * 会话超时时间（毫秒）
     */
    private Long sessionTimeout = 300000L;

    /**
     * 是否启用
     */
    private boolean enabled = true;

    /**
     * 是否启用记忆功能
     */
    private Boolean memoryEnable = true;

    /**
     * API 路径
     */
    private String apiPath = "/ext/v1/chat/stream";

    /**
     * API Key 用于外部接口认证
     */
    private String apiKey;
}

