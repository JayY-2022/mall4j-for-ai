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

/* ============================================
   页面过渡动画
   Requirements: 7.1
   ============================================ */

/* 页面淡入过渡动画 */
@keyframes pageFadeIn {
  from {
    opacity: 0;
    transform: translateY(20rpx);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

/* 应用到所有页面 */
page {
  animation: pageFadeIn 250ms cubic-bezier(0.33, 1, 0.68, 1);
}

/* 页面切换过渡效果 */
.uni-page-wrapper {
  animation: pageFadeIn 250ms cubic-bezier(0.33, 1, 0.68, 1);
}

/* 为页面内容添加过渡 */
.page-content {
  animation: pageFadeIn 300ms cubic-bezier(0.33, 1, 0.68, 1);
}

/* 减少动画 - 尊重用户偏好设置 */
@media (prefers-reduced-motion: reduce) {
  page,
  .uni-page-wrapper,
  .page-content {
    animation-duration: 0.01ms !important;
  }
}
</style>
