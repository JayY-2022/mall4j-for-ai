/*
 * Copyright (c) 2018-2999 广州市蓝海创新科技有限公司 All rights reserved.
 *
 * https://www.mall4j.com/
 *
 * 未经允许，不可做商业用途！
 *
 * 版权所有，侵权必究！
 */

package com.yami.shop.admin.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yami.shop.bean.mcp.dto.McpToolCallRequest;
import com.yami.shop.bean.mcp.dto.McpToolCallResponse;
import com.yami.shop.bean.model.*;
import com.yami.shop.common.response.ServerResponseEntity;
import com.yami.shop.service.*;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import jakarta.validation.Valid;
import java.util.List;

/**
 * MCP管理Controller
 * @author mall4j
 */
@Slf4j
@RestController
@RequestMapping("/admin/mcp")
@Tag(name = "MCP工具管理")
public class McpController {

    @Autowired
    private McpServerService mcpServerService;

    @Autowired
    private McpToolService mcpToolService;

    @Autowired
    private McpBindingService mcpBindingService;

    @Autowired
    private McpToolInvokerService mcpToolInvokerService;

    @Autowired
    private McpAuditService mcpAuditService;

    // ========== MCP Server管理 ==========

    @GetMapping("/servers")
    @Operation(summary = "获取MCP服务器列表")
    public ServerResponseEntity<IPage<McpServer>> listServers(@RequestParam(defaultValue = "1") Integer pageNum,
                                                               @RequestParam(defaultValue = "10") Integer pageSize) {
        Page<McpServer> page = new Page<>(pageNum, pageSize);
        IPage<McpServer> serverPage = mcpServerService.page(page);
        return ServerResponseEntity.success(serverPage);
    }

    @GetMapping("/servers/active")
    @Operation(summary = "获取活跃的MCP服务器")
    public ServerResponseEntity<List<McpServer>> listActiveServers() {
        return ServerResponseEntity.success(mcpServerService.listActiveServers());
    }

    @GetMapping("/servers/{serverId}")
    @Operation(summary = "获取MCP服务器详情")
    public ServerResponseEntity<McpServer> getServer(@PathVariable String serverId) {
        return ServerResponseEntity.success(mcpServerService.getByServerId(serverId));
    }

    @PostMapping("/servers")
    @Operation(summary = "注册MCP服务器")
    public ServerResponseEntity<Void> registerServer(@Valid @RequestBody McpServer server) {
        mcpServerService.registerOrUpdate(server);
        return ServerResponseEntity.success();
    }

    @PutMapping("/servers/{serverId}/status")
    @Operation(summary = "更新服务器状态")
    public ServerResponseEntity<Void> updateServerStatus(@PathVariable String serverId,
                                                         @RequestParam Integer status) {
        mcpServerService.updateStatus(serverId, status);
        return ServerResponseEntity.success();
    }

    @DeleteMapping("/servers/{id}")
    @Operation(summary = "删除MCP服务器")
    public ServerResponseEntity<Void> deleteServer(@PathVariable Long id) {
        mcpServerService.removeById(id);
        return ServerResponseEntity.success();
    }

    // ========== MCP Tool管理 ==========

    @GetMapping("/tools")
    @Operation(summary = "获取工具列表")
    public ServerResponseEntity<List<McpTool>> listTools(@RequestParam(required = false) String serverId) {
        if (serverId != null) {
            return ServerResponseEntity.success(mcpToolService.listByServerId(serverId));
        }
        return ServerResponseEntity.success(mcpToolService.list());
    }

    @GetMapping("/tools/{serverId}/{toolName}")
    @Operation(summary = "获取工具详情")
    public ServerResponseEntity<McpTool> getTool(@PathVariable String serverId,
                                                 @PathVariable String toolName) {
        return ServerResponseEntity.success(
            mcpToolService.getByServerIdAndToolName(serverId, toolName));
    }

    @PostMapping("/tools/refresh/{serverId}")
    @Operation(summary = "刷新工具缓存")
    public ServerResponseEntity<Void> refreshTools(@PathVariable String serverId) {
        mcpToolService.refreshToolsCache(serverId);
        return ServerResponseEntity.success();
    }

    // ========== MCP Binding管理 ==========

    @GetMapping("/bindings")
    @Operation(summary = "获取工具绑定列表")
    public ServerResponseEntity<List<McpBinding>> listBindings(@RequestParam String principalType,
                                                               @RequestParam String principalId) {
        return ServerResponseEntity.success(
            mcpBindingService.listByPrincipal(principalType, principalId));
    }

    @PostMapping("/bindings")
    @Operation(summary = "创建工具绑定")
    public ServerResponseEntity<Void> createBinding(@Valid @RequestBody McpBinding binding) {
        mcpBindingService.save(binding);
        return ServerResponseEntity.success();
    }

    @DeleteMapping("/bindings/{id}")
    @Operation(summary = "删除工具绑定")
    public ServerResponseEntity<Void> deleteBinding(@PathVariable Long id) {
        mcpBindingService.removeById(id);
        return ServerResponseEntity.success();
    }

    // ========== MCP Tool调用 ==========

    @PostMapping("/tools/invoke")
    @Operation(summary = "调用MCP工具")
    public ServerResponseEntity<McpToolCallResponse> invokeTool(@Valid @RequestBody McpToolCallRequest request) {
        McpToolCallResponse response = mcpToolInvokerService.invokeTool(request);
        return ServerResponseEntity.success(response);
    }

    // ========== MCP审计日志 ==========

    @GetMapping("/logs/trace/{traceId}")
    @Operation(summary = "根据traceId查询调用链路")
    public ServerResponseEntity<List<McpToolCallLog>> getLogsByTraceId(@PathVariable String traceId) {
        return ServerResponseEntity.success(mcpAuditService.listByTraceId(traceId));
    }

    @GetMapping("/logs")
    @Operation(summary = "获取调用日志列表")
    public ServerResponseEntity<IPage<McpToolCallLog>> listLogs(@RequestParam(defaultValue = "1") Integer pageNum,
                                                                @RequestParam(defaultValue = "10") Integer pageSize) {
        Page<McpToolCallLog> page = new Page<>(pageNum, pageSize);
        IPage<McpToolCallLog> logPage = mcpAuditService.page(page);
        return ServerResponseEntity.success(logPage);
    }
}

