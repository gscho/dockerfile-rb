module DockerfileRB
  class Env
    attr_reader :pairs
    def initialize(pairs)
      @pairs = pairs
    end
  end
  module EnvWhitespaceParser
    def value
      Env.new({capture(:key_term).to_s => capture(:value_term).to_s})
    end
  end
  module EnvKeyValueParser
    def value
      keys = captures(:key_term).map{ |c| c.value.strip }
      values = captures(:value_term).map{ |c| c.value.strip }
      Env.new(Hash[keys.zip(values)])
    end
  end
end
