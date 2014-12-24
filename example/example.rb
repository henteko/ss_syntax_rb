require 'ssnotation'

src = File.open(File.expand_path('../example.ss', __FILE__), 'r').read
text = SsNotation::SsNotation.new(src).parse() # default :text
html = SsNotation::SsNotation.new(src, :html).parse()

puts text
puts html