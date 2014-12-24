require 'ssnotation/parse'

module SsNotation
  class SsNotation
    attr_reader :text, :type

    def initialize(text, type = :text)
      @text = text
      @type = type
    end

    def parse()
      parse = Parse.new(@text)
      case @type
        when :text
          return parse.to_s
        when :html
          return parse.to_h
        else
          return parse.to_s
      end
    end
  end
end
