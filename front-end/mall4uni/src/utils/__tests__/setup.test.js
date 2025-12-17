import { describe, it, expect } from 'vitest'
import fc from 'fast-check'

describe('Test Environment Setup', () => {
  it('should run basic vitest tests', () => {
    expect(true).toBe(true)
  })

  it('should support fast-check property-based testing', () => {
    fc.assert(
      fc.property(
        fc.integer(),
        (n) => {
          return n + 0 === n
        }
      )
    )
  })

  it('should have node environment available', () => {
    expect(typeof process).toBe('object')
    expect(process.env).toBeDefined()
  })
})
