<script setup>
import { createApp, h } from 'vue'
import ChatbotWidget from '@/components/chatbot/ChatbotWidget.vue'
import http from '@/utils/http'

http.getCartCount()

// 在 H5 端，手动挂载智能客服组件到 body
// #ifdef H5
onMounted(() => {
  nextTick(() => {
    // 确保 body 已存在
    if (!document.body) {
      setTimeout(() => {
        mountChatbot()
      }, 100)
      return
    }
    mountChatbot()
  })
})

function mountChatbot() {
  // 检查是否已经挂载
  if (document.getElementById('chatbot-container')) {
    return
  }
  
  // 创建一个容器元素
  const chatbotContainer = document.createElement('div')
  chatbotContainer.id = 'chatbot-container'
  document.body.appendChild(chatbotContainer)
  
  // 创建 Vue 应用实例并挂载
  const chatbotApp = createApp({
    render: () => h(ChatbotWidget)
  })
  chatbotApp.mount(chatbotContainer)
}
// #endif
</script>

<style lang="scss" scoped>
@import "./app.css";
/* 隐藏头部 */
uni-page-head {
  display: none;
}
/* 轮播图指示点 */
uni-swiper .uni-swiper-dots-horizontal {
  bottom: 20px !important;
}
</style>
