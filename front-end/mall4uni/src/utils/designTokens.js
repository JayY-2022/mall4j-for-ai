/**
 * Design System Tokens
 * This file exports the design tokens for validation and testing purposes
 * These values should match the SCSS variables in uni.scss
 */

export const designTokens = {
  colors: {
    primary: '#6366F1',
    primaryLight: '#818CF8',
    primaryDark: '#4F46E5',
    secondary: '#EC4899',
    success: '#10B981',
    warning: '#F59E0B',
    error: '#EF4444',
    info: '#3B82F6',
    gray: {
      50: '#F9FAFB',
      100: '#F3F4F6',
      200: '#E5E7EB',
      300: '#D1D5DB',
      400: '#9CA3AF',
      500: '#6B7280',
      600: '#4B5563',
      700: '#374151',
      800: '#1F2937',
      900: '#111827'
    }
  },
  spacing: {
    1: '8rpx',
    2: '16rpx',
    3: '24rpx',
    4: '32rpx',
    5: '40rpx',
    6: '48rpx',
    8: '64rpx',
    10: '80rpx',
    12: '96rpx'
  },
  radius: {
    sm: '8rpx',
    md: '16rpx',
    lg: '24rpx',
    xl: '32rpx',
    full: '9999rpx'
  },
  shadows: {
    sm: '0 2rpx 8rpx rgba(0, 0, 0, 0.04)',
    md: '0 8rpx 24rpx rgba(0, 0, 0, 0.08)',
    lg: '0 16rpx 48rpx rgba(0, 0, 0, 0.12)'
  },
  typography: {
    fontSize: {
      xs: '22rpx',
      sm: '24rpx',
      base: '28rpx',
      lg: '32rpx',
      xl: '36rpx',
      '2xl': '44rpx',
      '3xl': '56rpx'
    }
  },
  animation: {
    duration: {
      fast: '150ms',
      normal: '250ms',
      slow: '350ms'
    },
    easing: {
      out: 'cubic-bezier(0.33, 1, 0.68, 1)',
      inOut: 'cubic-bezier(0.65, 0, 0.35, 1)'
    }
  }
}

/**
 * Validates that all required design tokens are present
 * @returns {Object} Validation result with isValid flag and missing tokens
 */
export function validateDesignTokens() {
  const missing = []
  
  // Validate primary color
  if (!designTokens.colors.primary || designTokens.colors.primary !== '#6366F1') {
    missing.push('colors.primary')
  }
  
  // Validate spacing scale (should have 9 values)
  const spacingKeys = Object.keys(designTokens.spacing)
  if (spacingKeys.length !== 9) {
    missing.push('spacing scale (expected 9 values)')
  }
  
  // Validate border radius tokens (should have 5 values)
  const radiusKeys = Object.keys(designTokens.radius)
  if (radiusKeys.length !== 5) {
    missing.push('radius tokens (expected 5 values)')
  }
  
  // Validate shadow system (should have 3 levels)
  const shadowKeys = Object.keys(designTokens.shadows)
  if (shadowKeys.length !== 3) {
    missing.push('shadow system (expected 3 levels)')
  }
  
  // Validate typography scale (should have 7 sizes)
  const fontSizeKeys = Object.keys(designTokens.typography.fontSize)
  if (fontSizeKeys.length !== 7) {
    missing.push('typography scale (expected 7 sizes)')
  }
  
  return {
    isValid: missing.length === 0,
    missing
  }
}
