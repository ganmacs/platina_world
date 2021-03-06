# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "platina_world/version"

Gem::Specification.new do |spec|
  spec.name          = "platina_world"
  spec.version       = PlatinaWorld::VERSION
  spec.authors       = ["ganmacs"]
  spec.email         = ["ganmacs@gmail.com"]

  spec.summary       = "Creating platina world in a moment"
  spec.description   = "Creating platina world in a moment"
  spec.homepage      = "https://github.com/ganmacs/platina_world"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
