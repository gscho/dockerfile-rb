# DockerfileRB

![](https://github.com/gscho/dockerfile-rb/workflows/Rake%20Test/badge.svg)
    
The intent of this gem is to use a PEG (citrus) to parse a Dockerfile into a hash of Ruby objects.

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

dockerfile = DockerfileRB.parse(File.read('/path/to/Dockerfile'))
puts dockerfile.inspect
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gscho/dockerfile-rb.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
