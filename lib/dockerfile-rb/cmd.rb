module DockerfileRB
  class Cmd
    attr_reader :executable, :parameters
    def initialize(executable, parameters)
      @executable = executable
      @parameters = parameters
    end
  end
  module CmdExecParser
    def value
      cmd = captures(:cmd_term)
      Cmd.new(cmd[0], cmd[1..-1])
    end
  end
  module CmdShellParser
    def value
      cmd = captures(:cmd_term)
      Cmd.new(cmd[0], cmd[1..-1])
    end
  end
end
