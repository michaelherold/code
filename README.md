# Culinarian

A simple DSL for creating recipes, Culinarian was created for a talk to
demonstrate the flexibility of Ruby for creating code that is readable (and
writable!) by non-programmers.

## Installation

Add this line to your application's Gemfile:

    gem 'culinarian'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install culinarian

## Usage

TODO.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Supported Ruby Versions

This library aims to support the following Ruby versions:

* Ruby 2.0.0
* Ruby 2.1
* Ruby 2.2

If something doesn't work on one of these versions, it's a bug.

## Versioning

This library aims to adhere to [Semantic Versioning 2.0.0][semver]. Violations of this scheme
should be reported as bugs. Thus, you should specify a gem dependency using the
[Pessimistic Version Constraint][pessimistic] with two digits of precision:

```ruby
# In Gemfile
gem 'culinarian', '~> 1.0'

# In .gemspec
spec.add_dependency 'culinarian', '~> 1.0'
```

[pessimistic]: http://guides.rubygems.org/#page74
[semver]: http://semver.org

## Copyright

Copyright (c) 2015 Michael Herold. Open sourced under the terms of the
[MIT license][license].

[license]: http://opensource.org/licenses/MIT
