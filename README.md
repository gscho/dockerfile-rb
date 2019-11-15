# DockerfileRB

The intent of this gem is to use a PEG (citrus) to parse a Dockerfile into a Ruby object .

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dockerfile-rb'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dockerfile-rb

## Usage

Example usage:

```
require 'dockerfile-rb'

dockerfile = DockerfileRB.parse('/path/to/Dockerfile')
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gscho/dockerfile-rb.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
