<template>
  <div class="mod-chatbot-config">
    <el-card>
      <template #header>
        <div class="card-header">
          <span>智能客服配置</span>
        </div>
      </template>
      <el-form
        ref="formRef"
        :model="dataForm"
        :rules="dataRule"
        label-width="150px"
      >
        <el-form-item
          label="Agent 服务地址"
          prop="url"
        >
          <el-input
            v-model="dataForm.url"
            placeholder="请输入 Agent 服务地址，例如：http://localhost:8000"
            style="width: 500px"
          />
          <div class="form-tip">
            Agent 服务的完整地址，例如：http://localhost:8000 或 https://api.example.com
          </div>
        </el-form-item>

        <el-form-item
          label="API 路径"
          prop="apiPath"
        >
          <el-input
            v-model="dataForm.apiPath"
            placeholder="/api/chat/stream"
            style="width: 500px"
          />
          <div class="form-tip">
            流式接口的路径，默认为 /api/chat/stream
          </div>
        </el-form-item>

        <el-form-item
          label="API Key"
          prop="apiKey"
        >
          <el-input
            v-model="dataForm.apiKey"
            type="password"
            show-password
            placeholder="请输入 API Key（可选，用于外部接口认证）"
            style="width: 500px"
          />
          <div class="form-tip">
            API Key 用于认证外部接口，如果第三方 Agent 服务需要 API Key 认证，请在此填写
          </div>
        </el-form-item>

        <el-form-item
          label="请求超时时间"
          prop="timeout"
        >
          <el-input-number
            v-model="dataForm.timeout"
            :min="1000"
            :max="300000"
            :step="1000"
            style="width: 200px"
          />
          <span style="margin-left: 10px; color: #909399">毫秒</span>
          <div class="form-tip">
            请求第三方服务的超时时间，建议 30000 毫秒
          </div>
        </el-form-item>

        <el-form-item
          label="会话超时时间"
          prop="sessionTimeout"
        >
          <el-input-number
            v-model="dataForm.sessionTimeout"
            :min="60000"
            :max="3600000"
            :step="60000"
            style="width: 200px"
          />
          <span style="margin-left: 10px; color: #909399">毫秒</span>
          <div class="form-tip">
            会话超时时间，建议 300000 毫秒（5分钟）
          </div>
        </el-form-item>

        <el-form-item
          label="是否启用"
          prop="enabled"
        >
          <el-switch
            v-model="dataForm.enabled"
            active-text="启用"
            inactive-text="禁用"
          />
          <div class="form-tip">
            关闭后，用户端将无法使用智能客服功能
          </div>
        </el-form-item>

        <el-form-item
          label="启用记忆功能"
          prop="memoryEnable"
        >
          <el-switch
            v-model="dataForm.memoryEnable"
            active-text="启用"
            inactive-text="禁用"
          />
          <div class="form-tip">
            是否向第三方 Agent 传递 memory_enable 参数
          </div>
        </el-form-item>

        <el-form-item>
          <el-button
            type="primary"
            @click="onSubmit"
          >
            保存配置
          </el-button>
          <el-button @click="onReset">
            重置
          </el-button>
        </el-form-item>
      </el-form>
    </el-card>
  </div>
</template>

<script setup>
import { ElMessage } from 'element-plus'
import { Debounce } from '@/utils/debounce'

const formRef = ref(null)
const dataForm = reactive({
  id: null,
  url: '',
  apiPath: '/api/chat/stream',
  timeout: 30000,
  sessionTimeout: 300000,
  enabled: true,
  memoryEnable: true,
  apiKey: ''
})

const dataRule = {
  url: [
    { required: true, message: 'Agent 服务地址不能为空', trigger: 'blur' },
    { type: 'string', pattern: /^https?:\/\/.+/, message: '请输入有效的 URL 地址（以 http:// 或 https:// 开头）', trigger: 'blur' }
  ],
  apiPath: [
    { required: true, message: 'API 路径不能为空', trigger: 'blur' }
  ],
  timeout: [
    { required: true, message: '请求超时时间不能为空', trigger: 'blur' },
    { type: 'number', min: 1000, max: 300000, message: '超时时间应在 1000-300000 毫秒之间', trigger: 'blur' }
  ],
  sessionTimeout: [
    { required: true, message: '会话超时时间不能为空', trigger: 'blur' },
    { type: 'number', min: 60000, max: 3600000, message: '会话超时时间应在 60000-3600000 毫秒之间', trigger: 'blur' }
  ]
}

/**
 * 获取配置
 */
const getConfig = () => {
  http({
    url: http.adornUrl('/admin/chatbot/config'),
    method: 'get'
  }).then(({ data }) => {
    if (data) {
      dataForm.id = data.id
      dataForm.url = data.url || ''
      dataForm.apiPath = data.apiPath || '/api/chat/stream'
      dataForm.timeout = data.timeout || 30000
      dataForm.sessionTimeout = data.sessionTimeout || 300000
      dataForm.enabled = data.enabled !== false
      dataForm.memoryEnable = data.memoryEnable !== false
      dataForm.apiKey = data.apiKey || ''
    }
  }).catch(() => {
    ElMessage.error('获取配置失败')
  })
}

/**
 * 表单提交
 */
const onSubmit = Debounce(() => {
  formRef.value?.validate((valid) => {
    if (valid) {
      http({
        url: http.adornUrl('/admin/chatbot/config'),
        method: 'put',
        data: http.adornData({
          id: dataForm.id,
          url: dataForm.url,
          apiPath: dataForm.apiPath,
          timeout: dataForm.timeout,
          sessionTimeout: dataForm.sessionTimeout,
          enabled: dataForm.enabled,
          memoryEnable: dataForm.memoryEnable,
          apiKey: dataForm.apiKey
        })
      }).then(() => {
        ElMessage({
          message: '保存成功',
          type: 'success',
          duration: 1500
        })
        getConfig()
      }).catch(() => {
        ElMessage.error('保存失败')
      })
    }
  })
})

/**
 * 重置表单
 */
const onReset = () => {
  formRef.value?.resetFields()
  getConfig()
}

// 页面加载时获取配置
onMounted(() => {
  getConfig()
})
</script>

<style scoped lang="scss">
.mod-chatbot-config {
  padding: 20px;

  .card-header {
    font-size: 16px;
    font-weight: 600;
  }

  .form-tip {
    font-size: 12px;
    color: #909399;
    margin-top: 4px;
    line-height: 1.5;
  }
}
</style>

