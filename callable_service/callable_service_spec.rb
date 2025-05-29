# frozen_string_literal: true

require 'rspec/autorun'
require_relative 'callable_service'

RSpec.describe Command do
  describe '#call' do
    it 'returns "Hello, World" when no name is provided' do
      expect(Command.call).to eq('Hello, World')
    end

    it 'returns "Hello, Command" when a name is provided' do
      expect(Command.call { |command| command.name = 'Command' }).to eq('Hello, Command')
    end
  end
end
