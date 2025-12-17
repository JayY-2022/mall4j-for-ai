<template>
  <view 
    class="skeleton" 
    :class="[`skeleton-${variant}`]" 
    :style="customStyle"
  >
    <view class="skeleton-animation" />
  </view>
</template>

<script setup>
import { computed } from 'vue'

const props = defineProps({
  variant: {
    type: String,
    default: 'rect', // rect | circle | text
    validator: (value) => ['rect', 'circle', 'text'].includes(value)
  },
  width: {
    type: String,
    default: '100%'
  },
  height: {
    type: String,
    default: '100rpx'
  }
})

const customStyle = computed(() => ({
  width: props.width,
  height: props.height
}))
</script>

<style lang="scss" scoped>
.skeleton {
  background: $color-gray-200;
  position: relative;
  overflow: hidden;
  
  &.skeleton-rect {
    border-radius: $radius-md;
  }
  
  &.skeleton-circle {
    border-radius: $radius-full;
  }
  
  &.skeleton-text {
    border-radius: $radius-sm;
    height: 28rpx;
  }
  
  .skeleton-animation {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: linear-gradient(
      90deg,
      transparent 0%,
      rgba(255, 255, 255, 0.5) 50%,
      transparent 100%
    );
    animation: shimmer 1.5s infinite;
  }
}

@keyframes shimmer {
  0% { 
    transform: translateX(-100%); 
  }
  100% { 
    transform: translateX(100%); 
  }
}
</style>
