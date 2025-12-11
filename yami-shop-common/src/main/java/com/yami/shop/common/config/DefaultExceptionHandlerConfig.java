/*
 * Copyright (c) 2018-2999 广州市蓝海创新科技有限公司 All rights reserved.
 *
 * https://www.mall4j.com/
 *
 * 未经允许，不可做商业用途！
 *
 * 版权所有，侵权必究！
 */

package com.yami.shop.common.config;

import com.yami.shop.common.exception.YamiShopBindException;
import com.yami.shop.common.response.ResponseEnum;
import com.yami.shop.common.response.ServerResponseEntity;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindException;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.resource.NoResourceFoundException;

import jakarta.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * 自定义错误处理器
 * @author LGH
 */
@Slf4j
@Controller
@RestControllerAdvice
public class DefaultExceptionHandlerConfig {

    @ExceptionHandler({ MethodArgumentNotValidException.class, BindException.class })
    public ResponseEntity<ServerResponseEntity<List<String>>> methodArgumentNotValidExceptionHandler(Exception e) {
        log.error("methodArgumentNotValidExceptionHandler", e);
        List<FieldError> fieldErrors = null;
        if (e instanceof MethodArgumentNotValidException) {
            fieldErrors = ((MethodArgumentNotValidException) e).getBindingResult().getFieldErrors();
        }
        if (e instanceof BindException) {
            fieldErrors = ((BindException) e).getBindingResult().getFieldErrors();
        }
        if (fieldErrors == null) {
            return ResponseEntity.status(HttpStatus.OK)
                    .body(ServerResponseEntity.fail(ResponseEnum.METHOD_ARGUMENT_NOT_VALID));
        }

        List<String> defaultMessages = new ArrayList<>(fieldErrors.size());
        for (FieldError fieldError : fieldErrors) {
            defaultMessages.add(fieldError.getField() + ":" + fieldError.getDefaultMessage());
        }
        return ResponseEntity.status(HttpStatus.OK)
                .body(ServerResponseEntity.fail(ResponseEnum.METHOD_ARGUMENT_NOT_VALID, defaultMessages));
    }

    @ExceptionHandler(YamiShopBindException.class)
    public ResponseEntity<ServerResponseEntity<?>> unauthorizedExceptionHandler(YamiShopBindException e){
        log.error("mall4jExceptionHandler", e);

        ServerResponseEntity<?> serverResponseEntity = e.getServerResponseEntity();
        if (serverResponseEntity!=null) {
            return ResponseEntity.status(HttpStatus.OK).body(serverResponseEntity);
        }
        // 失败返回消息 状态码固定为直接显示消息的状态码
        return ResponseEntity.status(HttpStatus.OK).body(ServerResponseEntity.fail(e.getCode(),e.getMessage()));
    }

    @ExceptionHandler(Exception.class)
    public ResponseEntity<ServerResponseEntity<Object>> exceptionHandler(Exception e){
        // 排除 MCP 路径，让 MCP SDK 自己处理异常
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        String requestPath = null;
        String requestMethod = null;
        if (attributes != null) {
            HttpServletRequest request = attributes.getRequest();
            requestPath = request.getRequestURI();
            requestMethod = request.getMethod();
            if (requestPath != null && requestPath.startsWith("/mcp/")) {
                // MCP 路径的异常不处理，让 MCP SDK 自己处理
                // 返回 null 让 Spring 继续传播异常
                return null;
            }
        }
        
        if (e instanceof NoResourceFoundException) {
            return ResponseEntity.status(HttpStatus.OK).body(ServerResponseEntity.showFailMsg(e.getMessage()));
        }
        
        // 记录详细的异常信息
        log.error("========== 异常处理 ==========");
        log.error("请求路径: {} {}", requestMethod, requestPath);
        log.error("异常类型: {}", e.getClass().getName());
        log.error("异常消息: {}", e.getMessage());
        if (e.getCause() != null) {
            log.error("根本原因: {}", e.getCause().getClass().getName());
            log.error("根本原因消息: {}", e.getCause().getMessage());
        }
        log.error("完整堆栈:", e);
        log.error("============================");
        
        return ResponseEntity.status(HttpStatus.OK).body(ServerResponseEntity.fail(ResponseEnum.EXCEPTION));
    }
}