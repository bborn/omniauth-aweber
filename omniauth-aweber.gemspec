# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/aweber/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-aweber"
  spec.version       = Omniauth::Aweber::VERSION
  spec.authors       = ["Dustin Ward"]
  spec.email         = ["dustin.w@boxcar21.com"]
  spec.description   = 'Omniauth strategy for Aweber'
  spec.summary       = 'Omniauth strategy for Aweber'
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'omniauth-oauth', '~> 1.0'
  spec.add_runtime_dependency 'multi_json', '~> 1.0'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
