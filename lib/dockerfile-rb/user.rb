module DockerfileRB
  class User
    attr_reader :user_id, :group_id
    def initialize(user, group)
      @user_id = user
      @group_id = group
    end
  end
  module UserParser
    def value
      user = capture(:user_term).value.split(':')
      User.new(user[0], user[1])
    end
  end
end
