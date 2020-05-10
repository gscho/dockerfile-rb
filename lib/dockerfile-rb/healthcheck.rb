module DockerfileRB
  class Healthcheck
    attr_reader :none
    def initialize(none = false)
      @none = none
    end
  end
  module HealthcheckNoneParser
    def value
      Healthcheck.new(true)
    end
  end
end
