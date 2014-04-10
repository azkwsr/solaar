# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'solaar/version'

Gem::Specification.new do |spec|
  spec.name          = "solaar"
  spec.version       = Solaar::VERSION
  spec.authors       = ["azukiwasher"]
  spec.email         = ["azukiwasher@higanworks.com"]
  spec.description   = %q{Calculates the 24 solar terms until 2099}
  spec.summary       = %q{Calculates the 24 solar terms until 2099}
  spec.homepage      = "http://github.com/azukiwasher/solaar"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "sinatra"
  spec.add_runtime_dependency "sinatra-contrib"
  spec.add_runtime_dependency "thin"
  spec.add_runtime_dependency "oj"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
