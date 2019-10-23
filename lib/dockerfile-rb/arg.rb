module DockerfileRB
  class Arg
    attr_reader :name, :default_value
    def initialize(arg)
      @content = arg
      @name = arg.split('=')[0]
      @default_value = arg.split('=')[1]
    end
  end
  module ArgParser
    def value
      as = capture(:as).value.first unless capture(:as).nil?
      From.new(capture(:from_term), as)
    end
  end
end
