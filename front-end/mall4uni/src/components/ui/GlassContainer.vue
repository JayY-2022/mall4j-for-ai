<template>
  <view class="glass-container" :class="[`glass-${variant}`]">
    <slot />
  </view>
</template>

<script setup>
defineProps({
  variant: {
    type: String,
    default: 'light', // light | dark
    validator: (value) => ['light', 'dark'].includes(value)
  }
})
</script>

<style lang="scss" scoped>
.glass-container {
  border: 1rpx solid rgba(255, 255, 255, 0.2);
  
  // CSS 降级方案：先设置不透明背景
  &.glass-light {
    background: rgba(255, 255, 255, 0.95);
  }
  
  &.glass-dark {
    background: rgba(0, 0, 0, 0.8);
    color: #fff;
  }
  
  // 使用 @supports 检测毛玻璃效果支持
  @supports (backdrop-filter: blur(20rpx)) or (-webkit-backdrop-filter: blur(20rpx)) {
    backdrop-filter: blur(20rpx);
    -webkit-backdrop-filter: blur(20rpx);
    
    &.glass-light {
      background: rgba(255, 255, 255, 0.85);
    }
    
    &.glass-dark {
      background: rgba(0, 0, 0, 0.6);
    }
  }
}
</style>
