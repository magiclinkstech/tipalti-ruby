# Tipalti Ruby Gem

A Ruby interface for Tipalti Payments.

## Installation

    $ gem install tipalti

## Configuration

Create a configuration file

```ruby
Tipalti.configure do |config|
  config.master_key = "xxx"
  config.url = "https://ui2.sandbox.tipalti.com"
  config.payer = "MagicLinks"
end
```

## Usage Examples

### Tipalti iFrames ###

Tipalti uses iFrames to support end user access to registration, invoices and payments history.

To generate a valid iFrame url:

```ruby
Tipalti::Iframe.url(user_params)
```
__Supported iFrame Parameters__

The only required parameter is a Payee ID (`idap`).

To specify the page to render, send a `page` parameter with one of:
* `home` (default)
* `invoices`
* `payments`

```ruby
Tipalti::Iframe.url(idap: "user-22579", page: "payments")
```

All other iFrame parameters supported by Tipalti can be passed as params. See the official documentation for details:
https://support.tipalti.com/Content/Topics/Development/iFrames/IframeRequestStructure.htm

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
