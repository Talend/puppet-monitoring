source 'http://rubygems.org'

gem 'puppet', '~> 3.8'
gem 'rake'
gem 'public_suffix', '~> 2'

group :test do
  gem "facterdb", '0.3.12'
  gem 'metadata-json-lint'
  gem "puppet-lint-absolute_classname-check"
  gem "puppet-lint-classes_and_types_beginning_with_digits-check"
  gem "puppet-lint-leading_zero-check"
  gem 'puppet-lint-resource_reference_syntax'
  gem "puppet-lint-trailing_comma-check"
  gem "puppet-lint-unquoted_string-check"
  gem "puppet-lint-version_comparison-check"
  gem 'puppetlabs_spec_helper'
  gem "rspec"
  gem "rspec-puppet", :git => 'https://github.com/rodjek/rspec-puppet.git'
  gem "rspec-puppet-facts"
  gem 'rubocop'
  gem 'semantic_puppet'
  gem 'simplecov', '>= 0.11.0'
  gem 'simplecov-console'
end

group :development do
  gem 'kitchen-vagrant'
  gem 'vagrant-wrapper'
end

group :system_tests do
  gem 'kitchen-puppet'
  gem 'kitchen-sync'
  gem 'kitchen-verifier-serverspec'
  gem 'librarian-puppet'
  gem 'net-ssh'
  gem 'rspec_junit_formatter'
  gem 'serverspec'
  gem 'test-kitchen'
end
