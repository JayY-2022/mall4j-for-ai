<template>
  <view class="chatbot-widget">
    <!-- 浮窗按钮 -->
    <view
      class="chatbot-trigger"
      @tap="toggleDialog"
    >
      <text class="chatbot-icon">💬</text>
    </view>

    <!-- 对话框 -->
    <view
      v-if="visible"
      class="chatbot-mask"
      @tap="closeDialog"
    >
      <view
        class="chatbot-dialog"
        @tap.stop
      >
        <!-- 头部 -->
        <view class="chatbot-header">
          <text class="chatbot-title">智能客服</text>
          <view class="chatbot-status" :class="statusTag.type">
            {{ statusTag.text }}
          </view>
          <text
            class="close-btn"
            @tap="closeDialog"
          >×</text>
        </view>

        <!-- 消息列表 -->
        <scroll-view
          class="chatbot-messages"
          scroll-y
          :scroll-top="scrollTop"
          scroll-with-animation
          :scroll-into-view="scrollIntoView"
        >
          <view
            v-for="(item, index) in messages"
            :key="item.id"
            :id="`msg-${index}`"
            class="chatbot-message"
            :class="item.role"
          >
            <view class="message-wrapper">
              <view class="bubble" :class="{ 'loading': item.status === 'loading', 'error': item.status === 'error' }">
                <text class="message-text">{{ item.content }}</text>
                <view v-if="item.status === 'loading'" class="loading-dots">
                  <view class="dot"></view>
                  <view class="dot"></view>
                  <view class="dot"></view>
                </view>
                <text
                  v-if="item.status === 'error'"
                  class="error-icon"
                >⚠️</text>
              </view>
            </view>
          </view>
        </scroll-view>

        <!-- 输入区域 -->
        <view class="chatbot-input">
          <view class="input-wrapper">
            <textarea
              v-model="editor"
              class="chatbot-textarea"
              placeholder="请输入您的问题..."
              :auto-height="true"
              :maxlength="500"
              @confirm="handleSend"
            />
            <view
              class="send-btn"
              :class="{ disabled: !editor.trim() || sending, active: editor.trim() && !sending }"
              @tap="handleSend"
            >
              <text v-if="sending" class="send-icon">⏳</text>
              <text v-else class="send-icon">➤</text>
            </view>
          </view>
          <view class="chatbot-input__actions">
            <text
              class="action-link"
              @tap="loadHistory"
            >查看历史</text>
            <text class="divider">|</text>
            <text
              class="action-link danger"
              @tap="clearHistory"
            >清空会话</text>
          </view>
        </view>
      </view>
    </view>
  </view>
</template>

<script setup>
import http from '@/utils/http'

// 生成简单的 UUID
const generateUUID = () => {
  return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, (c) => {
    const r = (Math.random() * 16) | 0
    const v = c === 'x' ? r : (r & 0x3) | 0x8
    return v.toString(16)
  })
}

const visible = ref(false)
const messages = ref([])
const editor = ref('')
const sending = ref(false)
// 第一次会话时 sessionId 为空，由 chatbot 返回
const sessionId = ref(null)
const scrollTop = ref(0)
const scrollIntoView = ref('')
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
  // 打开对话框时更新交互时间
  lastInteraction.value = Date.now()
  const loginResult = uni.getStorageSync('loginResult')
  if (!loginResult) {
    uni.showModal({
      title: '提示',
      content: '请先登录后再使用智能客服',
      confirmText: '去登录',
      success: (res) => {
        if (res.confirm) {
          uni.navigateTo({
            url: '/pages/accountLogin/accountLogin'
          })
        }
      }
    })
    return
  }
  const wasVisible = visible.value
  visible.value = !visible.value
  if (visible.value && !wasVisible) {
    // 对话框打开时，自动从 API 加载历史记录，而不是使用前端缓存
    loadHistory()
  } else if (visible.value) {
    scrollToBottom()
  }
}

const closeDialog = () => {
  visible.value = false
  cleanupSource()
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
    scrollToBottom()
  })
}

const scrollToBottom = () => {
  nextTick(() => {
    if (messages.value.length > 0) {
      const lastIndex = messages.value.length - 1
      scrollIntoView.value = `msg-${lastIndex}`
      scrollTop.value = 99999
    }
  })
}

const ensureActiveSession = () => {
  // 如果会话超时（5分钟），重置 sessionId 为空，让 chatbot 创建新会话
  if (sessionId.value && Date.now() - lastInteraction.value > SESSION_TIMEOUT) {
    sessionId.value = null
    uni.showToast({
      title: '会话已超时，已为您开启新的会话',
      icon: 'none'
    })
  }
}

const buildStreamUrl = () => {
  const baseUrl = import.meta.env.VITE_APP_BASE_API || ''
  const url = '/p/chatbot/chat'
  // 如果 URL 已经以 /p/ 开头，直接返回（避免重复添加前缀）
  if (url.startsWith('/p/')) {
    return url
  }
  // 处理 baseUrl 和 url 的拼接，避免双斜杠
  if (baseUrl.endsWith('/') && url.startsWith('/')) {
    return baseUrl + url.substring(1)
  }
  if (!baseUrl.endsWith('/') && !url.startsWith('/') && baseUrl && url) {
    return baseUrl + '/' + url
  }
  return baseUrl + url
}

const startStream = async (text) => {
  console.log('=== [Chatbot] 开始发送消息 ===')
  console.log('[Chatbot] 用户消息:', text)
  console.log('[Chatbot] 当前会话ID:', sessionId.value)
  console.log('[Chatbot] 当前消息数量:', messages.value.length)
  
  const loginResult = uni.getStorageSync('loginResult')
  if (!loginResult) {
    console.warn('[Chatbot] 未找到登录信息')
    uni.showToast({
      title: '无法获取用户信息，请重新登录',
      icon: 'none'
    })
    return
  }

  ensureActiveSession()
  // 发送消息时更新交互时间
  lastInteraction.value = Date.now()
  if (activeSource.value) {
    console.log('[Chatbot] 取消之前的请求')
    if (activeSource.value.abort) {
      activeSource.value.abort()
    }
    activeSource.value = null
  }
  sending.value = true
  const assistantMessage = createMessage('assistant', '', 'loading')
  console.log('[Chatbot] 创建 assistant 消息:', assistantMessage.id)
  appendMessage(assistantMessage)
  console.log('[Chatbot] 添加 assistant 消息后，消息数量:', messages.value.length)

  try {
    // #ifdef H5
    const token = uni.getStorageSync('Token')
    if (!token) {
      uni.showToast({
        title: '请先登录后再使用智能客服',
        icon: 'none'
      })
      sending.value = false
      // 通过 updateAssistantMessage 更新状态，确保响应式更新
      updateAssistantMessage('请先登录后再使用智能客服', 'error')
      cleanupSource()
      return
    }
    
    const baseUrl = import.meta.env.VITE_APP_BASE_API || ''
    const urlPath = '/p/chatbot/chat'
    // 如果 URL 已经以 /p/ 开头，直接返回（避免重复添加前缀）
    let url
    if (urlPath.startsWith('/p/')) {
      url = urlPath
    } else if (baseUrl.endsWith('/') && urlPath.startsWith('/')) {
      // 处理双斜杠问题：如果 baseUrl 以 / 结尾，且 urlPath 以 / 开头，则去掉一个斜杠
      url = baseUrl + urlPath.substring(1)
    } else if (!baseUrl.endsWith('/') && !urlPath.startsWith('/') && baseUrl && urlPath) {
      // 如果 baseUrl 不以 / 结尾，且 urlPath 不以 / 开头，则添加一个斜杠
      url = baseUrl + '/' + urlPath
    } else {
      url = baseUrl + urlPath
    }
    
    console.log('[Chatbot] 请求URL:', url)
    console.log('[Chatbot] 请求参数:', {
      sessionId: sessionId.value,
      message: text
    })
    
    // 如果 sessionId 为空，不传 sessionId 字段，让 chatbot 创建新会话
    const requestBody = JSON.stringify({
      ...(sessionId.value ? { sessionId: sessionId.value } : {}),
      message: text
    })
    console.log('[Chatbot] 请求体:', requestBody)
    
    const response = await fetch(url, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': token
      },
      body: requestBody
    })
    
    console.log('[Chatbot] 响应状态:', response.status, response.statusText)
    console.log('[Chatbot] 响应头 Content-Type:', response.headers.get('Content-Type'))

    if (!response.ok) {
      if (response.status === 401) {
        uni.showToast({
          title: '认证失败，请重新登录',
          icon: 'none'
        })
        sending.value = false
        // 通过 updateAssistantMessage 更新状态，确保响应式更新
        updateAssistantMessage('认证失败，请重新登录', 'error')
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
    let chunkCount = 0
    let lineCount = 0

    console.log('[Chatbot] 开始读取流式响应')
    activeSource.value = { abort: () => reader.cancel() }

    // 创建更新助手消息的函数，使用创建新对象的方式触发Vue响应式更新
    const updateAssistantMessage = (newContent, newStatus = null) => {
      // 使用兼容性更好的方式查找最后一个 assistant 消息
      let assistantIndex = -1
      for (let i = messages.value.length - 1; i >= 0; i--) {
        if (messages.value[i].role === 'assistant') {
          assistantIndex = i
          break
        }
      }
      
      console.log('[Chatbot] 🔄 updateAssistantMessage 调用:')
      console.log('  - assistantIndex:', assistantIndex)
      console.log('  - assistantMessage.id:', assistantMessage.id)
      console.log('  - messages.length:', messages.value.length)
      console.log('  - newContent.length:', newContent.length)
      console.log('  - newStatus:', newStatus)
      console.log('  - newContent预览:', newContent.substring(0, 100))
      console.log('  - 当前所有消息:', messages.value.map(m => ({ role: m.role, id: m.id, contentLength: m.content.length })))
      
      if (assistantIndex >= 0) {
        const oldMessage = messages.value[assistantIndex]
        console.log('[Chatbot] 找到 assistant 消息:')
        console.log('  - 索引:', assistantIndex)
        console.log('  - ID:', oldMessage.id)
        console.log('  - 旧内容长度:', oldMessage.content.length)
        console.log('  - 新内容长度:', newContent.length)
        console.log('  - 旧状态:', oldMessage.status)
        console.log('  - 新状态:', newStatus)
        
        // 创建新的消息数组，替换assistant消息对象
        // 使用 map 创建新数组，确保 Vue 能检测到变化
        const newMessages = messages.value.map((msg, idx) => {
          if (idx === assistantIndex) {
            // 创建全新的消息对象，确保Vue能检测到所有变化
            const updatedMsg = {
              id: msg.id,
              role: msg.role,
              content: newContent,
              status: newStatus !== null ? newStatus : msg.status
            }
            console.log('[Chatbot] ✅ 创建更新后的消息对象:', {
              id: updatedMsg.id,
              role: updatedMsg.role,
              status: updatedMsg.status,
              contentLength: updatedMsg.content.length
            })
            return updatedMsg
          }
          return msg
        })
        
        console.log('[Chatbot] 准备替换 messages.value，新数组长度:', newMessages.length)
        // 使用新数组替换，确保Vue响应式系统检测到变化
        messages.value = newMessages
        // 同时更新 assistantMessage 对象，保持同步
        if (assistantMessage) {
          assistantMessage.content = newContent
          if (newStatus !== null) {
            assistantMessage.status = newStatus
          }
        }
        console.log('[Chatbot] ✅ messages.value 已更新')
        console.log('[Chatbot] 更新后的消息列表:', messages.value.map(m => ({ role: m.role, id: m.id, contentLength: m.content.length, status: m.status })))
        
        // 收到消息内容时更新交互时间
        lastInteraction.value = Date.now()
        // 使用 nextTick 确保 DOM 更新后再滚动
        nextTick(() => {
          console.log('[Chatbot] nextTick 回调执行，准备滚动')
          scrollToBottom()
        })
      } else {
        console.warn('[Chatbot] ⚠️ 未找到assistant消息，无法更新内容')
        console.warn('[Chatbot] 当前消息列表:', messages.value.map(m => ({ role: m.role, id: m.id, contentLength: m.content.length })))
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

    console.log('[Chatbot] 进入流式读取循环')
    while (true) {
      const { done, value } = await reader.read()
      
      if (done) {
        console.log('[Chatbot] 流式读取完成，共读取', chunkCount, '个数据块')
        break
      }

      chunkCount++
      const decoded = decoder.decode(value, { stream: true })
      console.log(`[Chatbot] 数据块 #${chunkCount}, 原始字节长度:`, value.length, '解码后长度:', decoded.length)
      console.log(`[Chatbot] 数据块 #${chunkCount} 内容预览:`, decoded.substring(0, 100).replace(/\n/g, '\\n'))
      
      buffer += decoded
      const lines = buffer.split('\n')
      buffer = lines.pop() || ''
      
      console.log(`[Chatbot] 数据块 #${chunkCount} 解析出 ${lines.length} 行，缓冲区剩余:`, buffer.length)

      for (const line of lines) {
        lineCount++
        console.log(`[Chatbot] 处理第 ${lineCount} 行:`, line.substring(0, 100))
        
        if (line.startsWith('event:')) {
          currentEvent = line.substring(6).trim()
          console.log(`[Chatbot] 检测到事件类型: "${currentEvent}"`)
        } else if (line.startsWith('data:')) {
          const data = line.substring(5).trim()
          console.log(`[Chatbot] 检测到数据行，长度:`, data.length, '预览:', data.substring(0, 100))
          if (currentData) {
            currentData += '\n' + data
            console.log(`[Chatbot] 追加数据，当前数据总长度:`, currentData.length)
          } else {
            currentData = data
            console.log(`[Chatbot] 设置新数据，长度:`, currentData.length)
          }
        } else if (line === '') {
          // 空行表示一个事件结束
          console.log(`[Chatbot] 遇到空行，准备处理事件。currentEvent: "${currentEvent}", currentData长度: ${currentData.length}`)
          
          if (currentData) {
            console.log(`[Chatbot] 完整数据内容:`, currentData.substring(0, 200))
            
            if (currentData === '[DONE]') {
              console.log('[Chatbot] 收到 [DONE] 信号，结束流式读取')
              sending.value = false
              // 确保状态更新为 'done'，通过 updateAssistantMessage 统一更新
              updateAssistantMessage(accumulatedContent, 'done')
              cleanupSource()
              return
            }

            // 优先处理特殊事件类型（ack/session/complete/timeout/error），避免被误判为消息
            // 注意：即使 currentEvent 为 null，也要检查数据内容，避免将特殊事件的数据当作消息
            // 首先检查数据内容，无论 currentEvent 是什么
            const trimmedData = currentData.trim()
            
            // 检查是否是 ack 消息（格式: "已收到: xxx" 或 "ack"）
            if (currentEvent === 'ack' || trimmedData.startsWith('已收到:') || trimmedData === 'ack') {
              // ack 事件只更新交互时间，不显示内容
              console.log('[Chatbot] ✅ 收到 ack 事件，更新交互时间，数据:', trimmedData.substring(0, 50))
              lastInteraction.value = Date.now()
              // 重置状态，准备下一个事件
              currentEvent = null
              currentData = ''
              continue
            }
            
            // 检查是否是 session ID（UUID 格式）
            if (currentEvent === 'session' || /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i.test(trimmedData)) {
              console.log('[Chatbot] 🔄 处理 session 事件')
              const newSessionId = currentData
              // 过滤掉 ping 消息（格式: ": ping - 时间戳"）
              if (newSessionId && !newSessionId.startsWith(': ping')) {
                // 如果当前 sessionId 为空或不同，更新为 chatbot 返回的 session_id
                if (!sessionId.value || newSessionId !== sessionId.value) {
                  console.log('[Chatbot] 更新 sessionId:', sessionId.value || 'null', '->', newSessionId)
                  sessionId.value = newSessionId
                  lastInteraction.value = Date.now()
                }
              } else if (newSessionId && newSessionId.startsWith(': ping')) {
                console.log('[Chatbot] ⏭️ 过滤掉 session 事件中的 ping 消息:', newSessionId)
              }
              // 重置状态，准备下一个事件
              currentEvent = null
              currentData = ''
              continue
            }
            
            // 检查是否是 complete/done 消息
            if (currentEvent === 'complete' || trimmedData === 'done' || trimmedData === 'complete') {
              console.log('[Chatbot] ✅ 收到 complete 事件，结束流式读取，数据:', trimmedData)
              sending.value = false
              // 通过 updateAssistantMessage 更新状态，确保响应式更新
              updateAssistantMessage(accumulatedContent, 'done')
              cleanupSource()
              return
            }
            
            // 检查是否是 timeout 事件
            if (currentEvent === 'timeout') {
              console.warn('[Chatbot] ⏱️ 收到 timeout 事件')
              sending.value = false
              // 通过 updateAssistantMessage 更新状态，确保响应式更新
              updateAssistantMessage(accumulatedContent || '会话已超时，请重新开始', 'error')
              uni.showToast({
                title: '会话已超时，请重新开始',
                icon: 'none'
              })
              cleanupSource()
              return
            }
            
            // 检查是否是 error 事件
            if (currentEvent === 'error') {
              console.error('[Chatbot] ❌ 收到 error 事件:', currentData)
              sending.value = false
              const errorMsg = currentData || '客服服务异常'
              // 通过 updateAssistantMessage 更新状态，确保响应式更新
              updateAssistantMessage(accumulatedContent || errorMsg, 'error')
              // 如果是认证错误，提示用户登录
              if (errorMsg.includes('Unauthorized') || errorMsg.includes('请先登录') || errorMsg.includes('认证失败')) {
                uni.showToast({
                  title: '请先登录后再使用智能客服',
                  icon: 'none'
                })
              } else {
                uni.showToast({
                  title: errorMsg,
                  icon: 'none'
                })
              }
              cleanupSource()
              return
            }
            
            // 处理 message 事件或其他未知事件（但必须是 JSON 格式）
            if (currentEvent === 'message' || (!currentEvent && currentData)) {
              // 处理 message 事件：只处理 JSON 格式的消息，过滤掉 ping 消息
              // 首先过滤掉所有非消息类型的数据
              
              // 过滤掉 ping 消息（格式: ": ping - 时间戳"）
              if (currentData.trim().startsWith(': ping')) {
                console.log('[Chatbot] ⏭️ 过滤掉 message 事件中的 ping 消息:', currentData.substring(0, 50))
                // 重置状态，继续处理下一个事件
                currentEvent = null
                currentData = ''
                continue
              }
              
              // 过滤掉日志消息（格式: "@docker (1016-1020)" 等）
              if (currentData.trim().startsWith('@')) {
                console.log('[Chatbot] ⏭️ 过滤掉日志消息:', currentData.substring(0, 50))
                // 重置状态，继续处理下一个事件
                currentEvent = null
                currentData = ''
                continue
              }
              
              // 过滤掉 ack 消息内容（格式: "已收到: xxx"）
              if (currentData.trim().startsWith('已收到:')) {
                console.log('[Chatbot] ⏭️ 过滤掉 ack 消息内容:', currentData.substring(0, 50))
                // 重置状态，继续处理下一个事件
                currentEvent = null
                currentData = ''
                continue
              }
              
              // 过滤掉 session ID（UUID 格式）
              if (/^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i.test(currentData.trim())) {
                console.log('[Chatbot] ⏭️ 过滤掉 session ID:', currentData.substring(0, 50))
                // 重置状态，继续处理下一个事件
                currentEvent = null
                currentData = ''
                continue
              }
              
              // 过滤掉 done/complete 消息
              if (currentData.trim() === 'done' || currentData.trim() === 'complete') {
                console.log('[Chatbot] ⏭️ 过滤掉 done/complete 消息:', currentData)
                // 重置状态，继续处理下一个事件
                currentEvent = null
                currentData = ''
                continue
              }
              
              // 只处理 JSON 格式的消息
              if (!currentData.trim().startsWith('{') && !currentData.trim().startsWith('[')) {
                console.log('[Chatbot] ⏭️ 跳过非 JSON 格式的 message 数据:', currentData.substring(0, 50))
                // 重置状态，继续处理下一个事件
                currentEvent = null
                currentData = ''
                continue
              }
              
              // 尝试解析 JSON 并提取内容
              let content = null
              try {
                console.log('[Chatbot] 尝试解析 JSON...')
                const parsed = JSON.parse(currentData)
                console.log('[Chatbot] ✅ JSON 解析成功:', JSON.stringify(parsed).substring(0, 200))
                
                // 优先处理 choices[0].delta.content 格式（OpenAI/DeepSeek 格式）
                if (parsed.choices && parsed.choices[0] && parsed.choices[0].delta) {
                  content = parsed.choices[0].delta.content || ''
                  console.log('[Chatbot] ✅ 提取 content (choices.delta):', content, '长度:', content.length, '类型:', typeof content)
                  console.log('[Chatbot] 完整 delta 对象:', JSON.stringify(parsed.choices[0].delta))
                } 
                // 处理直接 content 字段
                else if (parsed.content) {
                  content = parsed.content || ''
                  console.log('[Chatbot] ✅ 提取 content (直接字段):', content, '长度:', content.length)
                } 
                // 如果都没有，但数据格式正确，可能是空内容
                else {
                  console.warn('[Chatbot] ⚠️ JSON 结构中没有找到 content，完整对象:', JSON.stringify(parsed).substring(0, 300))
                  content = null
                }
              } catch (e) {
                // JSON 解析失败
                console.warn('[Chatbot] ❌ JSON 解析失败，可能是格式错误。错误:', e.message, '数据预览:', currentData.substring(0, 200))
                content = null
              }
              
              // 处理内容（如果解析成功）
              if (content !== null && content !== undefined) {
                const contentStr = String(content)
                const oldAccumulatedLength = accumulatedContent.length
                // 累积内容
                accumulatedContent += contentStr
                console.log('[Chatbot] 📝 累积 content:')
                console.log('  - 之前长度:', oldAccumulatedLength)
                console.log('  - 新增长度:', contentStr.length)
                console.log('  - 当前总长度:', accumulatedContent.length)
                console.log('  - 新增内容预览:', contentStr.substring(0, 100))
                console.log('  - 累积内容预览:', accumulatedContent.substring(0, 200))
                // 更新消息
                console.log('[Chatbot] 准备调用 updateAssistantMessage...')
                updateAssistantMessage(accumulatedContent)
                console.log('[Chatbot] updateAssistantMessage 调用完成')
              } else {
                console.log('[Chatbot] ⏭️ content 为 null 或 undefined，跳过内容处理')
              }
            } else if (currentEvent) {
              console.log(`[Chatbot] ℹ️ 收到未处理的事件类型: "${currentEvent}"`)
            }
            // 处理完事件后，重置状态，准备下一个事件
            console.log('[Chatbot] 重置事件状态，准备下一个事件')
            currentEvent = null
            currentData = ''
          } else {
            // 即使 currentData 为空，也要重置 currentEvent
            console.log('[Chatbot] currentData 为空，重置 currentEvent')
            currentEvent = null
          }
        }
      }
    }

    // 处理最后的数据
    console.log('[Chatbot] 流式读取循环结束，处理缓冲区剩余数据，长度:', buffer.length)
    if (buffer.trim()) {
      console.log('[Chatbot] 缓冲区内容:', buffer.substring(0, 200))
      if (buffer.trim() === '[DONE]') {
        console.log('[Chatbot] ✅ 缓冲区包含 [DONE]，结束流式读取')
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
            console.log('[Chatbot] 处理缓冲区后，累积内容长度:', accumulatedContent.length)
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
    console.log('[Chatbot] === 流式处理完成 ===')
    // #endif

    // #ifndef H5
    // 非 H5 端使用轮询方式（如果需要支持小程序等）
    uni.showToast({
      title: '当前环境不支持流式响应',
      icon: 'none'
    })
    sending.value = false
    // #endif
  } catch (error) {
    console.error('[Chatbot] ❌ 流式处理异常:', error)
    console.error('[Chatbot] 错误堆栈:', error.stack)
    console.error('[Chatbot] 错误详情:', {
      name: error.name,
      message: error.message,
      cause: error.cause
    })
    sending.value = false
    // 通过 updateAssistantMessage 更新状态，确保响应式更新
    updateAssistantMessage(error.message || '连接失败，请稍后重试', 'error')
    uni.showToast({
      title: error.message || '连接失败，请稍后重试',
      icon: 'none'
    })
    cleanupSource()
    console.error('[Chatbot] === 流式处理异常结束 ===')
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
  console.log('[Chatbot] === 开始加载历史记录 ===')
  console.log('[Chatbot] 当前会话ID:', sessionId.value)
  console.log('[Chatbot] 当前消息数量:', messages.value.length)
  
  const loginResult = uni.getStorageSync('loginResult')
  if (!loginResult) {
    console.warn('[Chatbot] 未找到登录信息')
    uni.showToast({
      title: '无法获取用户信息',
      icon: 'none'
    })
    return
  }

  uni.showLoading({
    title: '加载中...'
  })

  // 构建 URL，确保使用查询参数而不是路径参数
  // 注意：如果 sessionId 存在，只加载该会话的历史；如果不存在，加载所有会话的历史
  let url = '/p/chatbot/history'
  const params = []
  if (sessionId.value) {
    params.push(`sessionId=${encodeURIComponent(sessionId.value)}`)
  }
  params.push('limit=50')
  if (params.length > 0) {
    url += `?${params.join('&')}`
  }
  
  console.log('[Chatbot] 历史记录请求URL:', url)

  http.request({
    url: url,
    method: 'GET',
    data: {}
  })
    .then(({ data }) => {
      console.log('[Chatbot] ✅ 历史记录请求成功')
      console.log('[Chatbot] 返回数据:', data)
      
      uni.hideLoading()
      const list = data || []
      console.log('[Chatbot] 历史记录数量:', list.length)
      
      // 清空前端缓存的消息，使用 API 返回的数据
      console.log('[Chatbot] 清空前端缓存，之前消息数量:', messages.value.length)
      messages.value = []
      console.log('[Chatbot] 清空后消息数量:', messages.value.length)
      
      if (list.length === 0) {
        console.log('[Chatbot] 没有历史记录')
        // 如果没有历史记录，不显示提示，保持空列表即可
        return
      }
      
      // 按时间顺序处理，确保用户消息和助手消息成对出现
      const newMessages = []
      list.forEach((item, index) => {
        console.log(`[Chatbot] 处理历史记录 #${index + 1}:`, {
          hasMessage: !!item.message,
          hasResponse: !!item.response,
          sessionId: item.sessionId
        })
        
        if (item.message) {
          const userMsg = createMessage('user', item.message)
          console.log(`[Chatbot] 添加用户消息:`, userMsg.id, '内容长度:', userMsg.content.length)
          newMessages.push(userMsg)
        }
        if (item.response) {
          // 提取响应内容，如果是 JSON 格式则解析
          console.log(`[Chatbot] 原始响应内容类型:`, typeof item.response)
          console.log(`[Chatbot] 原始响应内容预览:`, typeof item.response === 'string' ? item.response.substring(0, 200) : JSON.stringify(item.response).substring(0, 200))
          
          const responseContent = extractResponseContent(item.response)
          console.log(`[Chatbot] 提取后的响应内容长度:`, responseContent.length)
          console.log(`[Chatbot] 提取后的响应内容预览:`, responseContent.substring(0, 200))
          
          if (responseContent) {
            const assistantMsg = createMessage('assistant', responseContent)
            console.log(`[Chatbot] 添加助手消息:`, assistantMsg.id, '内容长度:', assistantMsg.content.length)
            newMessages.push(assistantMsg)
          }
        }
      })
      
      console.log('[Chatbot] 处理完成，新消息数量:', newMessages.length)
      console.log('[Chatbot] 新消息列表:', newMessages.map(m => ({ role: m.role, id: m.id, contentLength: m.content.length })))
      
      // 使用 API 返回的数据替换前端缓存
      messages.value = newMessages
      console.log('[Chatbot] ✅ 历史记录已加载到 messages.value，数量:', messages.value.length)
      
      // 如果返回的数据中有 sessionId，更新当前会话 ID
      if (list.length > 0 && list[0].sessionId && list[0].sessionId !== sessionId.value) {
        console.log('[Chatbot] 更新 sessionId:', sessionId.value, '->', list[0].sessionId)
        sessionId.value = list[0].sessionId
      }
      
      nextTick(() => {
        console.log('[Chatbot] nextTick 回调，准备滚动到底部')
        scrollToBottom()
      })
      
      console.log('[Chatbot] === 历史记录加载完成 ===')
    })
    .catch((err) => {
      console.error('[Chatbot] ❌ 加载历史记录失败:', err)
      console.error('[Chatbot] 错误详情:', {
        message: err.message,
        msg: err.msg,
        response: err.response
      })
      
      uni.hideLoading()
      uni.showToast({
        title: err.msg || err.message || '加载历史记录失败',
        icon: 'none'
      })
      // 加载失败时，清空消息列表，避免显示错误的缓存数据
      messages.value = []
      console.error('[Chatbot] === 历史记录加载失败 ===')
    })
}

const clearHistory = () => {
  // 如果没有 sessionId，直接清空消息即可
  if (!sessionId.value) {
    messages.value = []
    return
  }

  // 先关闭对话框，避免弹窗被遮挡
  const wasVisible = visible.value
  if (wasVisible) {
    visible.value = false
  }

  uni.showModal({
    title: '提示',
    content: '确定要清空会话记录吗？',
    success: (res) => {
      if (res.confirm) {
        http.request({
          url: `/p/chatbot/history/${sessionId.value}`,
          method: 'DELETE',
          data: {}
        })
          .then(() => {
            messages.value = []
            // 清空会话后，重置 sessionId 为空，下次创建新会话
            sessionId.value = null
            uni.showToast({
              title: '已清空会话记录',
              icon: 'success'
            })
            // 如果之前对话框是打开的，重新打开
            if (wasVisible) {
              setTimeout(() => {
                visible.value = true
              }, 300)
            }
          })
          .catch((err) => {
            console.error('清空失败:', err)
            uni.showToast({
              title: err.msg || '清空失败',
              icon: 'none'
            })
            // 如果之前对话框是打开的，重新打开
            if (wasVisible) {
              setTimeout(() => {
                visible.value = true
              }, 300)
            }
          })
      } else {
        // 取消时，如果之前对话框是打开的，重新打开
        if (wasVisible) {
          setTimeout(() => {
            visible.value = true
          }, 300)
        }
      }
    },
    fail: () => {
      // 失败时，如果之前对话框是打开的，重新打开
      if (wasVisible) {
        setTimeout(() => {
          visible.value = true
        }, 300)
      }
    }
  })
}

onBeforeUnmount(() => {
  cleanupSource()
})
</script>

<style scoped lang="scss">
.chatbot-widget {
  position: fixed;
  right: 24rpx;
  bottom: 24rpx;
  z-index: 9999;
  
  /* PC 端适配 */
  @media screen and (min-width: 768px) {
    right: 20px;
    bottom: 20px;
  }
}

.chatbot-trigger {
  width: 100rpx;
  height: 100rpx;
  border-radius: 50%;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  box-shadow: 0 8rpx 24rpx rgba(102, 126, 234, 0.35);
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  transition: transform 0.3s;

  &:active {
    transform: scale(0.95);
  }

  .chatbot-icon {
    font-size: 48rpx;
  }
}

.chatbot-mask {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: rgba(0, 0, 0, 0.5);
  z-index: 10000;
  display: flex;
  align-items: center;
  justify-content: center;
  
  /* PC 端适配 */
  @media screen and (min-width: 768px) {
    align-items: flex-end;
    justify-content: flex-end;
    padding: 20px;
  }
}

.chatbot-dialog {
  width: 92%;
  max-width: 640rpx;
  height: 85vh;
  max-height: 900rpx;
  background-color: #fff;
  border-radius: 24rpx 24rpx 0 0;
  display: flex;
  flex-direction: column;
  overflow: hidden;
  box-shadow: 0 -4rpx 20rpx rgba(0, 0, 0, 0.1);
  
  /* PC 端适配 */
  @media screen and (min-width: 768px) {
    width: 600px;
    max-width: 600px;
    height: 700px;
    max-height: 700px;
    border-radius: 16px;
  }
  
  @media screen and (min-width: 1024px) {
    width: 700px;
    max-width: 700px;
    height: 800px;
    max-height: 800px;
  }
}

.chatbot-header {
  display: flex;
  align-items: center;
  padding: 32rpx 32rpx 24rpx;
  border-bottom: 1rpx solid #f0f0f0;
  position: relative;
  background: linear-gradient(180deg, #fff 0%, #fafafa 100%);

  .chatbot-title {
    font-size: 36rpx;
    font-weight: 600;
    color: #1a1a1a;
    flex: 1;
    letter-spacing: 0.5rpx;
  }

  .chatbot-status {
    font-size: 20rpx;
    padding: 6rpx 16rpx;
    border-radius: 20rpx;
    margin-left: 16rpx;
    border: 1rpx solid;
    font-weight: 500;

    &.success {
      background-color: #f0f9ff;
      color: #52c41a;
      border-color: #b7eb8f;
    }

    &.danger {
      background-color: #fff1f0;
      color: #ff4d4f;
      border-color: #ffccc7;
    }
  }

  .close-btn {
    position: absolute;
    right: 24rpx;
    top: 50%;
    transform: translateY(-50%);
    font-size: 44rpx;
    color: #8c8c8c;
    width: 56rpx;
    height: 56rpx;
    display: flex;
    align-items: center;
    justify-content: center;
    line-height: 1;
    border-radius: 50%;
    transition: all 0.2s;

    &:active {
      background-color: #f5f5f5;
      color: #595959;
    }
  }
}

.chatbot-messages {
  flex: 1;
  min-height: 0;
  padding: 32rpx 24rpx;
  background: linear-gradient(180deg, #f5f7fa 0%, #fafbfc 100%);
  overflow-y: auto;
}

.chatbot-message {
  display: flex;
  margin-bottom: 32rpx;
  animation: fadeIn 0.3s ease-in;

  &.user {
    justify-content: flex-end;
  }

  &.assistant {
    justify-content: flex-start;
  }
}

@keyframes fadeIn {
  from {
    opacity: 0;
    transform: translateY(10rpx);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.message-wrapper {
  max-width: 75%;
  display: flex;
  flex-direction: column;
}

.bubble {
  padding: 20rpx 24rpx;
  border-radius: 20rpx;
  line-height: 1.6;
  font-size: 30rpx;
  word-wrap: break-word;
  word-break: break-word;
  position: relative;
  box-shadow: 0 2rpx 12rpx rgba(0, 0, 0, 0.08);

  .message-text {
    display: block;
    white-space: pre-wrap;
  }

  &.loading {
    padding: 24rpx 28rpx;
  }

  &.error {
    background-color: #fff1f0 !important;
    color: #ff4d4f !important;
  }

  .chatbot-message.user & {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: #fff;
    border-bottom-right-radius: 6rpx;
    margin-left: auto;
  }

  .chatbot-message.assistant & {
    background-color: #fff;
    color: #1a1a1a;
    border-bottom-left-radius: 6rpx;
    border: 1rpx solid #f0f0f0;
  }

  .loading-dots {
    display: inline-flex;
    align-items: center;
    gap: 8rpx;
    margin-left: 12rpx;
    vertical-align: middle;

    .dot {
      width: 8rpx;
      height: 8rpx;
      border-radius: 50%;
      background-color: #999;
      animation: dotPulse 1.4s infinite ease-in-out;

      &:nth-child(1) {
        animation-delay: 0s;
      }

      &:nth-child(2) {
        animation-delay: 0.2s;
      }

      &:nth-child(3) {
        animation-delay: 0.4s;
      }
    }
  }

  @keyframes dotPulse {
    0%, 80%, 100% {
      transform: scale(0.8);
      opacity: 0.5;
    }
    40% {
      transform: scale(1.2);
      opacity: 1;
    }
  }

  .error-icon {
    font-size: 28rpx;
    margin-left: 8rpx;
  }
}

.chatbot-input {
  padding: 20rpx 24rpx 24rpx;
  border-top: 1rpx solid #f0f0f0;
  background-color: #fff;
  box-shadow: 0 -2rpx 10rpx rgba(0, 0, 0, 0.03);
}

.input-wrapper {
  display: flex;
  align-items: flex-end;
  gap: 16rpx;
  margin-bottom: 16rpx;
}

.chatbot-textarea {
  flex: 1;
  min-height: 80rpx;
  max-height: 200rpx;
  padding: 20rpx 24rpx;
  border: 2rpx solid #e8e8e8;
  border-radius: 24rpx;
  font-size: 30rpx;
  line-height: 1.5;
  box-sizing: border-box;
  background-color: #fafafa;
  transition: all 0.2s;

  &:focus {
    border-color: #667eea;
    background-color: #fff;
  }
}

.send-btn {
  width: 80rpx;
  height: 80rpx;
  border-radius: 50%;
  background-color: #e8e8e8;
  color: #999;
  display: flex;
  align-items: center;
  justify-content: center;
  transition: all 0.3s;
  flex-shrink: 0;

  .send-icon {
    font-size: 36rpx;
    line-height: 1;
  }

  &.active {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: #fff;
    box-shadow: 0 4rpx 12rpx rgba(102, 126, 234, 0.4);
    transform: scale(1);
  }

  &.disabled {
    background-color: #e8e8e8;
    color: #999;
    transform: scale(0.95);
  }

  &:active {
    transform: scale(0.9);
  }
}

.chatbot-input__actions {
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 16rpx;
  font-size: 24rpx;
  padding-top: 8rpx;

  .action-link {
    color: #667eea;
    font-size: 24rpx;
    padding: 8rpx 0;
    transition: color 0.2s;

    &:active {
      color: #764ba2;
    }

    &.danger {
      color: #ff7875;
    }
  }

  .divider {
    color: #d9d9d9;
    font-size: 20rpx;
  }
}
</style>

