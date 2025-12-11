package com.yami.shop.service;

import com.yami.shop.bean.model.ChatbotConfig;

/**
 * 智能客服配置服务
 */
public interface ChatbotConfigService {

    /**
     * 获取配置（单例模式，只返回第一条记录）
     * @return 配置对象，如果不存在则返回 null
     */
    ChatbotConfig getConfig();

    /**
     * 保存或更新配置
     * @param config 配置对象
     * @return 是否成功
     */
    boolean saveOrUpdate(ChatbotConfig config);

    /**
     * 获取配置，如果不存在则创建默认配置
     * @return 配置对象
     */
    ChatbotConfig getOrCreateDefault();
}

