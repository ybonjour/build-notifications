# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'build-notifications/version'

Gem::Specification.new do |spec|
  spec.name         = "build-notifications"
  spec.version      = BuildNotifications::VERSION
  spec.platform     = Gem::Platform::RUBY
  spec.authors      = ["Yves Bonjour"]
  spec.email        = ["yves.bonjour@gmail.com"]
  spec.homepage     = %q{https://github.com/ybonjour/build-notifications}
  spec.summary      = %q{Sends notifications about build results based on rules}
  spec.description  = %q{Sends notifications about build results based on rules}
  spec.license      = "MIT"

  spec.files        = `git ls-files`.split("\n")

  spec.require_paths = ["lib"]

  spec.add_dependency "json"
  spec.add_dependency "sinatra"
  spec.add_dependency "thin"
  spec.add_dependency "mercurial-ruby"
  spec.add_dependency "mail"

  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rack-test"
end