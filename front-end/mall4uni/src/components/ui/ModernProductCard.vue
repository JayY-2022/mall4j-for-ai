<template>
  <view 
    class="modern-card"
    :class="{ 'card-pressed': isPressed }"
    @touchstart="handleTouchStart"
    @touchend="handleTouchEnd"
    @tap="handleTap"
  >
    <view class="card-image">
      <image :src="product.pic" mode="aspectFill" />
    </view>
    <view class="card-content">
      <text class="card-title">{{ product.prodName }}</text>
      <text class="card-desc" v-if="product.brief">{{ product.brief }}</text>
      <view class="card-footer">
        <PriceDisplay :price="product.price" size="md" />
        <view class="cart-btn" @tap.stop="handleAddCart">
          <text class="cart-icon">+</text>
        </view>
      </view>
    </view>
  </view>
</template>

<script setup>
import { ref } from 'vue'
import PriceDisplay from './PriceDisplay.vue'

const props = defineProps({
  product: {
    type: Object,
    required: true,
    default: () => ({
      pic: '',
      prodName: '',
      brief: '',
      price: 0
    })
  }
})

const emit = defineEmits(['tap', 'addCart'])

const isPressed = ref(false)

const handleTouchStart = () => {
  isPressed.value = true
}

const handleTouchEnd = () => {
  isPressed.value = false
}

const handleTap = () => {
  emit('tap')
}

const handleAddCart = () => {
  emit('addCart')
}
</script>

<style lang="scss" scoped>
.modern-card {
  background: #fff;
  border-radius: $radius-lg;
  box-shadow: $shadow-sm;
  overflow: hidden;
  transition: all $duration-normal $ease-out;
  
  &.card-pressed {
    transform: scale(0.98);
    box-shadow: $shadow-md;
  }
  
  .card-image {
    width: 100%;
    position: relative;
    
    // 降级方案：使用 padding-bottom 实现 1:1 比例
    padding-bottom: 100%;
    
    @supports (aspect-ratio: 1) {
      padding-bottom: 0;
      aspect-ratio: 1;
    }
    
    image {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
    }
  }
  
  .card-content {
    padding: $spacing-3;
  }
  
  .card-title {
    font-size: $font-base;
    color: $color-gray-800;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow: hidden;
    line-height: 1.4;
  }
  
  .card-desc {
    font-size: $font-sm;
    color: $color-gray-400;
    margin-top: $spacing-1;
    display: -webkit-box;
    -webkit-line-clamp: 1;
    -webkit-box-orient: vertical;
    overflow: hidden;
  }
  
  .card-footer {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-top: $spacing-2;
  }
  
  .cart-btn {
    width: 56rpx;
    height: 56rpx;
    background: $color-primary-gradient;
    border-radius: $radius-full;
    display: flex;
    align-items: center;
    justify-content: center;
    transition: transform $duration-fast $ease-out;
    
    &:active {
      transform: scale(0.9);
    }
    
    .cart-icon {
      color: #fff;
      font-size: $font-xl;
      font-weight: 500;
    }
  }
}
</style>
