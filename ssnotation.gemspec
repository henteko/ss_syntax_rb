lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ssnotation/version'

Gem::Specification.new do |s|
  s.name        = 'ssnotation'
  s.version     = SsNotation::VERSION
  s.summary     = "ss notation"
  s.authors     = ["henteko"]
  s.email       = 'henteko07@gmail.com'
  s.files       = ["lib/ssnotation.rb"]
  s.homepage    = 'http://rubygems.org/gems/ssnotation'
  s.license     = 'MIT'

  s.files         = `git ls-files -z`.split("\x0")
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "slop"
end
