# frozen_string_literal: true

module IncludeModule
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def class_method
      puts "class_method"
    end
  end
end
