const util = {
  formatTime: date => {
    const year = date.getFullYear()
    const month = date.getMonth() + 1
    const day = date.getDate()
    const hour = date.getHours()
    const minute = date.getMinutes()
    const second = date.getSeconds()
    return [year, month, day].map(util.formatNumber).join('/') + ' ' + [hour, minute, second].map(util.formatNumber).join(':')
  },

  formatNumber: n => {
    n = n.toString()
    return n[1] ? n : '0' + n
  },

  formatHtml: content => {
    if (!content) {
      return
    }
    content = content.replace(/<p/gi, '<p style="max-width:100% !important;word-wrap:break-word;word-break:break-word;" ')
    content = content.replace(/<img/gi, '<img style="max-width:100% !important;height:auto !important;margin:0;display:flex;" ')
    content = content.replace(/style="/gi, 'style="max-width:100% !important;table-layout:fixed;word-wrap:break-word;word-break:break-word;')
    content = content.replace(/<table/gi, '<table style="table-layout:fixed;word-wrap:break-word;word-break:break-word;" ')
    content = content.replace(/<td/gi, '<td cellspacing="0" cellpadding="0" style="border-width:1px; border-style:solid; border-color:#666; margin: 0px; padding: 0px;"')
    content = content.replace(/width=/gi, 'sss=')
    content = content.replace(/height=/gi, 'sss=')
    content = content.replace(/\/>/gi, ' style="max-width:100% !important;height:auto !important;margin:0;display:block;" />')
    return content
  },

  /**
   * 移除购物车Tabbar的数字
   */
  removeTabBadge: () => {
    uni.removeTabBarBadge({
      index: 3
    })
  },
  /**
   * 获取链接上的参数
   */
  getUrlKey: (name) => {
    return decodeURIComponent((new RegExp('[?|&]' + name + '=' + '([^&;]+?)(&|#|;|$)').exec(location.href) || ['', ''])[1]
      .replace(/\+/g, '%20')) || null
  },
  /**
   * 文件地址校验
   * @param fileUrl 获取到的文件路径
   */
  checkFileUrl: (fileUrl) => {
    // 防止 fileUrl 为null时 indexOf() 方法失效报错
    const url = fileUrl || ''
    if (!url) {
      return url
    }
    const baseUrl = import.meta.env.VITE_APP_RESOURCES_URL
    
    // 如果URL已经是完整的HTTP/HTTPS URL
    if (url.indexOf('http://') === 0 || url.indexOf('https://') === 0) {
      // 检测并替换硬编码的 IP 地址（如 175.178.163.41）
      // 匹配模式：http://IP:PORT/ 或 https://IP:PORT/
      const ipPattern = /^https?:\/\/(\d{1,3}\.){3}\d{1,3}(:\d+)?\//
      if (ipPattern.test(url)) {
        try {
          const urlObj = new URL(url)
          // 提取路径部分（包括 /mall4j/img/ 之后的内容）
          let path = urlObj.pathname
          
          // 如果路径中包含 /mall4j/img/，提取之后的部分
          const mall4jImgIndex = path.indexOf('/mall4j/img/')
          if (mall4jImgIndex !== -1) {
            path = path.substring(mall4jImgIndex + '/mall4j/img/'.length)
          } else if (path.startsWith('/mall4j/img/')) {
            path = path.substring('/mall4j/img/'.length)
          }
          
          // 使用相对路径或 baseUrl 构建新的 URL
          // 如果 baseUrl 是相对路径，直接拼接
          if (baseUrl.indexOf('http://') !== 0 && baseUrl.indexOf('https://') !== 0) {
            const result = baseUrl + path
            return util.encodeUrlPath(result)
          } else {
            // 如果 baseUrl 是完整 URL，使用它
            const result = baseUrl + path
            return util.encodeUrlPath(result)
          }
        } catch (e) {
          console.warn('URL解析失败，尝试简单替换:', e, url)
          // 简单替换：提取 /mall4j/img/ 之后的部分
          const mall4jImgMatch = url.match(/\/mall4j\/img\/(.+)$/)
          if (mall4jImgMatch) {
            const result = baseUrl + mall4jImgMatch[1]
            return util.encodeUrlPath(result)
          }
        }
      }
      
      // 如果URL包含localhost，只替换域名部分，保留路径
      if (url.indexOf('localhost') !== -1 || url.indexOf('127.0.0.1') !== -1) {
        // 提取协议和路径部分
        const urlObj = new URL(url)
        const serverHost = baseUrl.replace(/^https?:\/\//, '').replace(/\/.*$/, '')
        const result = url.replace(/^https?:\/\/[^\/]+/, `http://${serverHost}`)
        // 确保路径中的中文字符被正确编码
        return util.encodeUrlPath(result)
      }
      
      // 检查URL中是否包含重复的 /mall4j/img/ 路径
      // 例如: http://example.com:8085/mall4j/img/mall4j/img/2024/01/...
      const doublePathPattern = /\/mall4j\/img\/mall4j\/img\//
      if (doublePathPattern.test(url)) {
        // 移除重复的 /mall4j/img/，只保留一个
        const result = url.replace(/\/mall4j\/img\/mall4j\/img\//g, '/mall4j/img/')
        // 确保路径中的中文字符被正确编码
        return util.encodeUrlPath(result)
      }
      
      // 如果已经是完整的URL，确保路径部分已编码
      return util.encodeUrlPath(url)
    }
    
    // 相对路径处理
    // 如果路径已经以 mall4j/img/ 开头，说明路径中包含了前缀，需要移除重复部分
    if (url.indexOf('mall4j/img/') === 0) {
      // 移除开头的 mall4j/img/，只保留后面的路径
      const cleanPath = url.replace(/^mall4j\/img\//, '')
      const fullUrl = baseUrl + cleanPath
      return util.encodeUrlPath(fullUrl)
    }
    
    // 如果路径中包含 /mall4j/img/，说明是完整路径的一部分，需要提取实际路径
    const mall4jImgIndex = url.indexOf('/mall4j/img/')
    if (mall4jImgIndex !== -1) {
      // 提取 /mall4j/img/ 之后的部分
      const actualPath = url.substring(mall4jImgIndex + '/mall4j/img/'.length)
      const fullUrl = baseUrl + actualPath
      return util.encodeUrlPath(fullUrl)
    }
    
    // 判断 fileUrl 中是否已存在基础路径
    const check = url.indexOf(baseUrl) !== -1
    if (check) {
      return util.encodeUrlPath(url)
    }
    
    // 普通相对路径，添加baseUrl
    const fullUrl = baseUrl + url
    return util.encodeUrlPath(fullUrl)
  },
  
  /**
   * 对URL中的路径部分进行编码，处理中文字符
   * @param url 原始URL
   * @return 编码后的URL
   */
  encodeUrlPath: (url) => {
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
}

export default util
