module DockerfileRB
  class Add
    attr_reader :arg, :name, :user, :group, :src, :dest
    def initialize(arg, src, dest)
      string_arg = arg.to_s
      @arg = string_arg.to_s.split('=')[0] unless string_arg.nil?
      split_args = string_arg.split(':')
      @user = split_args[0].gsub(/--.+=/,'') unless split_args[0].nil?
      @group = split_args[1] unless split_args.nil?
      @src = src
      @dest = dest
    end
  end
  module AddParser
    def value
      Add.new(capture(:arg_term), capture(:src_term), capture(:dest_term))
    end
  end
end
