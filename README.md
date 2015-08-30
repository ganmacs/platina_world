# PlatinaWorld

<a href="https://codeclimate.com/github/ganmacs/platina_world"><img src="https://codeclimate.com/github/ganmacs/platina_world/badges/gpa.svg" /></a>
[![Build Status](https://travis-ci.org/ganmacs/platina_world.svg)](https://travis-ci.org/ganmacs/platina_world)

platina_world Creates platina world in a moment

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'platina_world'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
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

```bash
$ platinaworld -p pw.yml
```


## TODO

- [ x ] dry-run
- [ x ] logger
- [ x ] error class
- [ ] has contents
- [ ] json parse
- [ ] tree command json parse
- [ ] easy format
