import http from '@/utils/http'

export function fetchChatHistory (userId, sessionId, limit = 50) {
  return http({
    url: http.adornUrl('/admin/chatbot/history'),
    method: 'get',
    params: http.adornParams({
      userId,
      sessionId,
      limit
    })
  })
}

export function clearChatHistory (sessionId) {
  return http({
    url: http.adornUrl(`/admin/chatbot/history/${sessionId}`),
    method: 'delete',
    data: http.adornData()
  })
}

