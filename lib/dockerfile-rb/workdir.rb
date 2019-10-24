module DockerfileRB
  class Workdir
    attr_reader :path
    def initialize(path)
      @path = path
    end
  end
  module WorkdirParser
    def value
      Workdir.new(capture(:workdir_term))
    end
  end
end
