module DockerfileRB
  class Arg
    attr_reader :name, :default_value
    def initialize(name, default_value)
      @name = name
      @default_value = default_value
    end
  end
  module ArgParser
    def value
      Arg.new(capture(:arg_name), capture(:arg_value))
    end
  end
end
