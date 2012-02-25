# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'solaar'

Gem::Specification.new do |s|
  s.name      = "solaar"
  s.version   = Solaar::VERSION
  s.platform  = Gem::Platform::RUBY
  s.authors   = ["azukiwasher"]
  s.email     = ["azukiwasher@higanworks.com"]
  s.homepage  = "http://github.com/azukiwasher/solaar"
  s.summary   = s.description = %q(Calculates the 24 solar terms until 2099)

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- test/*`.split("\n")
  s.require_paths = ["lib"]

  s.rubyforge_project = "solaar"
end
