# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'md2hiki/version'

Gem::Specification.new do |spec|
  spec.name          = "md2hiki"
  spec.version       = Md2hiki::VERSION
  spec.authors       = ["takahashim"]
  spec.email         = ["maki@rubycolor.org"]
  spec.description   = %q{md2hiki is a Markdown to Hiki converter using redcarpet}
  spec.summary       = %q{Markdown -> Hiki converter}
  spec.homepage      = "https://github.com/takahashim/md2hiki"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'redcarpet', '>2.0.0'

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "test-unit"
end
