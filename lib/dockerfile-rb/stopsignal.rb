module DockerfileRB
  class Stopsignal
    attr_reader :signal
    def initialize(signal)
      @signal = signal
    end
  end
  module StopsignalParser
    def value
      Stopsignal.new(capture(:signal_term))
    end
  end
end
