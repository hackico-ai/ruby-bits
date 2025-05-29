# frozen_string_literal: true

# Syntax sugar for onle liner

# =============== Design ===============
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

# ******************** Testing ********************

RSpec.describe CallableService do
  let(:callable_service) { CallableService }
  let(:result) { callable_service.call }

  describe '#call' do
    it 'returns "Hello, World"' do
      expect(CallableService.call).to eq('Hello, World')
    end
  end
end
