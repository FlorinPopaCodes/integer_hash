# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'integer_hash/version'

Gem::Specification.new do |spec|
  spec.name          = "integer_hash"
  spec.version       = IntegerHash::VERSION
  spec.authors       = ["Florin Popa"]
  spec.email         = ["pp.flrn@gmail.com"]

  spec.summary       = %q{Integer hashing based on Knuth's multiplicative hashing algorithm.}
  spec.homepage      = "https://github.com/icehero/integer_hash"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 12.3"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"

  spec.add_runtime_dependency "activerecord", ">= 4.2"
end
