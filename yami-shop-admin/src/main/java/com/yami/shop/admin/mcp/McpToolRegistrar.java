package com.yami.shop.admin.mcp;

import io.modelcontextprotocol.server.McpServer;

/**
 * Registers MCP tools with the server builder.
 */
@FunctionalInterface
public interface McpToolRegistrar {

    /**
     * Register MCP tools with the provided builder.
     *
     * @param builder MCP server builder
     */
    void register(McpServer.SyncSpecification<?> builder);
}


