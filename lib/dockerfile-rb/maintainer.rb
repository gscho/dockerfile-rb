module DockerfileRB
  class Maintainer
    attr_reader :name
    def initialize(name)
      @name = name
    end
  end
  module MaintainerParser
    def value
      Maintainer.new(capture(:maintainer_term))
    end
  end
end
