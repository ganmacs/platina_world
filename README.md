# PlatinaWorld

platina_world Creates platina world in a moment

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'platina_world'
```

And then execute:

```sh
$ bundle
```

Or install it yourself as:

```sh
$ gem install platina_world
```

## Usage

If you want to create those directories and files

```
.
├── .gitignore
├── .rspec
├── lib
│   ├── platina_world
│   └── platina_world.rb
└── spec
    ├── platina_world
    │   └── platinaworld_spec.rb
    └── spec_helper.rb
```

Create a below file as `pw.yml`

```yml
- lib:
    - paltinaworld
    - paltinaworld.rb
- spec:
    - paltinaworld:
      - platinaworld_spec.rb
    - spec_helper.rb
- .rspec
- .gitignore
```

and run as below

```sh
platina_world pw.yml
```

