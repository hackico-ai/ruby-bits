# frozen_string_literal: true

# =============== Design ===============
module IncludeModule
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def class_method
      puts 'class_method'
    end
  end
end

# =============== Usage ===============
class IncludeModuleClass
  include IncludeModule
end

IncludeModuleClassMethod.class_method
# Output: class_method

# ******************** Testing ********************

# Unit: frankly, it's also contextual test
#       but stubbed class for unit-like isolation behavior
RSpec.describe IncludeModule do
  let(:value) { 'class_method' }
  stub_const('IncludeModuleClassMethod', Class.new do
    include IncludeModule
  end)

  let(:included_klass) { IncludeModuleClassMethod }

  describe '#class_method' do
    it 'returns "class_method"' do
      expect(included_klass.class_method).to eq(value)
    end
  end
end

# Integration: actually class behavi
RSpec.describe IncludeModuleClass do
  let(:value) { 'class_method' }
  let(:included_klass) { IncludeModuleClass }

  describe '#class_method' do
    it 'returns "class_method"' do
      expect(included_klass.class_method).to eq(value)
    end
  end
end
