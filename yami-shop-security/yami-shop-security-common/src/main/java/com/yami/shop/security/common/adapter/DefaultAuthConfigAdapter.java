package com.yami.shop.security.common.adapter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/**
 * @author 菠萝凤梨
 * @date 2022/3/25 17:33
 */
public class DefaultAuthConfigAdapter implements AuthConfigAdapter {
    private static final Logger logger = LoggerFactory.getLogger(DefaultAuthConfigAdapter.class);

    public DefaultAuthConfigAdapter() {
        logger.info("not implement other AuthConfigAdapter, use DefaultAuthConfigAdapter... all url need auth...");
    }

    @Override
    public List<String> pathPatterns() {
        return Collections.singletonList("/*");
    }

    @Override
    public List<String> excludePathPatterns() {
        // 默认排除 MCP 相关路径，确保所有环境都可以访问 MCP 接口
        return Arrays.asList(
            "/mcp/**",
            "/admin/mcp/**"
        );
    }
}
