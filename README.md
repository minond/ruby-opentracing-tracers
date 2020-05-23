# OpenTracing::Tracers

OpenTracing tracers.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruby-opentracing-tracers'
```

And then execute:

```
$ bundle install
```

Or install it yourself as:

```
$ gem install ruby-opentracing-tracers
```


## Usage

#### Creating the global tracer with Jaeger

```ruby
OpenTracing.global_tracer = OpenTracing::Tracers.build_jaeger_client("web")
```


#### ActiveRecord tracer

```ruby
OpenTracing::Tracers::ActiveRecord.instrument!
```


#### DelayedJob tracer

```ruby
OpenTracing::Tracers::DelayedJob.instrument!
```


#### Rack tracer

```ruby
OpenTracing::Tracers::Rack.instrument!
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake spec` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/[USERNAME]/ruby-opentracing-tracers.


## License

The gem is available as open source under the terms of the [MIT
License](https://opensource.org/licenses/MIT).

---

[![Build Status](https://travis-ci.org/minond/ruby-opentracing-tracers.svg?branch=master)](https://travis-ci.org/minond/ruby-opentracing-tracers)
