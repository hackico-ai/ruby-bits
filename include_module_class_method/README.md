# `IncludeModule` - A Ruby Module for Adding Class Methods

The `IncludeModule` module provides functionality to extend a class with class-level methods when it is included. This is done using the `included` hook, which is invoked whenever the module is included in a class. The module defines a nested module, `ClassMethods`, which contains the class method(s) to be added to the class.

## How It Works

1. When `IncludeModule` is included in a class, the `self.included(base)` method is called.
2. The `base` parameter is the class that includes the module. Inside the `included` method, `base.extend(ClassMethods)` is used to add the class methods from `ClassMethods` to the class.
3. Any class that includes `IncludeModule` will then have access to the class method `class_method`.

## Example

```ruby
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

class MyClass
  include IncludeModule
end

MyClass.class_method
# Output: "class_method"
```
