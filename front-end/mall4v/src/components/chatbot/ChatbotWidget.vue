<template>
  <div class="chatbot-widget">
    <el-button
      class="chatbot-trigger"
      type="primary"
      circle
      size="large"
      @click="toggleDialog"
    >
      <el-icon><ChatLineSquare /></el-icon>
    </el-button>
    <el-dialog
      v-model="visible"
      width="420px"
      top="60px"
      append-to-body
      :close-on-click-modal="false"
      class="chatbot-dialog"
    >
      <template #header>
        <div class="chatbot-header">
          <span>智能客服</span>
          <el-tag size="small" :type="statusTag.type">{{ statusTag.text }}</el-tag>
        </div>
      </template>
      <div class="chatbot-messages" ref="scrollRef">
        <div
          v-for="item in messages"
          :key="item.id"
          class="chatbot-message"
          :class="item.role"
        >
          <div class="bubble">
            <span>{{ item.content }}</span>
            <el-icon v-if="item.status === 'loading'" class="bubble-icon">
              <Loading />
            </el-icon>
            <el-icon v-if="item.status === 'error'" class="bubble-icon error">
              <Warning />
            </el-icon>
          </div>
        </div>
      </div>
      <div class="chatbot-input">
        <el-input
          v-model="editor"
          type="textarea"
          :rows="3"
          placeholder="请输入您的问题..."
          @keydown.enter.prevent="handleSend"
        />
        <div class="chatbot-input__actions">
          <div class="actions-left">
            <el-link type="primary" :underline="false" @click="loadHistory">查看历史</el-link>
            <el-divider direction="vertical" />
            <el-link type="danger" :underline="false" @click="clearHistory">清空会话</el-link>
          </div>
          <el-button
            type="primary"
            size="small"
            :loading="sending"
            :disabled="!editor.trim()"
            @click="handleSend"
          >
            发送
          </el-button>
        </div>
      </div>
    </el-dialog>
  </div>
</template>

<script setup>
import { nextTick } from 'vue'
import { ChatLineSquare, Loading, Warning } from '@element-plus/icons-vue'
import { v4 as uuidv4 } from 'uuid'
import { fetchChatHistory, clearChatHistory } from '@/api/chatbot'
import { useUserStore } from '@/stores/user'
import http from '@/utils/http'
import { ElMessage } from 'element-plus'
import cookie from 'vue-cookies'

const visible = ref(false)
const messages = ref([])
const editor = ref('')
const sending = ref(false)
// 第一次会话时 sessionId 为空，由 chatbot 返回
const sessionId = ref(null)
const userStore = useUserStore()
const scrollRef = ref(null)
const activeSource = ref(null)
const lastInteraction = ref(Date.now())
const SESSION_TIMEOUT = 5 * 60 * 1000

const statusTag = computed(() => {
  const diff = Date.now() - lastInteraction.value
  if (diff > SESSION_TIMEOUT) {
    return { text: '已断开', type: 'danger' }
  }
  return { text: '在线', type: 'success' }
})

const toggleDialog = () => {
  visible.value = !visible.value
  // 打开对话框时更新交互时间
  if (visible.value) {
    lastInteraction.value = Date.now()
  }
}

const createMessage = (role, content, status = 'done') => ({
  id: `${Date.now()}-${Math.random()}`,
  role,
  content,
  status
})

const appendMessage = (message) => {
  messages.value.push(message)
  nextTick(() => {
    if (scrollRef.value) {
      scrollRef.value.scrollTop = scrollRef.value.scrollHeight
    }
  })
}

const ensureActiveSession = () => {
  // 如果会话超时（5分钟），重置 sessionId 为空，让 chatbot 创建新会话
  if (sessionId.value && Date.now() - lastInteraction.value > SESSION_TIMEOUT) {
    sessionId.value = null
    ElMessage.warning('会话已超时，已为您开启新的会话')
  }
}

const buildStreamUrl = () => {
  return http.adornUrl('/p/chatbot/chat')
}

const startStream = async (text) => {
  if (!userStore.userId) {
    ElMessage.error('无法获取用户信息，请重新登录')
    return
  }
  ensureActiveSession()
  // 发送消息时更新交互时间
  lastInteraction.value = Date.now()
  if (activeSource.value) {
    if (activeSource.value.abort) {
      activeSource.value.abort()
    }
    activeSource.value = null
  }
  sending.value = true
  const assistantMessage = createMessage('assistant', '', 'loading')
  appendMessage(assistantMessage)

  try {
    const token = cookie.get('Authorization')
    if (!token) {
      ElMessage.error('请先登录后再使用智能客服')
      sending.value = false
      assistantMessage.status = 'error'
      assistantMessage.content = '请先登录后再使用智能客服'
      cleanupSource()
      return
    }
    
    const url = buildStreamUrl()
    
    const response = await fetch(url, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': token
      },
      credentials: 'include',
      body: JSON.stringify({
        ...(sessionId.value ? { sessionId: sessionId.value } : {}),
        message: text
      })
    })

    if (!response.ok) {
      if (response.status === 401) {
        ElMessage.error('认证失败，请重新登录')
        sending.value = false
        assistantMessage.status = 'error'
        assistantMessage.content = '认证失败，请重新登录'
        cleanupSource()
        return
      }
      throw new Error(`HTTP error! status: ${response.status}`)
    }

    const reader = response.body.getReader()
    const decoder = new TextDecoder()
    let buffer = ''
    let currentEvent = null
    let currentData = ''

    activeSource.value = { abort: () => reader.cancel() }

    // 创建更新助手消息的函数，使用创建新对象的方式触发Vue响应式更新
    const updateAssistantMessage = (newContent, newStatus = null) => {
      // 查找最后一个assistant消息（不限制ID，因为可能是新创建的消息）
      const assistantIndex = messages.value.findLastIndex(msg => msg.role === 'assistant')
      console.log('updateAssistantMessage - assistantIndex:', assistantIndex, 'assistantMessage.id:', assistantMessage.id, 'messages length:', messages.value.length, 'newStatus:', newStatus)
      if (assistantIndex >= 0) {
        // 创建新的消息数组，替换assistant消息对象
        const newMessages = messages.value.map((msg, idx) => {
          if (idx === assistantIndex) {
            // 创建新对象，确保Vue能检测到变化
            console.log('更新消息内容，索引:', idx, '新内容长度:', newContent.length, '新状态:', newStatus)
            const updatedMsg = {
              ...msg,
              content: newContent
            }
            // 如果提供了新状态，也更新状态
            if (newStatus !== null) {
              updatedMsg.status = newStatus
            }
            return updatedMsg
          }
          return msg
        })
        // 使用新数组替换，确保Vue响应式系统检测到变化
        messages.value = newMessages
        // 同时更新 assistantMessage 对象，保持同步
        if (assistantMessage) {
          assistantMessage.content = newContent
          if (newStatus !== null) {
            assistantMessage.status = newStatus
          }
        }
        // 收到消息内容时更新交互时间和状态
        lastInteraction.value = Date.now()
        // 强制触发响应式更新
        nextTick(() => {
          if (scrollRef.value) {
            scrollRef.value.scrollTop = scrollRef.value.scrollHeight
          }
        })
      } else {
        console.warn('未找到assistant消息，无法更新内容')
        // 如果找不到消息，直接更新 assistantMessage
        if (assistantMessage) {
          assistantMessage.content = newContent
          if (newStatus !== null) {
            assistantMessage.status = newStatus
          }
        }
      }
    }

    let accumulatedContent = ''

    while (true) {
      const { done, value } = await reader.read()
      
      if (done) {
        break
      }

      buffer += decoder.decode(value, { stream: true })
      const lines = buffer.split('\n')
      buffer = lines.pop() || ''

      for (const line of lines) {
        if (line.startsWith('event:')) {
          currentEvent = line.substring(6).trim()
          console.log('收到 event 行:', currentEvent)
        } else if (line.startsWith('data:')) {
          const data = line.substring(5).trim()
          console.log('收到 data 行 (currentEvent=' + currentEvent + '):', data.substring(0, 100))
          if (currentData) {
            currentData += '\n' + data
          } else {
            currentData = data
          }
        } else if (line === '') {
          // 空行表示一个事件结束
          console.log('遇到空行，currentEvent:', currentEvent, 'currentData长度:', currentData.length)
          if (currentData) {
            if (currentData === '[DONE]') {
              console.log('收到 [DONE]，结束流')
              sending.value = false
              // 确保状态更新为 'done'，通过 updateAssistantMessage 统一更新
              updateAssistantMessage(accumulatedContent, 'done')
              cleanupSource()
              return
            }

            console.log('处理事件 - currentEvent:', currentEvent, 'currentData前100字符:', currentData.substring(0, 100))
            // 优先处理特殊事件类型（ack/session/complete/timeout/error），避免被误判为消息
            // 注意：即使 currentEvent 为 null，也要检查数据内容，避免将特殊事件的数据当作消息
            if (currentEvent === 'ack' || (!currentEvent && (currentData.trim().startsWith('已收到:') || currentData.trim() === 'ack'))) {
              // ack 事件只更新交互时间，不显示内容
              console.log('收到 ack 事件，更新交互时间')
              lastInteraction.value = Date.now()
              // 重置状态，准备下一个事件
              currentEvent = null
              currentData = ''
              continue
            } else if (currentEvent === 'session' || (!currentEvent && /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i.test(currentData.trim()))) {
              console.log('处理 session 事件')
              const newSessionId = currentData
              // 过滤掉 ping 消息（格式: ": ping - 时间戳"）
              if (newSessionId && !newSessionId.startsWith(': ping')) {
                // 如果当前 sessionId 为空或不同，更新为 chatbot 返回的 session_id
                if (!sessionId.value || newSessionId !== sessionId.value) {
                  console.log('更新 sessionId:', sessionId.value || 'null', '->', newSessionId)
                  sessionId.value = newSessionId
                  lastInteraction.value = Date.now()
                  console.log('收到新的 session_id:', newSessionId)
                }
              } else if (newSessionId && newSessionId.startsWith(': ping')) {
                console.log('过滤掉 session 事件中的 ping 消息:', newSessionId)
              }
              // 重置状态，准备下一个事件
              currentEvent = null
              currentData = ''
              continue
            } else if (currentEvent === 'complete' || (!currentEvent && (currentData.trim() === 'done' || currentData.trim() === 'complete'))) {
              console.log('[Chatbot] ✅ 收到 complete 事件，结束流式读取')
              sending.value = false
              // 通过 updateAssistantMessage 更新状态，确保响应式更新
              updateAssistantMessage(accumulatedContent, 'done')
              cleanupSource()
              return
            } else if (currentEvent === 'timeout') {
              sending.value = false
              // 通过 updateAssistantMessage 更新状态，确保响应式更新
              updateAssistantMessage(accumulatedContent || '会话已超时，请重新开始', 'error')
              ElMessage.warning('会话已超时，请重新开始')
              cleanupSource()
              return
            } else if (currentEvent === 'error') {
              sending.value = false
              const errorMsg = currentData || '客服服务异常'
              // 通过 updateAssistantMessage 更新状态，确保响应式更新
              updateAssistantMessage(accumulatedContent || errorMsg, 'error')
              // 如果是认证错误，提示用户登录
              if (errorMsg.includes('Unauthorized') || errorMsg.includes('请先登录') || errorMsg.includes('认证失败')) {
                ElMessage.error('请先登录后再使用智能客服')
              } else {
                ElMessage.error(errorMsg)
              }
              cleanupSource()
              return
            } else if (currentEvent === 'message' || (!currentEvent && currentData)) {
              // 首先过滤掉所有非消息类型的数据
              
              // 过滤掉 ping 消息（格式: ": ping - 时间戳"）
              if (currentData.trim().startsWith(': ping')) {
                console.log('[Chatbot] ⏭️ 过滤掉 message 事件中的 ping 消息:', currentData.substring(0, 50))
                currentEvent = null
                currentData = ''
                continue
              }
              
              // 过滤掉日志消息（格式: "@docker (1016-1020)" 等）
              if (currentData.trim().startsWith('@')) {
                console.log('[Chatbot] ⏭️ 过滤掉日志消息:', currentData.substring(0, 50))
                currentEvent = null
                currentData = ''
                continue
              }
              
              // 过滤掉 ack 消息内容（格式: "已收到: xxx"）
              if (currentData.trim().startsWith('已收到:')) {
                console.log('[Chatbot] ⏭️ 过滤掉 ack 消息内容:', currentData.substring(0, 50))
                currentEvent = null
                currentData = ''
                continue
              }
              
              // 过滤掉 session ID（UUID 格式）
              if (/^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i.test(currentData.trim())) {
                console.log('[Chatbot] ⏭️ 过滤掉 session ID:', currentData.substring(0, 50))
                currentEvent = null
                currentData = ''
                continue
              }
              
              // 过滤掉 done/complete 消息
              if (currentData.trim() === 'done' || currentData.trim() === 'complete') {
                console.log('[Chatbot] ⏭️ 过滤掉 done/complete 消息:', currentData)
                currentEvent = null
                currentData = ''
                continue
              }
              
              // Try to parse JSON and extract content (fallback if Java service doesn't handle it)
              let content = null
              try {
                const parsed = JSON.parse(currentData)
                console.log('解析 JSON 成功:', parsed)
                if (parsed.choices && parsed.choices[0] && parsed.choices[0].delta) {
                  // 只提取 delta.content，如果不存在则为空字符串
                  content = parsed.choices[0].delta.content || ''
                  console.log('提取 content:', content, '长度:', content.length, '类型:', typeof content)
                } else if (parsed.content) {
                  // 如果直接有 content 字段，使用它
                  content = parsed.content || ''
                  console.log('提取 content (直接字段):', content, '长度:', content.length)
                } else {
                  console.warn('JSON 结构不正确，跳过:', parsed)
                  content = null // 结构不正确，不处理
                }
              } catch (e) {
                // Not JSON, 非 JSON 格式的内容不进行显示，直接跳过
                console.log('非 JSON 格式的内容，跳过不显示:', currentData.substring(0, 50))
                content = null // 非 JSON 格式，不处理
              }
              // 只有当 content 不为 null 且不为空字符串时才追加
              // 注意：空字符串也要追加，因为可能是流式输出的中间部分
              if (content !== null && content !== undefined) {
                const contentStr = String(content)
                // 累积内容
                accumulatedContent += contentStr
                console.log('累积 content，当前长度:', accumulatedContent.length, '新增:', contentStr.length, '内容:', contentStr.substring(0, 50))
                // 使用创建新对象的方式更新，确保Vue响应式系统能检测到变化
                updateAssistantMessage(accumulatedContent)
              } else {
                console.log('content 为 null 或 undefined，跳过')
              }
            } else if (currentEvent || currentData) {
              console.warn('未处理的事件类型:', currentEvent, 'data前100字符:', currentData.substring(0, 100))
            }
            // 处理完事件后，重置状态，准备下一个事件
            console.log('事件处理完成，重置状态')
            currentEvent = null
            currentData = ''
          } else {
            // 即使 currentData 为空，也要重置 currentEvent
            console.log('currentData 为空，重置 currentEvent')
            currentEvent = null
          }
        }
      }
    }

    // 处理最后的数据
    if (buffer.trim()) {
      if (buffer.trim() === '[DONE]') {
        console.log('[Chatbot] ✅ 收到 [DONE] 信号，结束流式读取')
        sending.value = false
        updateAssistantMessage(accumulatedContent, 'done')
        cleanupSource()
        return
      }
      // 只处理 JSON 格式的缓冲区数据，非 JSON 格式直接跳过
      const trimmedBuffer = buffer.trim()
      if (trimmedBuffer.startsWith('{') || trimmedBuffer.startsWith('[')) {
        try {
          const parsed = JSON.parse(trimmedBuffer)
          let content = null
          if (parsed.choices && parsed.choices[0] && parsed.choices[0].delta) {
            content = parsed.choices[0].delta.content || ''
          } else if (parsed.content) {
            content = parsed.content || ''
          }
          if (content !== null && content !== undefined) {
            accumulatedContent += String(content)
            updateAssistantMessage(accumulatedContent)
          }
        } catch (e) {
          console.log('[Chatbot] ⏭️ 缓冲区数据 JSON 解析失败，跳过:', trimmedBuffer.substring(0, 50))
        }
      } else {
        console.log('[Chatbot] ⏭️ 缓冲区数据非 JSON 格式，跳过:', trimmedBuffer.substring(0, 50))
      }
    }

    // 流式读取正常结束（没有收到 [DONE] 但流已结束）
    console.log('[Chatbot] ✅ 流式读取正常结束，最终内容长度:', accumulatedContent.length)
    sending.value = false
    // 确保状态更新为 'done'
    updateAssistantMessage(accumulatedContent, 'done')
    cleanupSource()
  } catch (error) {
    console.error('Stream error:', error)
    sending.value = false
    assistantMessage.status = 'error'
    assistantMessage.content = error.message || '连接失败，请稍后重试'
    ElMessage.error(error.message || '连接失败，请稍后重试')
    cleanupSource()
  }
}

const cleanupSource = () => {
  if (activeSource.value) {
    if (activeSource.value.abort) {
      activeSource.value.abort()
    } else if (activeSource.value.close) {
      activeSource.value.close()
    }
    activeSource.value = null
  }
}

const handleSend = () => {
  const text = editor.value.trim()
  if (!text || sending.value) {
    return
  }
  editor.value = ''
  appendMessage(createMessage('user', text))
  startStream(text)
}

/**
 * 从响应中提取文本内容
 * 参考chatbot前端的extractContent实现，支持多种JSON格式
 * 支持处理多个JSON chunk拼接的情况（历史记录可能保存了多个chunk）
 */
const extractResponseContent = (response) => {
  if (!response) return ''
  
  // 如果是字符串，尝试解析JSON
  if (typeof response === 'string') {
    const trimmed = response.trim()
    
    // 如果不是JSON格式，直接返回
    if (!trimmed.startsWith('{') && !trimmed.startsWith('[')) {
      return response
    }
    
    // 尝试解析单个JSON对象
    try {
      const parsed = JSON.parse(trimmed)
      return extractContentFromParsed(parsed)
    } catch (e) {
      // 如果解析失败，可能是多个JSON chunk拼接
      // 尝试提取所有JSON对象中的content
      let extractedContent = ''
      let jsonStart = -1
      let braceCount = 0
      
      for (let i = 0; i < trimmed.length; i++) {
        if (trimmed[i] === '{') {
          if (jsonStart === -1) {
            jsonStart = i
          }
          braceCount++
        } else if (trimmed[i] === '}') {
          braceCount--
          if (braceCount === 0 && jsonStart !== -1) {
            // 找到一个完整的JSON对象
            try {
              const jsonStr = trimmed.substring(jsonStart, i + 1)
              const parsed = JSON.parse(jsonStr)
              const content = extractContentFromParsed(parsed)
              if (content) {
                extractedContent += content
              }
            } catch (parseError) {
              // 忽略解析错误，继续处理下一个
            }
            jsonStart = -1
          }
        }
      }
      
      // 如果提取到了内容，返回提取的内容
      if (extractedContent) {
        return extractedContent
      }
      
      // 如果都失败了，返回原始内容（可能是纯文本）
      return response
    }
  }
  
  // 如果已经是对象，直接提取
  if (typeof response === 'object') {
    return extractContentFromParsed(response)
  }
  
  return String(response || '')
}

/**
 * 从解析后的对象中提取内容
 * 支持多种格式：choices[0].delta.content, choices[0].message.content, content等
 */
const extractContentFromParsed = (parsed) => {
  if (!parsed || typeof parsed !== 'object') {
    return ''
  }
  
  // OpenAI/DeepSeek style: choices[0].delta.content
  if (Array.isArray(parsed.choices) && parsed.choices.length > 0) {
    const choice = parsed.choices[0]
    if (choice.delta && typeof choice.delta.content === 'string') {
      return choice.delta.content
    }
    if (choice.message && typeof choice.message.content === 'string') {
      return choice.message.content
    }
    // 支持content数组格式
    if (Array.isArray(choice.delta?.content)) {
      return choice.delta.content
        .map((c) => {
          if (typeof c === 'string') return c
          if (c && typeof c.text === 'string') return c.text
          return ''
        })
        .join('')
    }
    if (Array.isArray(choice.message?.content)) {
      return choice.message.content
        .map((c) => {
          if (typeof c === 'string') return c
          if (c && typeof c.text === 'string') return c.text
          return ''
        })
        .join('')
    }
  }
  
  // 直接content字段
  if (typeof parsed.content === 'string') {
    return parsed.content
  }
  
  // content数组
  if (Array.isArray(parsed.content)) {
    return parsed.content
      .map((c) => {
        if (typeof c === 'string') return c
        if (c && typeof c.text === 'string') return c.text
        return ''
      })
      .join('')
  }
  
  // 如果没有找到content，返回空字符串（而不是原始JSON）
  return ''
}

const loadHistory = () => {
  if (!userStore.userId) {
    ElMessage.error('无法获取用户信息')
    return
  }
  fetchChatHistory(userStore.userId, sessionId.value).then(res => {
    const list = res.data || []
    messages.value = list.map(item => ([
      createMessage('user', item.message || ''),
      createMessage('assistant', extractResponseContent(item.response))
    ])).flat().filter(Boolean)
    nextTick(() => {
      if (scrollRef.value) {
        scrollRef.value.scrollTop = scrollRef.value.scrollHeight
      }
    })
  })
}

const clearHistory = () => {
  if (!sessionId.value) {
    return
  }
  clearChatHistory(sessionId.value).then(() => {
    messages.value = []
    ElMessage.success('已清空会话记录')
  })
}

onBeforeUnmount(() => {
  cleanupSource()
})
</script>

<style scoped>
.chatbot-widget {
  position: fixed;
  right: 24px;
  bottom: 24px;
  z-index: 2000;
}

.chatbot-trigger {
  box-shadow: 0 8px 24px rgba(64, 158, 255, 0.35);
}

.chatbot-dialog :deep(.el-dialog__body) {
  padding: 0 10px 10px;
}

.chatbot-header {
  display: flex;
  align-items: center;
  gap: 10px;
  font-size: 16px;
  font-weight: 600;
}

.chatbot-messages {
  height: 320px;
  overflow-y: auto;
  padding: 10px;
  background-color: #f7f8fa;
  border: 1px solid #ebeef5;
  border-radius: 6px;
}

.chatbot-message {
  display: flex;
  margin-bottom: 12px;
}

.chatbot-message.user {
  justify-content: flex-end;
}

.chatbot-message.assistant {
  justify-content: flex-start;
}

.bubble {
  max-width: 80%;
  padding: 10px 12px;
  border-radius: 8px;
  position: relative;
  line-height: 1.5;
  background-color: #fff;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
  display: inline-flex;
  gap: 6px;
  align-items: center;
}

.chatbot-message.user .bubble {
  background-color: #409eff;
  color: #fff;
}

.chatbot-message.assistant .bubble {
  background-color: #fff;
  color: #303133;
}

.bubble-icon {
  font-size: 14px;
}

.bubble-icon.error {
  color: #f56c6c;
}

.chatbot-input {
  margin-top: 12px;
  display: flex;
  flex-direction: column;
  gap: 8px;
}

.chatbot-input__actions {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.actions-left {
  display: flex;
  align-items: center;
  gap: 6px;
}
</style>

