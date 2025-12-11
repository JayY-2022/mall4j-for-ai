/*
 * Copyright (c) 2018-2999 广州市蓝海创新科技有限公司 All rights reserved.
 *
 * https://www.mall4j.com/
 *
 * 未经允许，不可做商业用途！
 *
 * 版权所有，侵权必究！
 */

package com.yami.shop.common.serializer.json;

import cn.hutool.core.util.StrUtil;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.yami.shop.common.bean.Qiniu;
import com.yami.shop.common.util.ImgUploadUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Objects;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author lanhai
 */
@Slf4j
@Component
public class ImgJsonSerializer extends JsonSerializer<String> {

    @Autowired(required = false)
    private Qiniu qiniu;
    @Autowired(required = false)
    private ImgUploadUtil imgUploadUtil;

    @Override
    public void serialize(String value, JsonGenerator gen, SerializerProvider serializers) throws IOException {
        try {
            if (StrUtil.isBlank(value)) {
                gen.writeString(StrUtil.EMPTY);
                return;
            }
            
            // 如果依赖注入失败，直接返回原始值
            if (imgUploadUtil == null) {
                log.warn("ImgUploadUtil is not available, returning original image value");
                gen.writeString(value);
                return;
            }
            
            String[] imgs = value.split(StrUtil.COMMA);
            StringBuilder sb = new StringBuilder();
            String resourceUrl = "";
            String rule="^((http[s]{0,1})://)";
            Pattern pattern= Pattern.compile(rule);
            
            try {
                Integer uploadType = imgUploadUtil.getUploadType();
                if (Objects.equals(uploadType, 2)) {
                    if (qiniu != null) {
                        resourceUrl = qiniu.getResourcesUrl();
                    }
                } else if (Objects.equals(uploadType, 1)) {
                    resourceUrl = imgUploadUtil.getResourceUrl();
                }
            } catch (Exception e) {
                log.warn("Failed to get resource URL, using original image value: {}", e.getMessage());
                gen.writeString(value);
                return;
            }
            
            for (String img : imgs) {
                Matcher matcher = pattern.matcher(img);
                //若图片以http或https开头，需要编码路径部分
                if (matcher.find()){
                    String encodedImg = encodeImageUrl(img);
                    sb.append(encodedImg).append(StrUtil.COMMA);
                }else {
                    // 相对路径，先拼接再编码路径部分
                    String fullUrl = resourceUrl + img;
                    String encodedImg = encodeImageUrl(fullUrl);
                    sb.append(encodedImg).append(StrUtil.COMMA);
                }
            }
            
            if (sb.length() > 0) {
                sb.deleteCharAt(sb.length()-1);
                gen.writeString(sb.toString());
            } else {
                gen.writeString(StrUtil.EMPTY);
            }
        } catch (Exception e) {
            // 序列化失败时，记录警告日志但不抛出异常，返回原始值，避免影响整个接口
            log.warn("Image serialization failed, returning original value: {}", e.getMessage());
            gen.writeString(value != null ? value : StrUtil.EMPTY);
        }
    }

    /**
     * 对图片URL中的路径部分进行编码，处理中文字符
     * @param url 原始URL
     * @return 编码后的URL
     */
    private String encodeImageUrl(String url) {
        if (StrUtil.isBlank(url)) {
            return url;
        }
        
        // 如果URL已经是完整的HTTP/HTTPS URL，需要分别处理协议部分和路径部分
        String rule = "^((http[s]{0,1})://)";
        Pattern pattern = Pattern.compile(rule);
        Matcher matcher = pattern.matcher(url);
        
        if (matcher.find()) {
            // 完整URL，需要编码路径部分
            String protocol = matcher.group(1); // http:// 或 https://
            String pathAndQuery = url.substring(matcher.end()); // 域名后的部分
            
            // 分离域名和路径
            int pathStartIndex = pathAndQuery.indexOf('/');
            if (pathStartIndex == -1) {
                // 没有路径部分，直接返回
                return url;
            }
            
            String domain = pathAndQuery.substring(0, pathStartIndex);
            String path = pathAndQuery.substring(pathStartIndex);
            
            // 对路径部分进行编码（保留路径分隔符）
            String encodedPath = encodePath(path);
            
            return protocol + domain + encodedPath;
        } else {
            // 相对路径，直接编码整个路径
            return encodePath(url);
        }
    }
    
    /**
     * 对路径进行URL编码，保留路径分隔符
     * @param path 原始路径
     * @return 编码后的路径
     */
    private String encodePath(String path) {
        if (StrUtil.isBlank(path)) {
            return path;
        }
        
        try {
            // 按路径分隔符分割
            String[] parts = path.split("/", -1);
            StringBuilder encodedPath = new StringBuilder();
            
            for (int i = 0; i < parts.length; i++) {
                if (i > 0) {
                    encodedPath.append("/");
                }
                if (StrUtil.isNotBlank(parts[i])) {
                    // 对每个路径段进行编码
                    encodedPath.append(URLEncoder.encode(parts[i], StandardCharsets.UTF_8.toString())
                            .replace("+", "%20")); // 将+替换为%20，更符合URL编码规范
                }
            }
            
            return encodedPath.toString();
        } catch (Exception e) {
            // 编码失败，返回原始路径
            return path;
        }
    }
}
