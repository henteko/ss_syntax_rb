module SsNotation
  module Parses
    class Comment
      def self.check(text)
        # TODO: 文の途中で#が出てきてもサポートする
        if text.match(/^#/)
          return true
        end

        return false
      end
    end
  end
end
