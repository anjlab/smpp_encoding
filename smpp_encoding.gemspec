# -*- encoding: utf-8 -*-
require File.expand_path('../lib/smpp_encoding/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["yury"]
  gem.email         = ["yury.korolev@gmail.com"]
  gem.description   = %q{Encodings for ruby-smpp gem}
  gem.summary       = %q{Supports auto encoding messages to GSM and UNICODE}
  gem.homepage      = "https://github.com/anjlab/smpp_encoding"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "smpp_encoding"
  gem.require_paths = ["lib"]
  gem.version       = SmppEncoding::VERSION

  gem.add_dependency "gsm_encoder", "~> 0.1.4"
end
