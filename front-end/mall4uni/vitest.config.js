import { defineConfig } from 'vitest/config'
import path from 'path'
import AutoImport from 'unplugin-auto-import/vite'

// https://vitest.dev/config/
export default defineConfig({
  plugins: [
    AutoImport({
      imports: [
        'vue',
        'vitest'
      ],
      dirs: [
        'src/utils',
        'src/wxs/**'
      ],
      dts: 'src/auto-imports.d.ts',
      eslintrc: {
        enabled: true
      }
    })
  ],
  test: {
    environment: 'node',
    globals: true,
    coverage: {
      reporter: ['text', 'json', 'html'],
      include: ['src/utils/**', 'src/components/ui/**']
    }
  },
  resolve: {
    alias: {
      '@': path.resolve(__dirname, 'src')
    }
  }
})
