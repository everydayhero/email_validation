# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'email_validation/version'

Gem::Specification.new do |spec|
  spec.name          = "Email Validation"
  spec.version       = EmailValidation::VERSION
  spec.authors       = ["Marty Zalega"]
  spec.email         = ["marty@zalega.me"]
  spec.description   = %q{Active Model email validator}
  spec.summary       = %q{Active Model email validator}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "mail", "~> 2.4.4"
  spec.add_development_dependency "activemodel", "~> 3.2.12"
  spec.add_development_dependency "rake"
end
