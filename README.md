# Platinaworld

platinaworld Creates platina world in a moment

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'platinaworld'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install platinaworld

## Usage

If you want to create those directory and file

```
.
├── .gitignore
├── .rspec
├── lib
│   ├── platinaworld
│   └── platinaworld.rb
└── spec
    ├── platinaworld
    │   └── platinaworld_spec.rb
    └── spec_helper.rb
```
create blow file(`pw.yml`)

```yml
lib
  - paltinaworld
  - paltinaworld.rb
spec
  - paltinaworld
    - platinaworld_spec.rb
  - spec_helper.rb
.rspec
.gitignore
```

and run as blow

```
platinaworld pw.yml
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/platinaworld/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
