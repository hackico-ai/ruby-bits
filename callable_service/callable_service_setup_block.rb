# frozen_string_literal: true

# =============== Design ===============
class BlockServiceBase
  def self.call(...)
    obj = new
    yield(obj) if block_given?
    obj.call(...)
  end
end

# =============== Implementation ===============
class BlockService < BlockServiceBase
  def call
    "Hello, #{name}"
  end

  private

  attr_accessor :name
end

# Usage
BlockService.call do |service|
  service.name = 'Service'
end
# Output: 'Hello, Service'

# ******************** Testing ********************


RSpec.describe BlockService do
  let(:block_service) { BlockService }
  let(:result) do
    block_service.call do |service|
      service.name = 'Service'
    end
  end

  describe '#call' do
    it 'returns "Hello, Service"' do
      expect(result).to eq('Hello, Service')
    end
  end
end
