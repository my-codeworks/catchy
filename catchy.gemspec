# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'catchy/version'

Gem::Specification.new do |spec|
  spec.name          = "catchy"
  spec.version       = Catchy::VERSION
  spec.authors       = ["Jonas Schubert Erlandsson"]
  spec.email         = ["jonas.schubert.erlandsson@my-codeworks.com"]
  spec.description   = "Allows you to create an object that captures any chain of methods called on it and displays them when turned intor a string."
  spec.summary       = "Ruby gem to capture chains of method calls."
  spec.homepage      = "https://github.com/my-codeworks/catchy"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard-rspec"
end
