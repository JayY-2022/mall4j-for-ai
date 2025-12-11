package com.yami.shop.admin.mcp.config;

import com.yami.shop.admin.mcp.McpToolRegistrar;
import io.modelcontextprotocol.common.McpTransportContext;
import io.modelcontextprotocol.server.McpServer;
import io.modelcontextprotocol.server.McpSyncServer;
import io.modelcontextprotocol.server.transport.WebMvcSseServerTransportProvider;
import io.modelcontextprotocol.spec.McpSchema;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.ObjectProvider;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.function.RouterFunction;
import org.springframework.web.servlet.function.ServerRequest;
import org.springframework.web.servlet.function.ServerResponse;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * MCP server configuration using the official SDK.
 */
@Slf4j
@Configuration
@RequiredArgsConstructor
public class McpServerConfiguration {

    private static final String MESSAGE_ENDPOINT = "/mcp/message";
    private static final String SSE_ENDPOINT = "/mcp/sse";

    @Bean
    public WebMvcSseServerTransportProvider webMvcSseServerTransportProvider() {
        return WebMvcSseServerTransportProvider.builder()
            .messageEndpoint(MESSAGE_ENDPOINT)
            .sseEndpoint(SSE_ENDPOINT)
            .contextExtractor(this::buildTransportContext)
            .build();
    }

    @Bean
    public RouterFunction<ServerResponse> mcpRouterFunction(WebMvcSseServerTransportProvider provider) {
        return provider.getRouterFunction();
    }

    @Bean(destroyMethod = "closeGracefully")
    public McpSyncServer mcpSyncServer(
        WebMvcSseServerTransportProvider transportProvider,
        ObjectProvider<List<McpToolRegistrar>> registrarProvider
    ) {
        var builder = McpServer.sync(transportProvider)
            .serverInfo("Mall4j MCP Server", "1.0.0")
            .capabilities(
                McpSchema.ServerCapabilities.builder()
                    .tools(true)
                    .logging()
                    .build()
            );

        registrarProvider.ifAvailable(registrars -> registrars.forEach(registrar -> registrar.register(builder)));

        log.info("MCP server configured with endpoints: SSE={}, MESSAGE={}", SSE_ENDPOINT, MESSAGE_ENDPOINT);
        return builder.build();
    }

    private McpTransportContext buildTransportContext(ServerRequest request) {
        Map<String, Object> context = new HashMap<>();
        context.put("requestId", UUID.randomUUID().toString());
        context.put("path", request.path());

        // 提取所有 X- 开头的 Header
        request.headers().asHttpHeaders().forEach((key, values) -> {
            if (key != null && key.startsWith("X-")) {
                context.put(key, values);
            }
        });

        // 特别处理 X-User-Id，提取第一个值作为 userId
        var userIdHeader = request.headers().firstHeader("X-User-Id");
        if (userIdHeader != null && !userIdHeader.isEmpty()) {
            context.put("userId", userIdHeader);
            log.debug("提取用户ID到传输上下文: {}", userIdHeader);
        }

        return McpTransportContext.create(context);
    }
}


