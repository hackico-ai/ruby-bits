# frozen_string_literal: true

# =============== Design ===============
class CallbackService
  def self.call(...)
    obj = new

    result = obj.call(...)
    if block_given?
      yield(result)
    else
      p "SendEmail.new(#{result})"
    end

    result
  end
end

# =============== Implementation ===============
class CallbackService < CallbackServiceBase
  def call
    'Hello, World'
  end
end

# Usage
CallbackService.call do |result|
  p "SendPushNotification.new(#{result})"
end

# Output: SendPushNotification.new(Hello, World)

# ******************** Testing ********************

RSpec.describe CallbackService do
  let(:callback_service) { CallbackService }
  let(:result_value) { 'Hello, World' }
  let(:result) do
    callback_service.call do |result|
      p "SendPushNotification.new(#{result})"
    end
  end

  describe '#call' do
    it 'returns "Hello, World"' do
      expect(result).to eq(result_value)
    end
  end
end
