# Shard Land
[![GitHub release](https://img.shields.io/github/release/da1nerd/shard_land.svg)](https://github.com/da1nerd/shard_land/releases)
[![Build Status](https://travis-ci.com/da1nerd/shard_land.svg?branch=master)](https://travis-ci.com/da1nerd/shard_land)


A simple text RPG terminal game.

## Installation

Build the executable.

```bash
shards build
```

## Usage

Simply run the compiled code.

```bash
./bin/shard_land
```

The engine code is mostly abstracted.
I may pull it out into a lib shard in the future so people can easily make their own games.

Game state is stored in `State` which has information about the `Character`
and the current scene.
You can inject extra properties into those structs to support custom functionality.

```crystal
struct Character
  # Note: the Character struct is already serializable,
  #  so you just need to serialize new fields.
  @[YAML::Field(key: "skill")]
  property skill : Int32
end
```

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/da1nerd/shard_land/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Joel](https://github.com/da1nerd) - creator and maintainer
