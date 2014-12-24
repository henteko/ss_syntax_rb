module SsSyntax
  module Parses
    class Remark
      def self.check(text)
        if text.match(/.+:/)
          return true
        end

        return false
      end

      def self.get(text, characters)
        match = text.match(/(.+): (.+)/)
        key, body = match[1], match[2]

        return "#{characters[key]}「#{body}」" if characters[key] != nil
        return "#{key}「#{body}」"
      end
    end
  end
end
