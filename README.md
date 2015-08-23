# IntegerHash

[![Build Status](https://travis-ci.org/icehero/integer_hash.svg?branch=master)](https://travis-ci.org/icehero/integer_hash)
[![Code Climate](https://codeclimate.com/github/icehero/integer_hash/badges/gpa.svg)](https://codeclimate.com/github/icehero/integer_hash)
[![Test Coverage](https://codeclimate.com/github/icehero/integer_hash/badges/coverage.svg)](https://codeclimate.com/github/icehero/integer_hash/coverage)

A small rugy gem that implements Knuth's multiplication hashing algorithm with the following properties: fast, reversable and zero collisions.

This is a port from PHP of the [jenssegers/optimus](https://github.com/jenssegers/optimus) package.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'integer_hash'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install integer_hash

## Configure

Override any of these defaults in `config/initializers/clearance.rb`:

```ruby
IntegerHash.configure do |config|
  config.prime = 1
  config.inverse_prime = 1
  config.random_prime = 1
end
```

## Usage



TODO: Write usage instructions here

## Alternatives



## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/icehero/integer_hash.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

