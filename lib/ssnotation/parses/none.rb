module SsNotation
  module Parses
    class None
      def self.check(text)
        return true
      end

      def self.get(text)
        return text
      end
    end
  end
end
