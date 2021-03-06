module SsSyntax
  module Parses
    class Character
      def self.check(text)
        if text.match(/^\*/) || text.match(/^-/)
          return true
        end

        return false
      end

      def self.get(text)
        match = text.match(/^\* (.+) (.+)/) || text.match(/^- (.+) (.+)/)
        return nil, nil if match == nil # TODO: raiseしてあげた方がいいかも
        return match[1], match[2]
      end
    end
  end
end
