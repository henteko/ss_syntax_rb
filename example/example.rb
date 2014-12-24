require 'ss_syntax'

src = File.open(File.expand_path('../example.ss', __FILE__), 'r').read
text = SsSyntax::SsSyntax.new(src).parse() # default :text
html = SsSyntax::SsSyntax.new(src, :html).parse()

puts text
puts html