# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'include_module_class_method'

class IncludeModuleClassMethodTest < Minitest::Test
  def test_that_it_works
    stub_const('MyClass', Class.new { include IncludeModule })

    assert_equal MyClass.class_method, 'class_method'
  end
end
