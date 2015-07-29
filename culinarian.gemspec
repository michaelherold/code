# coding: utf-8
require File.expand_path('../lib/culinarian/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name = 'culinarian'
  spec.version = Culinarian::VERSION
  spec.authors = ['Michael Herold']
  spec.email = ['michael.j.herold@gmail.com']

  spec.summary = 'Write recipes with a DSL'
  spec.description = <<-DESC
    This is a simple DSL to demonstrate Ruby's dynamism to a talk for
    non-Rubyists.
  DESC
  spec.homepage = 'https://github.com/michaelherold/culinarian'
  spec.license = 'MIT'

  spec.files = %w[LICENSE.md README.md Rakefile culinarian.gemspec]
  spec.files += Dir['lib/**/*.rb']
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'
end
