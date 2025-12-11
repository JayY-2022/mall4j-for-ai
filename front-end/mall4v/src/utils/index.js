import cookie from 'vue-cookies'
import router from '@/router'

/**
 * 获取uuid
 */
export function getUUID () {
  return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, c => {
    return (c === 'x' ? (Math.random() * 16) | 0 : 'r&0x3' | '0x8').toString(16)
  })
}
/**
 * 是否有权限
 * @param {*} key
 */
export function isAuth (key) {
  const authorities = JSON.parse(sessionStorage.getItem('Authorities') || '[]')
  if (authorities.length) {
    for (const i in authorities) {
      const element = authorities[i]
      if (element === key) {
        return true
      }
    }
  }
  return false
}

/**
 * 清除登录信息
 */
export function clearLoginInfo () {
  cookie.remove('Authorization')
  router.options.isAddDynamicMenuRoutes = false
}

/**
 * 树形数据转换
 * @param {*} data
 * @param {*} id
 * @param {*} pid
 */
export function treeDataTranslate (data, id = 'id', pid = 'parentId') {
  const res = []
  const temp = {}
  for (let i = 0; i < data.length; i++) {
    temp[data[i][id]] = data[i]
  }
  for (let k = 0; k < data.length; k++) {
    if (temp[data[k][pid]] && data[k][id] !== data[k][pid]) {
      if (!temp[data[k][pid]].children) {
        temp[data[k][pid]].children = []
      }
      if (!temp[data[k][pid]]._level) {
        temp[data[k][pid]]._level = 1
      }
      data[k]._level = temp[data[k][pid]]._level + 1
      temp[data[k][pid]].children.push(data[k])
    } else {
      res.push(data[k])
    }
  }
  return res
}

function idListFromTree (data, val, res = [], id = 'id', children = 'children') {
  for (let i = 0; i < data.length; i++) {
    const element = data[i]
    if (element[children]) {
      if (idListFromTree(element[children], val, res, id, children)) {
        res.push(element[id])
        return true
      }
    }
    if (element[id] === val) {
      res.push(element[id])
      return true
    }
  }
}
/**
 * 将数组中的parentId列表取出，倒序排列
 */
// eslint-disable-next-line no-unused-vars
export function idList (data, val, id = 'id', children = 'children') {
  const res = []
  idListFromTree(data, val, res, id)
  return res
}

/**
 * 文件地址校验
 * @param fileUrl 获取到的文件路径
 */
export function checkFileUrl (fileUrl) {
  if (fileUrl === '') return ''
  const baseUrl = import.meta.env.VITE_APP_RESOURCES_URL
  // 适配el-image 图片组件预览功能
  if (fileUrl && typeof fileUrl === 'object') {
    // eslint-disable-next-line no-return-assign
    return fileUrl.map(el => el = checkFileUrl(el))
  } else {
    let result
    if (fileUrl && fileUrl.indexOf('http') === -1) {
      result = baseUrl + fileUrl
    } else {
      result = fileUrl
    }
    // 对URL中的路径部分进行编码，处理中文字符
    return encodeUrlPath(result)
  }
}

/**
 * 对URL中的路径部分进行编码，处理中文字符
 * @param url 原始URL
 * @return 编码后的URL
 */
function encodeUrlPath (url) {
  if (!url) {
    return url
  }
  
  try {
    // 如果是完整URL，需要分别处理协议、域名和路径
    if (url.indexOf('http://') === 0 || url.indexOf('https://') === 0) {
      const urlObj = new URL(url)
      const protocol = urlObj.protocol + '//'
      const host = urlObj.host
      const pathname = urlObj.pathname
      const search = urlObj.search || ''
      const hash = urlObj.hash || ''
      
      // 对路径部分进行编码（保留路径分隔符）
      const encodedPath = pathname.split('/').map(segment => {
        if (!segment) return segment
        // 检查是否已经编码过（包含%）
        if (segment.includes('%')) {
          return segment
        }
        // 检查是否包含中文字符或特殊字符
        if (/[\u4e00-\u9fa5\u3000-\u303f\uff00-\uffef]/.test(segment) || /[^a-zA-Z0-9._-]/.test(segment)) {
          return encodeURIComponent(segment).replace(/'/g, '%27')
        }
        return segment
      }).join('/')
      
      return protocol + host + encodedPath + search + hash
    } else {
      // 相对路径，直接编码
      return url.split('/').map(segment => {
        if (!segment) return segment
        // 检查是否已经编码过
        if (segment.includes('%')) {
          return segment
        }
        // 检查是否包含中文字符或特殊字符
        if (/[\u4e00-\u9fa5\u3000-\u303f\uff00-\uffef]/.test(segment) || /[^a-zA-Z0-9._-]/.test(segment)) {
          return encodeURIComponent(segment).replace(/'/g, '%27')
        }
        return segment
      }).join('/')
    }
  } catch (e) {
    // 如果URL解析失败，尝试简单编码
    console.warn('URL编码失败:', e, url)
    return url
  }
}
