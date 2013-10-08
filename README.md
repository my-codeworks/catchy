# Catchy

catchy: Instantly appealing and memorable, a gem to capture chains of method calls.

[![Gem Version](https://badge.fury.io/rb/catchy.png)](http://badge.fury.io/rb/catchy)
[![Build Status](https://travis-ci.org/my-codeworks/catchy.png)](https://travis-ci.org/my-codeworks/catchy)
[![Code Climate](https://codeclimate.com/github/my-codeworks/catchy.png)](https://codeclimate.com/github/my-codeworks/catchy)

## Installation

Add this line to your application's Gemfile:

    gem 'catchy'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install catchy

## Usage

### Basic

At it's simplest you just instantiate a new `Catchy` and give it to whatever you want to capture the calls of:

    proxy = Catchy.new
    object.black_box( proxy )

Then you can get the chain of called methods as a string:

    proxy.to_s # => "some.chain.of.method.calls"

### Configuration

"But what if I need to capture call chains that include calls to to_s?" I hear you saying. Ah, we thought of that. Simply tell `Catchy` that you want another name for `to_s` when you create it, like this:

    proxy = Catchy.new(to_s: :__to_string__)

or with a config block, handy for a Rails initializer or similar, like this:

    # config/initializers/catchy.rb
    Catchy.configure do |config|
      config.to_s = :__to_string__
    end

    # app/whatever/class.rb
    proxy = Catchy.new

Then you can use it like this:

    proxy.call.whatever.you.want.to_s
    ...
    proxy.__to_string__

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Special thanks

To [Hüseyin Öztürk](https://github.com/hsyn) for suggesting the name. Originally the gem was called MethodChainProxy, but mr Öztürk found it less than sexy and suggested: "something funny and relevant, catchy ..." so there we where, Catchy. Exellent work!
