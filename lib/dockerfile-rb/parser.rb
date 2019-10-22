module DockerfileRB
  module Parser
    def from
      captures(:from_value).zip(captures(:as_value)).map do |from, as|
        From.new(from, as)
      end
    end
  end
end
