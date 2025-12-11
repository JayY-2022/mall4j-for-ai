/*
 * Copyright (c) 2018-2999 广州市蓝海创新科技有限公司 All rights reserved.
 *
 * https://www.mall4j.com/
 *
 * 未经允许，不可做商业用途！
 *
 * 版权所有，侵权必究！
 */
package com.yami.shop.security.common.filter;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.StrUtil;
import com.yami.shop.common.exception.YamiShopBindException;
import com.yami.shop.common.handler.HttpHandler;
import com.yami.shop.common.response.ResponseEnum;
import com.yami.shop.common.response.ServerResponseEntity;
import com.yami.shop.security.common.adapter.AuthConfigAdapter;
import com.yami.shop.security.common.bo.UserInfoInTokenBO;
import com.yami.shop.security.common.manager.TokenStore;
import com.yami.shop.security.common.util.AuthUserContext;
import com.yami.shop.security.common.wrapper.TokenHeaderWrapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * 授权过滤，只要实现AuthConfigAdapter接口，添加对应路径即可：
 *
 * @author 菠萝凤梨
 * @date 2022/3/25 17:33
 */
@Component
public class AuthFilter implements Filter {

    private static final Logger logger = LoggerFactory.getLogger(AuthFilter.class);

    @Autowired
    private AuthConfigAdapter authConfigAdapter;

    @Autowired
    private HttpHandler httpHandler;

    @Autowired
    private TokenStore tokenStore;

    @Value("${sa-token.token-name}")
    private String tokenName;

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;

        String requestUri = req.getRequestURI();

        List<String> excludePathPatterns = authConfigAdapter.excludePathPatterns();

        AntPathMatcher pathMatcher = new AntPathMatcher();
        // 如果匹配不需要授权的路径，就不需要校验是否需要授权
        if (CollectionUtil.isNotEmpty(excludePathPatterns)) {
            for (String excludePathPattern : excludePathPatterns) {
                if (pathMatcher.match(excludePathPattern, requestUri)) {
                    logger.debug("路径 {} 匹配排除模式 {}，跳过认证检查", requestUri, excludePathPattern);
                    chain.doFilter(req, resp);
                    return;
                }
            }
            // 对于 MCP 路径，记录详细信息以便排查
            if (requestUri.startsWith("/mcp") || requestUri.contains("/mcp/")) {
                logger.warn("MCP 路径 {} 未匹配任何排除模式，需要认证检查。排除模式列表: {}", requestUri, excludePathPatterns);
            }
        } else {
            logger.warn("排除路径列表为空，所有路径都需要认证。当前请求路径: {}", requestUri);
        }

        String accessToken = req.getHeader(tokenName);
        // 对于 SSE 请求（EventSource 不支持自定义请求头），支持从 URL 参数获取 token
        boolean isSseRequest = requestUri.contains("/p/chatbot/chat");
        if (StrUtil.isBlank(accessToken) && isSseRequest) {
            accessToken = req.getParameter("token");
            // 如果从 URL 参数获取到 token，使用 TokenHeaderWrapper 将其注入到请求头中
            // 这样 sa-token 框架的 StpUtil.checkLogin() 就能从请求头正常读取 token
            if (StrUtil.isNotBlank(accessToken)) {
                req = new TokenHeaderWrapper(req, tokenName, accessToken);
            }
        }
        // 也许需要登录，不登陆也能用的uri
        boolean mayAuth = pathMatcher.match(AuthConfigAdapter.MAYBE_AUTH_URI, requestUri);


        UserInfoInTokenBO userInfoInToken = null;

        try {
            // 如果有token，就要获取token
            if (StrUtil.isNotBlank(accessToken)) {
                // 校验登录，并从缓存中取出用户信息
                try {
                    StpUtil.checkLogin();
                } catch (Exception e) {
                    // 对于 SSE 请求，返回 SSE 格式的错误
                    if (isSseRequest) {
                        sendSseError(resp, "Unauthorized: 认证失败，请重新登录");
                    } else {
                        httpHandler.printServerResponseToWeb(ServerResponseEntity.fail(ResponseEnum.UNAUTHORIZED));
                    }
                    return;
                }
                try {
                    userInfoInToken = tokenStore.getUserInfoByAccessToken(accessToken, true);
                } catch (Exception e) {
                    // token 获取失败，对于 SSE 请求，返回 SSE 格式的错误
                    if (isSseRequest) {
                        sendSseError(resp, "Unauthorized: 认证失败，请重新登录");
                    } else {
                        httpHandler.printServerResponseToWeb(ServerResponseEntity.fail(ResponseEnum.UNAUTHORIZED));
                    }
                    return;
                }
            }
            else if (!mayAuth) {
                // 对于 SSE 请求，返回 SSE 格式的错误
                if (isSseRequest) {
                    sendSseError(resp, "Unauthorized: 请先登录");
                } else {
                    httpHandler.printServerResponseToWeb(ServerResponseEntity.fail(ResponseEnum.UNAUTHORIZED));
                }
                return;
            }
            // 保存上下文
            AuthUserContext.set(userInfoInToken);

            chain.doFilter(req, resp);

        }catch (Exception e) {
            // 手动捕获下非controller异常
            // 对于 SSE 请求，统一返回 SSE 格式的错误，避免覆盖响应类型
            if (isSseRequest) {
                String errorMsg = "Internal Server Error";
                if (e instanceof YamiShopBindException) {
                    errorMsg = e.getMessage();
                } else {
                    logger.error("SSE 请求处理异常", e);
                }
                try {
                    sendSseError(resp, errorMsg);
                } catch (IOException ioException) {
                    logger.error("发送 SSE 错误响应失败", ioException);
                }
            } else {
                if (e instanceof YamiShopBindException) {
                    httpHandler.printServerResponseToWeb((YamiShopBindException) e);
                } else {
                    throw e;
                }
            }
        } finally {
            AuthUserContext.clean();
        }
    }
    
    /**
     * 发送 SSE 格式的错误响应
     */
    private void sendSseError(HttpServletResponse resp, String errorMessage) throws IOException {
        resp.setStatus(HttpServletResponse.SC_OK);
        resp.setContentType("text/event-stream");
        resp.setCharacterEncoding("UTF-8");
        resp.setHeader("Cache-Control", "no-cache");
        resp.setHeader("Connection", "keep-alive");
        
        try (java.io.PrintWriter writer = resp.getWriter()) {
            writer.write("event: error\n");
            writer.write("data: " + errorMessage + "\n\n");
            writer.flush();
        }
    }
}
