## Problem Statement

In many applications, we often need to perform a series of operations that can be encapsulated as a service. For instance, consider a scenario where we need to send a welcome email to a new user after they register on a platform. This process might involve several steps, such as creating the user record, generating a welcome message, and sending the email.

## Solution Approach

To handle this scenario efficiently, we can use a callable service pattern. This pattern allows us to encapsulate the logic for sending the welcome email into a dedicated service class. By doing so, we can easily manage the flow of operations and make our code more modular and testable.

- [Design and Implementation:](https://github.com/hackico-ai/ruby-bits/blob/main/callable_service)

  - [common pattern](https://github.com/hackico-ai/ruby-bits/blob/main/callable_service/callable_service.rb)
  - [callable with setup block](https://github.com/hackico-ai/ruby-bits/blob/main/callable_service/callable_service_setup_block.rb)
  - [callable with callback](https://github.com/hackico-ai/ruby-bits/blob/main/callable_service/callable_service_callback_block.rb)

- [Test Snippets](https://github.com/hackico-ai/ruby-bits/blob/main/include_module_class_method/include_module_class_method.rb#L24)
- [Advance usage](https://github.com/hackico-ai/ruby-bits/blob/main/callable_service/beta_advance_usage.rb)

### Implementation Guide

1. **Create a Service Class**: Define a service class that will handle the email sending logic.
2. **Execute the Logic**: Implement the logic to send the email within the service class.

### Quick Usage Example | more [HERE](https://github.com/hackico-ai/ruby-bits/tree/main/callable_service)

Here's how you might implement this in Ruby:

```ruby
# Base class for callable services
class CallableServiceBase
  def self.call(...)
    new.call(...)
  end
end

# Service to send a welcome email
class WelcomeEmailService < CallableServiceBase
  def call(email)
   puts msg(email)
  end

  private

  def msg(email)
   "Sending email to #{email}..."
  end
end

email = 'newuser@example.com'
WelcomeEmailService.call(email) # Outputs: Sending email to newuser@example.com.

```

## Conclusion

Using the callable service pattern allows us to encapsulate complex logic in a clean and manageable way. This approach not only improves code readability but also makes it easier to test and maintain. By following this pattern, you can create modular services for various tasks in your Ruby applications.

## Additional Resources

- [Ruby Documentation](https://www.ruby-lang.org/en/documentation/)
- [Design Patterns in Ruby](https://www.oreilly.com/library/view/design-patterns-in/9780132650950/)
