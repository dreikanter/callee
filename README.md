# Callee

[![Build Status](https://travis-ci.org/dreikanter/callee.svg?branch=master)](https://travis-ci.org/dreikanter/callee)

This gem helps to define callable classes with strict params specification.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'callee'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install callee

## Usage

To make a class callable, you need to include `Callee` mixin and implement `call` instance method. Use [dry-initializer DSL](https://dry-rb.org/gems/dry-initializer/optionals-and-defaults/) to specify calling parameters and options if necessary. Here is a basic usage example:

``` ruby
class Sum
  include Callee

  param :a
  param :b

  def call
    a + b
  end
end

Sum.call(1, 1)  # => 2
```

Use optional params with default values:

``` ruby
class Greet
  include Callee

  option :greeting, optional: true, default: proc { 'Hello' }
  option :name, optional: true

  def call
    "#{[greeting, name].compact.join(', ')}!"
  end
end

Greet.call  # => "Hello!"
Greet.call(name: 'Probert')  # => "Hello, Probert!"
```

Callable class may be used as a `Proc`:

``` ruby
class Power
  include Callee

  param :value

  def call
    value * value
  end
end

values = [1, 2, 3]

# Compact notation for values.map { |value| Power.call(value) }
values.map(&Power)  # => [1, 4, 9]
```

Since Callee mixin inherits `dry-initializer` DSL, type constraints and coercion will also work, as usual. Just make sure to include `dry-types`:

``` ruby
require "dry-types"

class StrictPower
  include Callee

  param :value, type: Dry::Types["strict.integer"]

  def call
    value * value
  end
end

class CoerciblePower < StrictPower
  param :value, type: Dry::Types["coercible.integer"]
end

string_values = %w[1 2 3]

string_values.map(&StrictPower)  # Will raise Dry::Types::ConstraintError
string_values.map(&CoerciblePower)  # => [1, 4, 9]
```

See [more examples](https://dry-rb.org/gems/dry-initializer/type-constraints/) in dry-rb docs.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dreikanter/callee.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
