/*
 * Copyright (c) 2018-2999 广州市蓝海创新科技有限公司 All rights reserved.
 *
 * https://www.mall4j.com/
 *
 * 未经允许，不可做商业用途！
 *
 * 版权所有，侵权必究！
 */

package com.yami.shop.api.controller;

import com.yami.shop.api.controller.dto.ChatbotChatRequest;
import com.yami.shop.bean.model.ChatbotConversation;
import com.yami.shop.common.response.ServerResponseEntity;
import com.yami.shop.security.api.util.SecurityUtils;
import com.yami.shop.service.ChatbotService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import java.util.List;

/**
 * 用户端智能客服接口
 * @author lanhai
 */
@Validated
@RestController
@RequestMapping("/p/chatbot")
@Tag(name = "智能客服接口")
@RequiredArgsConstructor
public class ChatbotController {

    private final ChatbotService chatbotService;

    /**
     * SSE 对话接口
     * 使用 POST 请求，支持在请求头中传递 token（fetch API 支持自定义请求头）
     */
    @PostMapping(value = "/chat", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
    @Operation(summary = "智能客服对话", description = "用户与智能客服进行对话，支持流式响应")
    public SseEmitter chat(@RequestBody @Valid ChatbotChatRequest request) {
        String userId = SecurityUtils.getUser().getUserId();
        return chatbotService.chat(userId, request.getSessionId(), request.getMessage());
    }

    /**
     * 获取历史记录
     */
    @GetMapping("/history")
    @Operation(summary = "获取聊天历史", description = "获取用户的智能客服聊天历史记录")
    public ServerResponseEntity<List<ChatbotConversation>> history(
        @RequestParam(required = false) String sessionId,
        @RequestParam(required = false, defaultValue = "50") Integer limit
    ) {
        String userId = SecurityUtils.getUser().getUserId();
        return ServerResponseEntity.success(chatbotService.listHistory(userId, sessionId, limit));
    }

    /**
     * 删除会话历史
     */
    @DeleteMapping("/history/{sessionId}")
    @Operation(summary = "清空会话历史", description = "删除指定会话的聊天历史记录")
    public ServerResponseEntity<Void> deleteHistory(@PathVariable String sessionId) {
        chatbotService.deleteBySession(sessionId);
        return ServerResponseEntity.success();
    }
}

