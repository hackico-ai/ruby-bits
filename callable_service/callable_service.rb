# frozen_string_literal: true

# Syntax sugar for onle liner
class CallableServiceBase
  def self.call(...)
    new.call(...)
  end
end

# =============== Implementation ===============
class CallableService < CallableServiceBase
  def call
    'Hello, World'
  end
end

# Usage
CallableServiceBase.call # Output: 'Hello, World'

# =============== Testing ===============

# RSpec test
RSpec.describe CallableService do
  describe '#call' do
    it 'returns "Hello, World"' do
      expect(CallableService.call).to eq('Hello, World')
    end
  end
end

# MiniTest test
class CallableServiceTest < Minitest::Test
  def test_that_it_works
    assert_equal 'Hello, World', CallableService.call
  end
end
