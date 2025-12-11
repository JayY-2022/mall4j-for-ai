package com.yami.shop.admin.controller;

import com.yami.shop.bean.model.ChatbotConversation;
import com.yami.shop.common.response.ServerResponseEntity;
import com.yami.shop.service.ChatbotService;
import jakarta.validation.constraints.NotBlank;
import lombok.RequiredArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import java.util.List;

@Validated
@RestController
@RequestMapping("/admin/chatbot")
@RequiredArgsConstructor
public class ChatbotController {

    private final ChatbotService chatbotService;

    /**
     * SSE 对话接口
     */
    @GetMapping(value = "/chat", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
    public SseEmitter chat(
        @RequestParam @NotBlank(message = "userId不能为空") String userId,
        @RequestParam(required = false) String sessionId,
        @RequestParam @NotBlank(message = "message不能为空") String message
    ) {
        return chatbotService.chat(userId, sessionId, message);
    }

    /**
     * 获取历史记录
     */
    @GetMapping("/history")
    @PreAuthorize("@pms.hasPermission('sys:chatbot:history')")
    public ServerResponseEntity<List<ChatbotConversation>> history(
        @RequestParam @NotBlank(message = "userId不能为空") String userId,
        @RequestParam(required = false) String sessionId,
        @RequestParam(required = false, defaultValue = "50") Integer limit
    ) {
        return ServerResponseEntity.success(chatbotService.listHistory(userId, sessionId, limit));
    }

    /**
     * 删除会话历史
     */
    @DeleteMapping("/history/{sessionId}")
    @PreAuthorize("@pms.hasPermission('sys:chatbot:history')")
    public ServerResponseEntity<Void> deleteHistory(@PathVariable String sessionId) {
        chatbotService.deleteBySession(sessionId);
        return ServerResponseEntity.success();
    }
}

