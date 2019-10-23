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
      cmd = capture(:cmd_term).to_s.split(',').map{ |term| term.gsub("\"",'') }
      Cmd.new(cmd[0], cmd[1..-1])
    end
  end
end
