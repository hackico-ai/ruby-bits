# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'callable_service'

class CallableServiceTest < Minitest::Test
  def test_that_it_works
    assert_equal "Hello, World", Command.call
    assert_equal "Hello, Command", Command.call { |command| command.name = "Command" }
  end
end
