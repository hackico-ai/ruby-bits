# frozen_string_literal: true

# Option 1: Dependency injection block with Guard || callback
# Example: Command.call(params) { |opt| Validator.new(opt[:email]) }
class GuardService
  def self.call(**kwargs)
    obj = new

    if block_given?
      yield(kwargs)
    else
      raise "Email is required" if kwargs[:email].blank?
    end
    obj.call(**kwargs)
  end
end

class GuardService < GuardServiceBase
  def call
    # do something
  end
end

# Option 2: Dependency injection block with steps setup
# Example: Command.call(params) do |command|
#  command.validator = MyValidator
#  command.executor = MyExecutor
#  command.callback = MyCallback
# end
class StepsService
  def initialize
    @result = nil

    @validator = DefaultValidator
    @executor = DefaultExecutor
    @callback = DefaultCallback
  end

  def self.call(**kwargs)
    obj = new

    yield(obj) if block_given?
    obj.call(**kwargs)
    result
  end

  private

  attr_accessor :validator, :executor, :callback
  attr_reader :result
end

class StepsService < StepsServiceBase
  def call(params)
    safe_params = validator.new(params).validate
    @result = executor.new(safe_params).execute
    callback.new(safe_params[:msg]).call
  end
end

# Option 3: Dependency injection block with step execution setup
# Example: Command.call(params) do |result|
#  user = Query.new.by_id(result[:id])
#  reg_rez = RegService.call(user)
#  placement_rez = PlacementService.call(reg_rez.value)
#  result = MyNextNextNextExecutor.new(reg_rez, placement_rez[:rec])
#  ...
# end
class StepsExecutionService
  def initialize
    @result = nil
  end

  def self.call(**kwargs)
    obj = new

    @result = Validator.new(kwargs).validate
    @result = block_given? ? yield(@result) : obj.call(**kwargs)
    Callback.new(@result).call

    @result
  end

  private

  attr_accessor :validator, :executor, :callback
end

class CallableService < CallableServiceBase
  def call(params)
    CmdRunner.new(params).run!
  end
end
