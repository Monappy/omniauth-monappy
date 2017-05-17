# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-monappy/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-monappy"
  spec.version       = Omniauth::Monappy::VERSION
  spec.authors       = ["Monappy"]
  spec.email         = ["support@monappy.jp"]

  spec.summary       = %q{OmniAuth strategy for Monappy.}
  spec.description   = %q{OmniAuth strategy for Monappy.}
  spec.homepage      = "https://github.com/monappy/omniauth-monappy"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'omniauth'
  spec.add_dependency 'omniauth-oauth2'
  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
end
