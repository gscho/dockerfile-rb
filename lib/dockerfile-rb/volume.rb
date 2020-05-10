module DockerfileRB
  class Volume
    attr_reader :directories
    def initialize(directories)
      @directories = directories
    end
  end
  module VolumeStringParser
    def value
      Volume.new(captures(:volume_term))
    end
  end
  module VolumeJSONParser
    def value
      Volume.new(captures(:volume_term))
    end
  end
end
