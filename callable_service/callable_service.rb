# frozen_string_literal: true

# Option 1: Syntax sugar for onle liner
# Example: CallableServiceBase.call
class CallableServiceBase
  def self.call(...)
    new.call(...)
  end
end

class CallableService < CallableServiceBase
  def call
    # do something
  end
end

# Option 2: Block with setup
# Example: Command.call do |command|
#  command.name = 'Command'
# end
class BlockService
  def self.call(...)
    obj = new
    yield(obj) if block_given?
    obj.call(...)
  end
end

class CallableService < CallableServiceBase
  def call
    # do something
  end

  private

  attr_accessor :name
end

# Option 3: Dependency injection block with result || callback
# Example: Command.call do |result|
#  SendPushNotification.new(result)
# end
class CallbackService
  def self.call(...)
    obj = new

    result = obj.call(...)
    if block_given?
      yield(result)
    else
      SendEmail.new(result)
    end

    result
  end
end

class CallableService < CallableServiceBase
  def call
    # do something
  end
end
