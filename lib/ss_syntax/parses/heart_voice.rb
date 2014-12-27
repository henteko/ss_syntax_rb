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
        key, body, gion = '', '', ''

        gion_match = text.match(/(.+)_ (.+) _ (.+)/) # with 擬音
        if gion_match != nil
          key, body, gion = gion_match[1], gion_match[2], gion_match[3]
        else
          match = text.match(/(.+)_ (.+)/)
          key, body = match[1], match[2]
        end

        return "#{characters[key]}（#{body}）#{gion}" if characters[key] != nil
        return "#{key}（#{body}）#{gion}"
      end
    end
  end
end
