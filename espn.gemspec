# -*- encoding: utf-8 -*-
require File.expand_path('../lib/espn/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Julius F"]
  gem.email         = ["baldrailers@gmail.com"]
  gem.description   = %q{Ruby Wrapper for ESPN built with Faraday and FaradayMiddleware}
  gem.summary       = %q{Ruby Wrapper for ESPN}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "espn"
  gem.require_paths = ["lib"]
  gem.version       = Espn::VERSION
end
