# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cuthman_rails/version'

Gem::Specification.new do |spec|
  spec.name          = "cuthman_rails"
  spec.version       = CuthmanRails::VERSION
  spec.authors       = ["Nicholas Johnson"]
  spec.email         = ["nicholas@forwardadvance.com"]
  spec.summary       = %q{A widget based CMS for Rails. What Drupal wishes it was.}
  spec.description   = %q{Acts_as_widget}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = ["lib/cuthman_rails.rb",
                        "lib/cuthman_rails/version.rb",
                        "lib/cuthman_rails/template.rb",
                        "lib/active_record/acts_as_widget.rb"]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
