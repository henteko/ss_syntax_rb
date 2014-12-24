require 'slop'
require 'ssnotation/parse'

module SsNotation
  class CommandBuilder
    def initialize(arguments = ARGV)
      @arguments = arguments
      @options   = options
    end

    def parse
      file_path = ARGV[0]
      return puts 'Please set ss file.' if file_path == nil

      file = File.open(file_path, 'r')
      text = file.read

      if @options[:html]
        puts Parse.new(text).to_h
      else
        puts Parse.new(text).to_s
      end
    end

    private

    def options
      Slop.parse!(@arguments, help: true) do
        on("t", "text", "Generate format to text.")
        on("html", "Generate format to html.")
      end.to_hash
    end
  end
end