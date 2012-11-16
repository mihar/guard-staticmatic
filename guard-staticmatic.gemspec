# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
# require 'guard-staticmatic/version'

Gem::Specification.new do |gem|
  gem.name          = "guard-staticmatic"
  gem.version       = "0.0.1"
  gem.authors       = ["Miha Rebernik"]
  gem.email         = ["miha@rebernik.info"]
  gem.description   = "Watches for changes in a staticmatic directory and fires build when they happen."
  gem.summary       = "Guard plugin for compiling staticmatic websites."
  gem.homepage      = "https://github.com/mihar/guard-staticmatic"

  gem.add_dependency 'guard', '>= 1.5.0'
  gem.add_dependency 'staticmatic', '~> 0.11.1'
  # You should beware that staticmatic is not compatible with 0.12 series of compass.
  # gem.add_dependency 'compass', '0.11.7'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
