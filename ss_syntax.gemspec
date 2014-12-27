lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ss_syntax/version'

Gem::Specification.new do |s|
  s.name        = 'ss_syntax'
  s.version     = SsSyntax::VERSION
  s.summary     = "Short Story Syntax"
  s.authors     = ["henteko"]
  s.email       = 'henteko07@gmail.com'
  s.homepage    = 'https://github.com/henteko/ss_syntax_rb'
  s.license     = 'MIT'

  s.files         = `git ls-files -z`.split("\x0")
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.add_dependency "slop"
  s.add_development_dependency "rspec", "~> 3.1.0"
end
