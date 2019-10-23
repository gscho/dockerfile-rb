module DockerfileRB
  class From
    attr_reader :image, :image_tag, :image_digest, :name
    def initialize(from_value, as_value)
      @name = as_value
      @image = from_value.value.split(':')[0]
      @image_tag = from_value.value.split(':')[1]
      @image_digest = from_value.value.split('@')[1]
    end
  end
  module FromParser
    def value
      as = capture(:as).value.first unless capture(:as).nil?
      From.new(capture(:from_term), as)
    end
  end
end
