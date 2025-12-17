<template>
  <view class="price-display" :class="[`price-${size}`]">
    <text class="price-symbol">¥</text>
    <text class="price-integer">{{ priceInteger }}</text>
    <text class="price-decimal">.{{ priceDecimal }}</text>
  </view>
</template>

<script setup>
import { computed } from 'vue'

const props = defineProps({
  price: {
    type: [Number, String],
    required: true,
    default: 0
  },
  size: {
    type: String,
    default: 'md', // sm | md | lg
    validator: (value) => ['sm', 'md', 'lg'].includes(value)
  }
})

const priceInteger = computed(() => {
  const numPrice = typeof props.price === 'string' ? parseFloat(props.price) : props.price
  return Math.floor(numPrice)
})

const priceDecimal = computed(() => {
  const numPrice = typeof props.price === 'string' ? parseFloat(props.price) : props.price
  const priceStr = numPrice.toFixed(2)
  const parts = priceStr.split('.')
  return parts[1] || '00'
})
</script>

<style lang="scss" scoped>
.price-display {
  display: inline-flex;
  align-items: baseline;
  color: $color-primary;
  
  &.price-sm {
    .price-symbol {
      font-size: $font-xs;
    }
    
    .price-integer {
      font-size: $font-lg;
      font-weight: 600;
    }
    
    .price-decimal {
      font-size: $font-xs;
    }
  }
  
  &.price-md {
    .price-symbol {
      font-size: $font-sm;
    }
    
    .price-integer {
      font-size: $font-xl;
      font-weight: 600;
    }
    
    .price-decimal {
      font-size: $font-sm;
    }
  }
  
  &.price-lg {
    .price-symbol {
      font-size: $font-base;
    }
    
    .price-integer {
      font-size: $font-2xl;
      font-weight: 700;
    }
    
    .price-decimal {
      font-size: $font-base;
    }
  }
}
</style>
