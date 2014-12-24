require 'ssnotation/parses/character'
require 'ssnotation/parses/comment'
require 'ssnotation/parses/heart_voice'
require 'ssnotation/parses/remark'
require 'ssnotation/parses/none'
require 'ssnotation/parses/type'

module SsNotation
  class Parse
    attr_reader :text, :characters

    def initialize(text)
      @text = text
      @charactes = {}
      @parse_text = parse_text
    end

    def to_s
      @parse_text
    end

    def to_h
      html_text = ''
      @parse_text.each_line do |line|
        line.chomp!
        html_text += "<span>#{line}</span><br />"
      end

      html_text
    end

    private
    
    def parse_text
      parse_text = ''
      @text.each_line do |line|
        line.chomp!
        case check_type(line)
          when Parses::Type::Character
            key, name = Parses::Character.get(line)
            @charactes[key] = name
          when Parses::Type::Comment
          when Parses::Type::HeartVoice
            parse_text += Parses::HeartVoice.get(line, @charactes) + "\n"
          when Parses::Type::Remark
            parse_text += Parses::Remark.get(line, @charactes) + "\n"
          when Parses::Type::None
            parse_text += Parses::None.get(line) + "\n" if line != ''
          else
            raise 'not support type'
        end
      end

      return parse_text
    end

    def check_type(line)
      if Parses::Character.check(line)
        return Parses::Type::Character
      elsif Parses::Comment.check(line)
        return Parses::Type::Comment
      elsif Parses::HeartVoice.check(line)
        return Parses::Type::HeartVoice
      elsif Parses::Remark.check(line)
        return Parses::Type::Remark
      elsif Parses::None.check(line)
        return Parses::Type::None
      end

      nil
    end
  end
end
