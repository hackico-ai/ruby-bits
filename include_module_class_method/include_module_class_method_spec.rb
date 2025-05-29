# frozen_string_literal: true

require 'rspec/autorun'
require_relative 'include_module_class_method'

describe IncludeModule do
  stub_const('MyClass', Class.new { include IncludeModule })

  subject(:my_klass) { MyClass }

  let(:class_method) { 'class_method' }

  it 'should extend the class with class methods' do
    expect(my_klass.class_method).to eq(class_method)
  end
end
