source 'http://rubygems.org'

ruby '~> 2.0'

gem 'public_suffix', '~> 2'
gem 'puppet', '~> 3.8'
gem 'rake' , '~> 12.3.3'

group :test do
  gem 'metadata-json-lint'
  gem "puppet-lint-absolute_classname-check"
  gem "puppet-lint-classes_and_types_beginning_with_digits-check"
  gem "puppet-lint-leading_zero-check"
  gem 'puppet-lint-resource_reference_syntax'
  gem "puppet-lint-trailing_comma-check"
  gem "puppet-lint-unquoted_string-check"
  gem "puppet-lint-version_comparison-check"
  gem 'puppetlabs_spec_helper'
  gem 'rspec', '3.7.0'
  gem "rspec-puppet", :git => 'https://github.com/rodjek/rspec-puppet.git', :tag => 'v2.6.11'
  gem "rspec-puppet-facts"
  gem 'rubocop', '0.50.0'
  gem 'semantic_puppet'
  gem 'simplecov', '>= 0.11.0'
  gem 'simplecov-console'
  gem 'parallel', '1.13.0'
end

group :development do
  gem 'kitchen-vagrant'
  gem 'vagrant-wrapper'
end

group :system_tests do
  gem 'artifactory', '2.8.2'
  gem 'mixlib-shellout', '2.2.7'
  gem 'kitchen-ec2', '1.3.2'
  gem 'kitchen-puppet', '3.3.1'
  gem 'kitchen-sync'
  gem 'kitchen-verifier-serverspec'
  gem 'librarian-puppet'
  gem 'net-ssh'
  gem 'rainbow', '2.2.2'
  gem 'rspec_junit_formatter'
  gem 'serverspec'
  gem 'test-kitchen', '1.16.0'
end
