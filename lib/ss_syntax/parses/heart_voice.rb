module SsSyntax
  module Parses
    class HeartVoice
      def self.check(text)
        if text.match(/.+_/)
          return true
        end

        return false
      end

      def self.get(text, characters)
        match = text.match(/(.+)_ (.+)/)
        key, body = match[1], match[2]

        return "#{characters[key]}（#{body}）" if characters[key] != nil
        return "#{key}（#{body}）"
      end
    end
  end
end
