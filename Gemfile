source 'http://rubygems.org'

ruby '~> 2.0'

gem 'public_suffix', '~> 2'
gem 'puppet', '~> 3.8'
gem 'rake' , '~> 12.3'

group :test do
  gem 'metadata-json-lint'
  gem "puppet-lint-absolute_classname-check", '1.0.0'
  gem "puppet-lint-classes_and_types_beginning_with_digits-check", '0.1.2'
  gem "puppet-lint-leading_zero-check", '0.1.1'
  gem 'puppet-lint-resource_reference_syntax', '1.1.0'
  gem "puppet-lint-trailing_comma-check", '0.4.2'
  gem "puppet-lint-unquoted_string-check", '1.0.0'
  gem "puppet-lint-version_comparison-check", '0.2.1'
  gem 'puppetlabs_spec_helper', '2.14.1'
  gem 'rspec', '3.7.0'
  gem "rspec-puppet", :git => 'https://github.com/rodjek/rspec-puppet.git', :tag => 'v2.6.11'
  gem "rspec-puppet-facts", '1.9.2'
  gem 'rubocop', '0.50.0'
  gem 'semantic_puppet', '1.0.2'
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
