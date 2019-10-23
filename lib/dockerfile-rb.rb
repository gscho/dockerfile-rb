require 'citrus'
# require "dockerfile-rb/parser"
require "dockerfile-rb/from"
require "dockerfile-rb/version"
Citrus.load "#{File.expand_path('dockerfile-rb/grammars/dockerfile.citrus', __dir__)}"

module DockerfileRB
  class Error < StandardError; end

  def self.parse(file)
    parsed = DockerfileRB::Dockerfile.parse(file)
    parsed.value
  end
end
