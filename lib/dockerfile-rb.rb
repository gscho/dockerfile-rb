require 'citrus'
require "dockerfile-rb/parser"
require "dockerfile-rb/from"
require "dockerfile-rb/version"

Citrus.load "#{File.expand_path('dockerfile-rb/grammars/basic.citrus', __dir__)}"
Citrus.load "#{File.expand_path('dockerfile-rb/grammars/dockerfile.citrus', __dir__)}"

module DockerfileRB
  class Error < StandardError; end

  def self.parse(file)
    DockerfileRB::Dockerfile.parse(file)
    # parsed.from.each do |from|
    #   puts "FROM=#{from.inspect}"
    #   puts "IMAGE_TAG=#{from.image_tag}"
    #   puts "IMAGE_DIGEST=#{from.image_digest}"
    #   puts "AS=#{from.name}"
    # end
  end
end
