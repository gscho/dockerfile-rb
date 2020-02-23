require 'citrus'
require "dockerfile-rb/add"
require "dockerfile-rb/arg"
require "dockerfile-rb/cmd"
require "dockerfile-rb/copy"
require "dockerfile-rb/entrypoint"
require "dockerfile-rb/env"
require "dockerfile-rb/expose"
require "dockerfile-rb/from"
require "dockerfile-rb/label"
require "dockerfile-rb/maintainer"
require "dockerfile-rb/stopsignal"
require "dockerfile-rb/user"
require "dockerfile-rb/version"
require "dockerfile-rb/workdir"

Citrus.load "#{File.expand_path('dockerfile-rb/grammars/dockerfile.citrus', __dir__)}"

module DockerfileRB
  class Error < StandardError; end

  def self.parse(content)
    DockerfileRB::Dockerfile.parse(content).value
  end
end
