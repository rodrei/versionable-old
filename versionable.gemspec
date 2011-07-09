# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "versionable/version"

Gem::Specification.new do |s|
  s.name        = "versionable"
  s.version     = Versionable::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Rodrigo Pavano"]
  s.email       = ["rodrigopavano[at]gmail.com"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{Manage version numbers smothly}

  s.rubyforge_project = "versionable"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'rails', ['>= 3.0.0']
  s.add_development_dependency 'bundler', ['>= 1.0.0']
  s.add_development_dependency 'sqlite3', ['>= 0']
  s.add_development_dependency 'rspec', ['>= 0']
  s.add_development_dependency 'rspec-rails', ['>= 0']

end
