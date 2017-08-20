# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'now_ui_kit/version'

Gem::Specification.new do |spec|
  spec.name          = "now-ui-kit-rails"
  spec.version       = NowUiKit::Rails::VERSION
  spec.authors       = ["mgi166"]
  spec.email         = ["skskoari@gmail.com"]

  spec.summary       = "now-ui-kit for the Rails asset pipeline."
  spec.description   = "now-ui-kit for the Rails asset pipeline."
  spec.homepage      = "https://github.com/mgi166/now-ui-kit-rails"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"

  spec.add_dependency "sass-rails"
end
