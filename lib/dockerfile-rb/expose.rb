module DockerfileRB
  class Expose
    attr_reader :port, :protocol
    def initialize(port, protocol)
      if port.match /\d/
        @port = port.to_i
        @protocol = (protocol || 'tcp').downcase
      else # port is a variable
        @port = port
      end
    end
  end
  module ExposeParser
    def value
      expose = capture(:expose_term).to_s.split('/')
      Expose.new(expose[0], expose[1])
    end
  end
end
