# puppet-monitoring

## Development

### Setup

You must have ruby 2.0 (same version as our production). You can install it a lot of way, but we recomand https://rvm.io/

You need the bundler gem

`gem install bundler`

And then 

`bundle install`
`bundle exec librarian-puppet install --clean`

### Unit Test

`bundle exec rake lint validate test`

### Acceptence test

`bundle exec kitchen test`

### Debug

If you want to debug, you can play with kitchen to create for you a vagrant vm

`bundle exec kitchen create`

Copy all file and do the puppet apply as many time as needed

`bundle exec kitchen converge`
