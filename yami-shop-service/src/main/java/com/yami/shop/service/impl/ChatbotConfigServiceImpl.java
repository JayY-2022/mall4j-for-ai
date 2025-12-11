package com.yami.shop.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yami.shop.bean.model.ChatbotConfig;
import com.yami.shop.dao.ChatbotConfigMapper;
import com.yami.shop.service.ChatbotConfigService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

/**
 * 智能客服配置服务实现
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class ChatbotConfigServiceImpl extends ServiceImpl<ChatbotConfigMapper, ChatbotConfig>
    implements ChatbotConfigService {

    @Override
    public ChatbotConfig getConfig() {
        return getOne(new LambdaQueryWrapper<ChatbotConfig>().last("LIMIT 1"));
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean saveOrUpdate(ChatbotConfig config) {
        ChatbotConfig existing = getConfig();
        if (existing != null) {
            config.setId(existing.getId());
            config.setCreateTime(existing.getCreateTime());
            config.setUpdateTime(new Date());
            boolean result = updateById(config);
            log.info("更新智能客服配置: id={}", config.getId());
            return result;
        } else {
            config.setCreateTime(new Date());
            config.setUpdateTime(new Date());
            boolean result = save(config);
            log.info("创建智能客服配置: id={}", config.getId());
            return result;
        }
    }

    @Override
    public ChatbotConfig getOrCreateDefault() {
        ChatbotConfig config = getConfig();
        if (config == null) {
            config = new ChatbotConfig();
            config.setUrl("http://localhost:8000");
            config.setTimeout(30000);
            config.setSessionTimeout(300000L);
            config.setEnabled(true);
            config.setMemoryEnable(true);
            config.setApiPath("/api/chat/stream");
            config.setCreateTime(new Date());
            config.setUpdateTime(new Date());
            save(config);
            log.info("创建默认智能客服配置");
        }
        return config;
    }
}

