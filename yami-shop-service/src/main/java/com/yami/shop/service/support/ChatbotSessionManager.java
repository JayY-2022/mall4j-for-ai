package com.yami.shop.service.support;

import org.springframework.stereotype.Component;

import java.time.Duration;
import java.time.Instant;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@Component
public class ChatbotSessionManager {

    private final Map<String, Instant> lastActivity = new ConcurrentHashMap<>();

    public boolean isExpired(String sessionId, long sessionTimeoutMillis) {
        Instant last = lastActivity.get(sessionId);
        if (last == null) {
            return false;
        }
        return Duration.between(last, Instant.now()).toMillis() >= sessionTimeoutMillis;
    }

    public void touch(String sessionId) {
        lastActivity.put(sessionId, Instant.now());
    }

    public void remove(String sessionId) {
        lastActivity.remove(sessionId);
    }
}

