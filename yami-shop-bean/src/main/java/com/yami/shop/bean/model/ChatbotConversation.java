package com.yami.shop.bean.model;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.util.Date;

/**
 * 智能客服聊天记录
 */
@Data
@TableName("chatbot_conversation")
public class ChatbotConversation implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @TableId
    private Long id;

    private String userId;

    private String sessionId;

    private String message;

    private String response;

    /**
     * 状态：1-成功，0-失败
     */
    private Integer status;

    @TableField("create_time")
    private Date createTime;
}

