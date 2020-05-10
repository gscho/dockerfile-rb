module DockerfileRB
  class Run
    attr_reader :executable, :parameters, :command
    def initialize
    end

    def shell(command)
      @command = command
      self
    end

    def exec(executable, parameters)
      @executable = executable
      @parameters = parameters
      self
    end
  end
  module RunExecParser
    def value
      run = captures(:run_term)
      Run.new.exec(run[0], run[1..-1])
    end
  end
  module RunShellParser
    def value
      run = captures(:run_term)
      run.each { |r| r.string.strip! }
      Run.new.shell(run.join(' '))
    end
  end
end
