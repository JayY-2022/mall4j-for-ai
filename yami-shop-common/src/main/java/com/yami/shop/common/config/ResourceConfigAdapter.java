package com.yami.shop.common.config;

import com.yami.shop.common.util.ImgUploadUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.io.File;

/**
 * @author TRACK
 */
@Configuration
public class ResourceConfigAdapter implements WebMvcConfigurer {

    @Autowired
    private ImgUploadUtil imgUploadUtil;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        String uploadPath = imgUploadUtil.getUploadPath();
        // 确保路径以 / 结尾
        if (!uploadPath.endsWith("/") && !uploadPath.endsWith(File.separator)) {
            uploadPath = uploadPath + "/";
        }
        // 将 Windows 路径分隔符转换为 Unix 格式（Docker 容器内使用）
        uploadPath = uploadPath.replace("\\", "/");
        registry.addResourceHandler("/mall4j/img/**").addResourceLocations("file:" + uploadPath);
    }
}
