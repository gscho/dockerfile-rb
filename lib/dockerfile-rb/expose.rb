module DockerfileRB
  class Expose
    attr_reader :port, :protocol
    def initialize(port, protocol)
      @port = port.to_i
      @protocol = (protocol || 'tcp').downcase
    end
  end
  module ExposeParser
    def value
      expose = capture(:expose_term).to_s.split('/')
      Expose.new(expose[0], expose[1])
    end
  end
end
