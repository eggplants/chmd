# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'chmd/version'

Gem::Specification.new do |spec|
  spec.name          = 'chmd'
  spec.version       = Chmd::VERSION
  spec.authors       = ['eggplants']
  spec.email         = ['w10776e8w@yahoo.co.jp']
  spec.summary       = 'Make CHANGELOG.md from git log and tags.'
  spec.description   = 'Make CHANGELOG.md from git log and tags of repositorywhich origin exists on github.'
  spec.homepage      = 'https://github.com/eggplants/chmd'
  spec.license       = 'MIT'

  spec.metadata = {
    'allowed_push_host' => 'https://rubygems.org',
    'homepage_uri' => spec.homepage,
    'source_code_uri' => spec.homepage,
    'changelog_uri' => 'https://github.com/eggplants/chmd/blob/main/CHANGELOG.md'
  }
  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = 'chmd'
  spec.bindir        = 'bin'
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.required_ruby_version = Gem::Requirement.new('>= 2.7.0')

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
end
