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

Create a below file as `$HOME/.platina_world/ruby.yml`

```yml
- lib:
    - paltinaworld:
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
$ platinaworld ruby
```

#### Contents

If you want to create file  which has contents, then use `@` literal as below.

```yml
- .rspec@https://filepath.com
- .gitignore@$HOME/.platina_world/t/ruby/.gitignore
```

then create `.rspec` file which contents get from `http://filepaht.com`, and `.gitignore` file which contents get from `$HOME/.platina_world/t/ruby/.gitignore.paltinaworld`

## TODO

- [x] dry-run
- [x] logger
- [x] error class
- [x] check file exist or not
- [x] dot file
- [x] usage
- [x] has contents( @postion syntax ?)
- [ ] manager spec
- [ ] json parse
- [ ] tree command json parse
- [ ] easy format
