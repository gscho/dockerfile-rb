module DockerfileRB
  class From
    attr_reader :image, :image_tag, :image_digest, :name
    def initialize(from_value, as_value)
      @content = from_value
      @name = as_value
      @image = @content.value.split(':')[0]
      @image_tag = @content.value.split(':')[1]
      @image_digest = @content.value.split('@')[1]
    end
  end
end
