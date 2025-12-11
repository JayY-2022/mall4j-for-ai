package com.yami.shop.bean.model;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.util.Date;

/**
 * 智能客服配置
 */
@Data
@TableName("chatbot_config")
@JsonInclude(JsonInclude.Include.ALWAYS)
public class ChatbotConfig implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @TableId
    private Long id;

    /**
     * Agent 服务地址
     */
    private String url;

    /**
     * 请求超时时间（毫秒）
     */
    private Integer timeout;

    /**
     * 会话超时时间（毫秒）
     */
    @TableField("session_timeout")
    private Long sessionTimeout;

    /**
     * 是否启用
     */
    private Boolean enabled;

    /**
     * 是否启用记忆功能
     */
    @TableField("memory_enable")
    private Boolean memoryEnable;

    /**
     * API 路径
     */
    @TableField("api_path")
    private String apiPath;

    /**
     * API Key（用于外部接口认证）
     */
    @TableField("api_key")
    @JsonProperty("apiKey")
    @JsonInclude(JsonInclude.Include.ALWAYS)
    private String apiKey;

    @TableField("create_time")
    private Date createTime;

    @TableField("update_time")
    private Date updateTime;
}

