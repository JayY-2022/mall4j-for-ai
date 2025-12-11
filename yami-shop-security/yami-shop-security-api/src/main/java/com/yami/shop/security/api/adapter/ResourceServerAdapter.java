package com.yami.shop.security.api.adapter;

import com.yami.shop.security.common.adapter.DefaultAuthConfigAdapter;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.List;

/**
 * @author 菠萝凤梨
 * @date 2022/3/28 15:17
 */
@Component
public class ResourceServerAdapter extends DefaultAuthConfigAdapter {

    @Override
    public List<String> pathPatterns() {
        return Arrays.asList("/p/*", "/admin/chatbot/config");
    }

    @Override
    public List<String> excludePathPatterns() {
        // 排除不需要认证的路径：登录、注册、token刷新等
        return Arrays.asList(
            "/login",
            "/user/register",
            "/token/refresh",
            "/mcp/**",
            "/admin/mcp/**"
        );
    }
}
