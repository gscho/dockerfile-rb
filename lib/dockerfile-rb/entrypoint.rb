module DockerfileRB
  class Entrypoint
    attr_reader :executable, :parameters
    def initialize(executable, parameters)
      @executable = executable
      @parameters = parameters
    end
  end
  module EntrypointExecParser
    def value
      entrypoint = captures(:entrypoint_term)
      Entrypoint.new(entrypoint[0], entrypoint[1..-1])
    end
  end
  module EntrypointShellParser
    def value
      entrypoint = captures(:entrypoint_term)
      Entrypoint.new(entrypoint[0], entrypoint[1..-1])
    end
  end
end
