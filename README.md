# YuntongxunSdk

[![Gem Version](https://badge.fury.io/rb/yuntongxun_sdk.svg)](https://badge.fury.io/rb/yuntongxun_sdk)
[![Build Status](https://travis-ci.org/FX-HAO/yuntongxun_sdk.svg?branch=master)](https://travis-ci.org/FX-HAO/yuntongxun_sdk)

YuntongxunSdk is a [云通讯](http://www.yuntongxun.com/doc.html) library for Ruby.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'yuntongxun_sdk'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yuntongxun_sdk

## Configuration

Most applications will only use one application configuration. Rather than having to provide that value every time, you can configure YuntongxunSdk to use global settings:

```ruby
YuntongxunSdk.configure do |cfg|
  cfg.account_sid = "account_sid"
  cfg.auth_token = "auth_token"
  cfg.app_id = "app_id"
end
```

## Usage

```ruby
api = YuntongxunSdk::API.new
args = {:to=>1234567890, :templateId=>1, :datas=>["123456", "5"]}
api.api('/SMS/TemplateSMS', args, "POST")
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/FX-HAO/yuntongxun_sdk. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the YuntongxunSdk project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/FX-HAO/yuntongxun_sdk/blob/master/CODE_OF_CONDUCT.md).
