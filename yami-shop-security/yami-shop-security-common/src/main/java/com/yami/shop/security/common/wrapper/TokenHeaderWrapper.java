/*
 * Copyright (c) 2018-2999 广州市蓝海创新科技有限公司 All rights reserved.
 *
 * https://www.mall4j.com/
 *
 * 未经允许，不可做商业用途！
 *
 * 版权所有，侵权必究！
 */
package com.yami.shop.security.common.wrapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletRequestWrapper;
import java.util.Collections;
import java.util.Enumeration;

/**
 * Token 请求头包装器
 * 用于将 URL 参数中的 token 注入到请求头中，以支持 SSE 等无法设置自定义请求头的场景
 * 
 * 工作原理：
 * 1. SSE 请求通过 URL 参数传递 token（如：?token=xxx）
 * 2. 此包装器将 URL 参数中的 token 注入到请求头中（如：Authorization: xxx）
 * 3. sa-token 框架的 StpUtil.checkLogin() 可以从请求头正常读取 token
 * 
 * @author mall4j
 * @date 2024/12/02
 */
public class TokenHeaderWrapper extends HttpServletRequestWrapper {
    
    private final String tokenName;
    private final String tokenValue;
    
    /**
     * 创建 Token 请求头包装器
     * 
     * @param request 原始请求
     * @param tokenName token 请求头名称（如 "Authorization"）
     * @param tokenValue token 值
     */
    public TokenHeaderWrapper(HttpServletRequest request, String tokenName, String tokenValue) {
        super(request);
        this.tokenName = tokenName;
        this.tokenValue = tokenValue;
    }
    
    /**
     * 获取请求头值
     * 如果请求的请求头名称是 tokenName，且原始请求中没有该请求头，则返回注入的 tokenValue
     */
    @Override
    public String getHeader(String name) {
        if (tokenName != null && tokenName.equalsIgnoreCase(name)) {
            // 优先检查原始请求头，如果存在则返回原始值
            String originalHeader = super.getHeader(name);
            if (originalHeader != null) {
                return originalHeader;
            }
            // 如果原始请求头不存在，返回注入的 token
            if (tokenValue != null) {
                return tokenValue;
            }
        }
        return super.getHeader(name);
    }
    
    /**
     * 获取请求头枚举
     * 如果请求的请求头名称是 tokenName，且原始请求中没有该请求头，则返回包含 tokenValue 的枚举
     */
    @Override
    public Enumeration<String> getHeaders(String name) {
        if (tokenName != null && tokenName.equalsIgnoreCase(name)) {
            // 检查原始请求头
            Enumeration<String> originalHeaders = super.getHeaders(name);
            if (originalHeaders.hasMoreElements()) {
                return originalHeaders;
            }
            // 如果原始请求头不存在，返回注入的 token
            if (tokenValue != null) {
                return Collections.enumeration(Collections.singletonList(tokenValue));
            }
        }
        return super.getHeaders(name);
    }
}

