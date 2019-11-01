module DockerfileRB
  class Label
    attr_reader :pairs
    def initialize(pairs)
      @pairs = pairs
    end
  end
  module LabelParser
    def value
      delimiters = ['=', "\""]
      labels = capture(:label_term).to_s.split(Regexp.union(delimiters))
        .reject { |capture| capture.empty? }
        .map { |capture| capture.gsub("\n",'').gsub('\\','').strip }
      Label.new(Hash[*labels])
    end
  end
end
