# guard-eslint

Automatically run eslint when your JavaScript files are changed.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'guard-eslint'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install guard-eslint

Add the default Guard::ESLint definition to your `Guardfile` by running:

```sh
$ guard init eslint
```

## Usage

Please read the [Guard usage documentation](https://github.com/guard/guard#readme).

## Options

You can pass some options in `Guardfile` like the following example:

```ruby
guard :eslint, all_on_start: false, command: 'yarn run eslint' do
  # ...
end
```

### Available Options

```ruby
all_on_start: true     # Check all files at Guard startup.
                       #   default: true
fail_on_warnings: true # Report a failure if there are any warnings
                       #   default: true
command: 'eslint'      # The command to invoke ESLint
````

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/fauxparse/guard-eslint. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Guard::Eslint project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/guard-eslint/blob/master/CODE_OF_CONDUCT.md).
