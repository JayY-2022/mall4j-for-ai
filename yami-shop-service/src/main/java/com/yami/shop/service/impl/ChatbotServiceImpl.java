package com.yami.shop.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yami.shop.bean.model.ChatbotConversation;
import com.yami.shop.common.exception.YamiShopBindException;
import com.yami.shop.dao.ChatbotConversationMapper;
import com.yami.shop.bean.model.ChatbotConfig;
import com.yami.shop.service.ChatbotConfigService;
import com.yami.shop.service.ChatbotService;
import com.yami.shop.service.config.ChatbotProperties;
import com.yami.shop.service.support.ChatbotSessionManager;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.time.Instant;
import java.util.*;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

@Slf4j
@Service
@RequiredArgsConstructor
public class ChatbotServiceImpl extends ServiceImpl<ChatbotConversationMapper, ChatbotConversation>
    implements ChatbotService {

    private final ChatbotProperties chatbotProperties;
    private final ChatbotConfigService chatbotConfigService;
    private final ChatbotSessionManager sessionManager;
    private final ObjectMapper objectMapper = new ObjectMapper();
    private final Executor asyncExecutor = Executors.newCachedThreadPool();

    private RestTemplate restTemplate;

    @Override
    public SseEmitter chat(String userId, String sessionId, String message) {
        // 从数据库配置获取设置
        ChatbotConfig config = chatbotConfigService.getOrCreateDefault();
        if (config.getEnabled() == null || !config.getEnabled()) {
            throw new YamiShopBindException("智能客服功能未启用");
        }
        if (!StringUtils.hasText(userId)) {
            throw new YamiShopBindException("用户ID不能为空");
        }
        if (!StringUtils.hasText(message)) {
            throw new YamiShopBindException("请输入要发送的内容");
        }
        // 如果 sessionId 为空，由后端创建新会话（不在这里创建，让 chatbot 返回）
        // 如果 sessionId 不为空，检查是否过期，如果过期则视为新会话（传空给 chatbot）
        String safeSessionId = null;
        if (StringUtils.hasText(sessionId)) {
            // 检查会话是否过期
            long sessionTimeout = config.getSessionTimeout() != null ? config.getSessionTimeout() : 300000L;
            if (sessionManager.isExpired(sessionId, sessionTimeout)) {
                // 会话已过期，视为新会话，传空给 chatbot
                log.info("会话 {} 已过期，开始新会话", sessionId);
                safeSessionId = null;
            } else {
                // 会话未过期，继续使用
                safeSessionId = sessionId;
                sessionManager.touch(safeSessionId);
            }
        }
        // 如果 safeSessionId 为 null，不调用 touch，让 chatbot 创建新会话并返回 session_id
        
        // 创建 final 变量供 lambda 表达式使用
        final String finalSessionId = safeSessionId;

        SseEmitter emitter = new SseEmitter(config.getSessionTimeout() != null ? config.getSessionTimeout() : 300000L);
        CompletableFuture.runAsync(() -> handleChat(userId, finalSessionId, message, emitter), asyncExecutor);
        emitter.onTimeout(() -> {
            try {
                emitter.send(SseEmitter.event().name("timeout").data("会话已超时，请重新开始"));
            } catch (IOException ignored) {
            }
            emitter.complete();
            if (finalSessionId != null) {
                sessionManager.remove(finalSessionId);
            }
        });
        emitter.onCompletion(() -> {
            if (finalSessionId != null) {
                sessionManager.touch(finalSessionId);
            }
        });
        emitter.onError(ex -> {
            if (finalSessionId != null) {
                sessionManager.touch(finalSessionId);
            }
        });
        return emitter;
    }

    @Override
    public List<ChatbotConversation> listHistory(String userId, String sessionId, Integer limit) {
        LambdaQueryWrapper<ChatbotConversation> query = new LambdaQueryWrapper<ChatbotConversation>()
            .eq(ChatbotConversation::getUserId, userId)
            .orderByDesc(ChatbotConversation::getCreateTime);
        if (StringUtils.hasText(sessionId)) {
            query.eq(ChatbotConversation::getSessionId, sessionId);
        }
        if (limit != null && limit > 0) {
            query.last("LIMIT " + limit);
        } else {
            query.last("LIMIT 50");
        }
        List<ChatbotConversation> list = list(query);
        Collections.reverse(list);
        return list;
    }

    @Override
    public void deleteBySession(String sessionId) {
        if (!StringUtils.hasText(sessionId)) {
            return;
        }
        remove(new LambdaQueryWrapper<ChatbotConversation>().eq(ChatbotConversation::getSessionId, sessionId));
        sessionManager.remove(sessionId);
    }

    private void handleChat(String userId, String sessionId, String message, SseEmitter emitter) {
        Instant start = Instant.now();
        try {
            sendUserMessage(emitter, message);
            // 使用流式方式调用第三方 Agent API
            // sessionId 可能为 null（新会话）或有效的 session_id（继续会话）
            StreamResult result = invokeChatbotStream(userId, sessionId, message, emitter);
            // session_id 必须由 chatbot 返回，不能使用传入的 sessionId
            String finalSessionId = null;
            if (StringUtils.hasText(result.sessionId)) {
                // 使用 chatbot 返回的 session_id
                finalSessionId = result.sessionId;
                // 更新会话活动时间
                sessionManager.touch(finalSessionId);
                log.info("使用 chatbot 返回的 session_id: {}", finalSessionId);
            } else {
                // chatbot 没有返回 session_id，这是异常情况，记录警告
                log.warn("chatbot 未返回 session_id，无法保存会话记录。传入的 sessionId: {}", sessionId);
                // 不保存记录，因为无法确定正确的 session_id
            }
            // 保存实际的响应内容，而不是占位符
            String responseText = StringUtils.hasText(result.fullResponse) 
                ? result.fullResponse 
                : "流式响应已发送";
            // 只有在有有效的 session_id 时才保存记录
            if (StringUtils.hasText(finalSessionId)) {
                saveRecord(userId, finalSessionId, message, responseText, 1);
            }
            emitter.send(SseEmitter.event().name("complete").data("done"));
            emitter.complete();
            log.debug("智能客服响应完成, sessionId={}, duration={}ms", sessionId,
                (System.currentTimeMillis() - start.toEpochMilli()));
        } catch (Exception ex) {
            log.error("调用智能客服失败, sessionId={}, message={}", sessionId, message, ex);
            // 错误情况下，如果传入了 sessionId，可以保存错误记录
            // 但理想情况下，应该等待 chatbot 返回 session_id 后再保存
            if (StringUtils.hasText(sessionId)) {
                saveRecord(userId, sessionId, message, ex.getMessage(), 0);
            }
            try {
                emitter.send(SseEmitter.event().name("error").data(ex.getMessage()));
            } catch (IOException ignored) {
            }
            emitter.completeWithError(ex);
        }
    }
    
    /**
     * 内部类：用于返回流式调用的结果
     */
    private static class StreamResult {
        String sessionId;
        String fullResponse;
        
        StreamResult(String sessionId, String fullResponse) {
            this.sessionId = sessionId;
            this.fullResponse = fullResponse;
        }
    }

    private void sendUserMessage(SseEmitter emitter, String message) throws IOException {
        emitter.send(SseEmitter.event().name("ack").data("已收到: " + message));
    }

    private void sendAssistantReply(SseEmitter emitter, String content) throws IOException {
        if (!StringUtils.hasText(content)) {
            content = "抱歉，暂时无法获取回复。";
        }
        emitter.send(SseEmitter.event().name("message").data(content));
    }

    // validateSession 方法已移除，改为在 chat 方法中直接处理会话过期逻辑

    private RestTemplate restTemplate() {
        if (restTemplate == null) {
            SimpleClientHttpRequestFactory factory = new SimpleClientHttpRequestFactory();
            factory.setConnectTimeout(chatbotProperties.getTimeout());
            factory.setReadTimeout(chatbotProperties.getTimeout());
            restTemplate = new RestTemplate(factory);
        }
        return restTemplate;
    }

    /**
     * 流式调用第三方 Agent API
     * @return StreamResult 包含 session_id 和完整的响应内容
     */
    private StreamResult invokeChatbotStream(String userId, String sessionId, String message, SseEmitter emitter) throws IOException {
        ChatbotConfig config = chatbotConfigService.getOrCreateDefault();
        
        // 配置优先级：数据库配置 > 环境变量配置
        // 优先使用数据库配置的 URL，如果数据库配置为空则使用环境变量配置
        String baseUrl = StringUtils.hasText(config.getUrl()) ? config.getUrl() : chatbotProperties.getUrl();
        if (!StringUtils.hasText(baseUrl)) {
            log.error("智能客服 API 地址未配置：数据库配置为空，环境变量配置也为空");
            throw new YamiShopBindException("未配置智能客服API地址，请在管理后台配置或设置环境变量 CHATBOT_API_URL");
        }
        
        // 优先使用数据库配置的 apiPath，如果数据库配置为空则使用环境变量配置，最后使用默认值
        String apiPath = StringUtils.hasText(config.getApiPath()) ? config.getApiPath() : 
                        (StringUtils.hasText(chatbotProperties.getApiPath()) ? chatbotProperties.getApiPath() : null);
        
        String endpoint = buildStreamUrl(baseUrl, apiPath);
        
        // 添加详细日志：记录配置信息和来源
        String configSource = StringUtils.hasText(config.getUrl()) ? "数据库" : "环境变量";
        log.info("调用智能客服流式接口 - 配置来源: {}, baseUrl: {}, apiPath: {}, endpoint: {}, sessionId: {}", 
                configSource, baseUrl, apiPath, endpoint, sessionId != null ? sessionId : "null(新会话)");
        
        // 构建请求体
        Map<String, Object> payload = new LinkedHashMap<>();
        payload.put("user_id", userId);
        // 如果 sessionId 为 null 或空，不传 session_id 字段，让 chatbot 创建新会话
        if (StringUtils.hasText(sessionId)) {
            payload.put("session_id", sessionId);
        }
        payload.put("message", message);
        if (config.getMemoryEnable() != null) {
            payload.put("memory_enabled", config.getMemoryEnable());
        }
        
        String requestBody = objectMapper.writeValueAsString(payload);
        log.debug("请求体: {}", requestBody);
        
        // 使用 HttpURLConnection 进行流式请求
        URL url = new URL(endpoint);
        log.info("准备连接URL: {}", url.toString());
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("POST");
        connection.setRequestProperty("Content-Type", "application/json");
        connection.setRequestProperty("Accept", "text/event-stream");
        // 添加 API Key 认证头（用于外部接口）
        // 优先使用数据库配置的 API Key，如果没有则使用配置文件中的
        String apiKey = StringUtils.hasText(config.getApiKey()) ? config.getApiKey() : chatbotProperties.getApiKey();
        if (StringUtils.hasText(apiKey)) {
            connection.setRequestProperty("X-API-Key", apiKey);
            log.debug("使用 API Key 进行认证");
        }
        connection.setDoOutput(true);
        // 连接超时：30 秒
        connection.setConnectTimeout(config.getTimeout() != null ? config.getTimeout() : 30000);
        // 读取超时：流式响应需要更长时间，设置为 5 分钟（300000 毫秒）
        // 对于流式响应，readLine() 在等待下一行数据时不应该快速超时
        int readTimeout = 300000; // 5 分钟
        connection.setReadTimeout(readTimeout);
        log.debug("设置连接超时: {}ms, 读取超时: {}ms", 
                config.getTimeout() != null ? config.getTimeout() : 30000, readTimeout);
        
        // 发送请求体
        try (java.io.OutputStream os = connection.getOutputStream()) {
            byte[] input = requestBody.getBytes(StandardCharsets.UTF_8);
            os.write(input, 0, input.length);
        }
        
        // 检查响应码
        int responseCode = connection.getResponseCode();
        log.info("收到响应码: {}, URL: {}", responseCode, endpoint);
        if (responseCode != HttpURLConnection.HTTP_OK && responseCode != 200) {
            // 读取错误响应体
            String errorMessage = "第三方 Agent 服务返回错误: " + responseCode;
            try (BufferedReader errorReader = new BufferedReader(
                    new InputStreamReader(connection.getErrorStream(), StandardCharsets.UTF_8))) {
                StringBuilder errorBody = new StringBuilder();
                String errorLine;
                while ((errorLine = errorReader.readLine()) != null) {
                    errorBody.append(errorLine);
                }
                if (errorBody.length() > 0) {
                    errorMessage = "第三方 Agent 服务返回错误 " + responseCode + ": " + errorBody.toString();
                    log.error("错误响应体: {}", errorBody.toString());
                }
            } catch (Exception e) {
                log.warn("无法读取错误响应体: {}", e.getMessage());
            }
            // 如果是 404 错误，提供更详细的诊断信息
            if (responseCode == 404) {
                log.error("调用智能客服失败 - 404 Not Found - URL: {}, 请检查：1) Agent 服务地址是否正确 2) API 路径是否正确 3) Agent 服务是否正在运行", endpoint);
                errorMessage = "第三方 Agent 服务返回错误 404: 请求的接口不存在。请检查 Agent 服务配置（URL: " + endpoint + "）是否正确，或联系管理员检查 Agent 服务状态。";
            } else {
                log.error("调用智能客服失败 - URL: {}, 响应码: {}, 错误信息: {}", endpoint, responseCode, errorMessage);
            }
            throw new YamiShopBindException(errorMessage);
        }
        
        // 读取流式响应 - 边读边转发，实现真正的流式处理
        String returnedSessionId = null;
        StringBuilder fullResponse = new StringBuilder();
        
        try (BufferedReader reader = new BufferedReader(
                new InputStreamReader(connection.getInputStream(), StandardCharsets.UTF_8))) {
            
            String line;
            String currentEvent = null;
            StringBuilder currentData = new StringBuilder();
            int lineCount = 0;
            
            log.info("开始读取流式响应");
            while ((line = reader.readLine()) != null) {
                lineCount++;
                log.debug("读取第 {} 行: [{}] (长度: {})", lineCount, line.length() > 50 ? line.substring(0, 50) + "..." : line, line.length());
                
                if (line.isEmpty()) {
                    // 空行表示一个事件结束，立即处理并转发
                    log.debug("遇到空行，currentData长度: {}, currentEvent: {}", currentData.length(), currentEvent);
                    if (currentData.length() > 0) {
                        String data = currentData.toString();
                        log.info("处理 SSE 事件 - currentEvent: {}, data长度: {}, data前100字符: {}", 
                                currentEvent, data.length(), data.length() > 100 ? data.substring(0, 100) + "..." : data);
                        
                        // 检查是否是 session 事件
                        if ("session".equals(currentEvent)) {
                            // 过滤掉 ping 消息（格式: ": ping - 时间戳"）
                            if (data != null && data.trim().startsWith(": ping")) {
                                log.debug("过滤掉 session 事件中的 ping 消息: {}", data.length() > 50 ? data.substring(0, 50) + "..." : data);
                                // 重置状态，继续处理下一个事件
                                currentEvent = null;
                                currentData.setLength(0);
                            } else {
                                String extractedSessionId = extractSessionId(data);
                                if (StringUtils.hasText(extractedSessionId) && !extractedSessionId.startsWith(": ping")) {
                                    returnedSessionId = extractedSessionId;
                                    emitter.send(SseEmitter.event().name("session").data(returnedSessionId));
                                    log.info("转发 session 事件给前端: {}", returnedSessionId);
                                } else if (StringUtils.hasText(data) && !data.trim().startsWith(": ping")) {
                                    // 如果 session 事件的数据就是 session_id 本身
                                    returnedSessionId = data;
                                    emitter.send(SseEmitter.event().name("session").data(returnedSessionId));
                                    log.info("转发 session 事件给前端（直接数据）: {}", returnedSessionId);
                                } else {
                                    log.debug("过滤掉无效的 session 事件数据: {}", data != null && data.length() > 50 ? data.substring(0, 50) + "..." : data);
                                }
                                // 重置状态，准备下一个事件
                                currentEvent = null;
                                currentData.setLength(0);
                            }
                        } else if ("message".equals(currentEvent) || (currentEvent == null && StringUtils.hasText(data))) {
                            // 消息内容 - 立即转发，不等待
                            // 尝试从 JSON chunk 数据中提取 session_id（Python 后端在 chunk 中包含 session_id）
                            if (returnedSessionId == null && StringUtils.hasText(data)) {
                                String extractedSessionId = extractSessionId(data);
                                if (StringUtils.hasText(extractedSessionId)) {
                                    returnedSessionId = extractedSessionId;
                                    emitter.send(SseEmitter.event().name("session").data(returnedSessionId));
                                    log.info("从消息中提取并转发 session: {}", returnedSessionId);
                                }
                            }
                            // 前端期望接收 JSON 格式的 chunk，直接转发 JSON chunk 给前端
                            // 同时提取纯文本内容用于保存记录
                            if (StringUtils.hasText(data)) {
                                String trimmedData = data.trim();
                                
                                // 过滤掉 ping 消息（格式: ": ping - 时间戳"）
                                if (trimmedData.startsWith(": ping")) {
                                    log.debug("过滤掉 message 事件中的 ping 消息: {}", trimmedData.length() > 50 ? trimmedData.substring(0, 50) + "..." : trimmedData);
                                    // 重置状态，继续处理下一个事件
                                    currentEvent = null;
                                    currentData.setLength(0);
                                } else if (trimmedData.startsWith("@")) {
                                    // 过滤掉日志消息（格式: "@docker (1016-1020)" 等）
                                    log.debug("过滤掉日志消息: {}", trimmedData.length() > 50 ? trimmedData.substring(0, 50) + "..." : trimmedData);
                                    // 重置状态，继续处理下一个事件
                                    currentEvent = null;
                                    currentData.setLength(0);
                                } else if (trimmedData.startsWith("{")) {
                                    // 如果是 JSON 格式，直接转发给前端（前端会解析）
                                    log.info("转发 JSON chunk 给前端 (currentEvent={}): {}", currentEvent, trimmedData.length() > 200 ? trimmedData.substring(0, 200) + "..." : trimmedData);
                                    // 立即发送，不等待
                                    try {
                                        emitter.send(SseEmitter.event().name("message").data(data));
                                        log.debug("JSON chunk 已发送给前端");
                                    } catch (IOException e) {
                                        log.error("发送 JSON chunk 给前端失败", e);
                                        throw e;
                                    }
                                    // 同时提取纯文本内容用于 fullResponse（保存记录用）
                                    String content = extractContentFromChunk(data);
                                    if (StringUtils.hasText(content)) {
                                        fullResponse.append(content);
                                    }
                                    // 重置状态，准备下一个事件
                                    currentEvent = null;
                                    currentData.setLength(0);
                                } else if (!"[DONE]".equals(trimmedData)) {
                                    // 如果不是 JSON 且不是 [DONE]，过滤掉（不转发非JSON的纯文本消息）
                                    log.debug("过滤掉非 JSON 格式的 message 数据: {}", trimmedData.length() > 50 ? trimmedData.substring(0, 50) + "..." : trimmedData);
                                    // 不转发，但可以累积到 fullResponse（如果需要）
                                    // fullResponse.append(data);
                                    // 重置状态，准备下一个事件
                                    currentEvent = null;
                                    currentData.setLength(0);
                                } else {
                                    // [DONE] 的情况，重置状态
                                    currentEvent = null;
                                    currentData.setLength(0);
                                }
                            } else {
                                log.warn("数据为空，跳过转发 (currentEvent={})", currentEvent);
                                // 重置状态，准备下一个事件
                                currentEvent = null;
                                currentData.setLength(0);
                            }
                        } else {
                            // 其他事件类型，重置状态
                            currentEvent = null;
                            currentData.setLength(0);
                        }
                    }
                } else if (line.startsWith("event:")) {
                    currentEvent = line.substring(6).trim();
                    log.info("读取 event 行: {}", currentEvent);
                } else if (line.startsWith("data:")) {
                    String data = line.substring(5).trim();
                    log.info("读取 data 行 (currentEvent={}): {}", currentEvent, data.length() > 100 ? data.substring(0, 100) + "..." : data);
                    if (currentData.length() > 0) {
                        currentData.append("\n");
                    }
                    currentData.append(data);
                    log.debug("currentData 累积后长度: {}", currentData.length());
                } else if (line.startsWith("id:")) {
                    // 忽略 id 字段
                } else if (line.startsWith("retry:")) {
                    // 忽略 retry 字段
                } else if (StringUtils.hasText(line)) {
                    // 如果没有 event 或 data 前缀，可能是纯数据
                    if (currentData.length() > 0) {
                        currentData.append("\n");
                    }
                    currentData.append(line);
                }
            }
            
            log.info("流式响应读取完成，共读取 {} 行，最后 currentData长度: {}, currentEvent: {}", lineCount, currentData.length(), currentEvent);
            
            // 处理最后的事件（流结束时可能没有空行）
            if (currentData.length() > 0) {
                String data = currentData.toString();
                log.info("处理最后 SSE 事件 - currentEvent: {}, data长度: {}, data前100字符: {}", 
                        currentEvent, data.length(), data.length() > 100 ? data.substring(0, 100) + "..." : data);
                
                // 检查是否是 session 事件
                if ("session".equals(currentEvent)) {
                    String extractedSessionId = extractSessionId(data);
                    if (StringUtils.hasText(extractedSessionId)) {
                        returnedSessionId = extractedSessionId;
                        emitter.send(SseEmitter.event().name("session").data(returnedSessionId));
                        log.info("转发 session 事件给前端（最后事件）: {}", returnedSessionId);
                    } else if (StringUtils.hasText(data)) {
                        returnedSessionId = data;
                        emitter.send(SseEmitter.event().name("session").data(returnedSessionId));
                        log.info("转发 session 事件给前端（最后事件，直接数据）: {}", returnedSessionId);
                    }
                } else if ("message".equals(currentEvent) || (currentEvent == null && StringUtils.hasText(data))) {
                    // 消息内容 - 立即转发
                    // 尝试从 JSON chunk 数据中提取 session_id
                    if (returnedSessionId == null && StringUtils.hasText(data)) {
                        String extractedSessionId = extractSessionId(data);
                        if (StringUtils.hasText(extractedSessionId)) {
                            returnedSessionId = extractedSessionId;
                            emitter.send(SseEmitter.event().name("session").data(returnedSessionId));
                            log.info("从消息中提取并转发 session（最后事件）: {}", returnedSessionId);
                        }
                    }
                    // 前端期望接收 JSON 格式的 chunk，直接转发 JSON chunk 给前端
                    if (StringUtils.hasText(data)) {
                        String trimmedData = data.trim();
                        // 过滤掉日志消息（格式: "@docker (1016-1020)" 等）
                        if (trimmedData.startsWith("@")) {
                            log.debug("过滤掉日志消息（最后事件）: {}", trimmedData.length() > 50 ? trimmedData.substring(0, 50) + "..." : trimmedData);
                        } else if (trimmedData.startsWith("{")) {
                            // 如果是 JSON 格式，直接转发给前端（前端会解析）
                            log.info("转发 JSON chunk 给前端（最后事件）: {}", data.length() > 100 ? data.substring(0, 100) + "..." : data);
                            emitter.send(SseEmitter.event().name("message").data(data));
                            // 同时提取纯文本内容用于 fullResponse（保存记录用）
                            String content = extractContentFromChunk(data);
                            if (StringUtils.hasText(content)) {
                                fullResponse.append(content);
                            }
                        } else if (!"[DONE]".equals(trimmedData)) {
                            // 如果不是 JSON 且不是 [DONE]，按原逻辑处理（向后兼容）
                            log.info("转发纯文本给前端（最后事件）: {}", data.length() > 100 ? data.substring(0, 100) + "..." : data);
                            fullResponse.append(data);
                            emitter.send(SseEmitter.event().name("message").data(data));
                        }
                    }
                }
            }
        } finally {
            connection.disconnect();
        }
        
        return new StreamResult(returnedSessionId, fullResponse.toString());
    }
    
    private void handleStreamEvent(String event, String data, SseEmitter emitter) throws IOException {
        if ("ack".equals(event)) {
            emitter.send(SseEmitter.event().name("ack").data(data));
        } else if ("error".equals(event)) {
            emitter.send(SseEmitter.event().name("error").data(data));
        }
        // message 和 session 事件在调用处处理
    }
    
    private String extractSessionId(String data) {
        try {
            // 尝试从 JSON 中提取 session_id
            JsonNode node = objectMapper.readTree(data);
            if (node.has("session_id")) {
                return node.get("session_id").asText();
            }
            if (node.has("sessionId")) {
                return node.get("sessionId").asText();
            }
            // 如果不是 JSON，直接返回数据（假设数据就是 session_id）
            if (StringUtils.hasText(data) && !data.contains("{") && !data.contains("[")) {
                return data.trim();
            }
        } catch (Exception e) {
            // 如果不是 JSON，直接返回数据
            if (StringUtils.hasText(data) && !data.contains("{") && !data.contains("[")) {
                return data.trim();
            }
        }
        return null;
    }
    
    private String buildStreamUrl(String baseUrl, String apiPath) {
        if (!StringUtils.hasText(baseUrl)) {
            throw new YamiShopBindException("未配置智能客服API地址");
        }
        
        // 如果 apiPath 为空，使用默认值（与 getOrCreateDefault 中的默认值保持一致）
        if (!StringUtils.hasText(apiPath)) {
            apiPath = "/api/chat/stream";
            log.warn("apiPath 未配置，使用默认值: {}", apiPath);
        }
        
        // 确保 baseUrl 不以 / 结尾，apiPath 以 / 开头
        String originalBaseUrl = baseUrl;
        if (baseUrl.endsWith("/")) {
            baseUrl = baseUrl.substring(0, baseUrl.length() - 1);
        }
        if (!apiPath.startsWith("/")) {
            apiPath = "/" + apiPath;
        }
        
        String finalUrl = baseUrl + apiPath;
        log.info("构建URL - 原始baseUrl: {}, 处理后baseUrl: {}, apiPath: {}, 最终URL: {}", 
                originalBaseUrl, baseUrl, apiPath, finalUrl);
        return finalUrl;
    }

    /**
     * 保留原有的同步方法作为备用（向后兼容）
     */
    private String invokeChatbot(String userId, String sessionId, String message) {
        try {
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            Map<String, Object> payload = new LinkedHashMap<>();
            payload.put("userId", userId);
            payload.put("sessionId", sessionId);
            payload.put("message", message);
            HttpEntity<Map<String, Object>> requestEntity = new HttpEntity<>(payload, headers);
            String endpoint = buildChatUrl();
            String response = restTemplate().postForObject(URI.create(endpoint), requestEntity, String.class);
            if (!StringUtils.hasText(response)) {
                return "客服系统未返回内容。";
            }
            return extractContent(response);
        } catch (Exception e) {
            throw new YamiShopBindException("智能客服服务异常，请稍后重试");
        }
    }

    private String buildChatUrl() {
        String baseUrl = chatbotProperties.getUrl();
        if (!StringUtils.hasText(baseUrl)) {
            throw new YamiShopBindException("未配置智能客服API地址");
        }
        if (baseUrl.endsWith("/")) {
            return baseUrl + "chat";
        }
        return baseUrl + "/chat";
    }

    private String extractContent(String response) throws IOException {
        JsonNode node = objectMapper.readTree(response.getBytes(StandardCharsets.UTF_8));
        if (node.hasNonNull("content")) {
            return node.get("content").asText();
        }
        if (node.hasNonNull("data")) {
            return node.get("data").asText();
        }
        return response;
    }
    
    /**
     * Extract content from JSON chunk structure: choices[0].delta.content
     * Returns empty string if content is not found or chunk is not valid JSON
     */
    private String extractContentFromChunk(String jsonChunk) {
        try {
            JsonNode node = objectMapper.readTree(jsonChunk.getBytes(StandardCharsets.UTF_8));
            if (node.has("choices") && node.get("choices").isArray() && node.get("choices").size() > 0) {
                JsonNode firstChoice = node.get("choices").get(0);
                if (firstChoice.has("delta") && firstChoice.get("delta").has("content")) {
                    String content = firstChoice.get("delta").get("content").asText();
                    return content != null ? content : "";
                }
            }
            // If not a chunk structure, try to extract as plain text
            if (node.hasNonNull("content")) {
                return node.get("content").asText();
            }
        } catch (Exception e) {
            // Not valid JSON or parsing failed, return empty string
        }
        return "";
    }

    private void saveRecord(String userId, String sessionId, String message, String response, int status) {
        ChatbotConversation record = new ChatbotConversation();
        record.setUserId(userId);
        record.setSessionId(sessionId);
        record.setMessage(message);
        record.setResponse(response);
        record.setStatus(status);
        record.setCreateTime(new Date());
        save(record);
    }
}

