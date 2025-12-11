/*
 * Copyright (c) 2018-2999 广州市蓝海创新科技有限公司 All rights reserved.
 *
 * https://www.mall4j.com/
 *
 * 未经允许，不可做商业用途！
 *
 * 版权所有，侵权必究！
 */

package com.yami.shop.api.controller.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;

/**
 * 智能客服对话请求 DTO
 * @author lanhai
 */
@Data
public class ChatbotChatRequest {
    
    /**
     * 会话ID（可选）
     */
    private String sessionId;
    
    /**
     * 用户消息（必填）
     */
    @NotBlank(message = "message不能为空")
    private String message;
}

