# Shard Land
[![GitHub release](https://img.shields.io/github/release/da1nerd/shard_land.svg)](https://github.com/da1nerd/shard_land/releases)
[![Build Status](https://travis-ci.com/da1nerd/shard_land.svg?branch=master)](https://travis-ci.com/da1nerd/shard_land)


A simple text RPG terminal game/engine.
This is just a fun way to experiment with simple game logic and command line interfaces.

It's pretty simple right now, but it could be a fun community developed game. PRs and ideas are welcome!

## Features

* Save/Restore games
* Scene based tree-like game structure
* Immutable game state - functional programming style
* Chainable user commands

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

## Development

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

Players interact with a scene via `Commands`. These `Commands` can be used to change the state, navigate to a new scene, or both.

> Look at `./src/engine/menu.cr` for an example of how commands can be used.

```crystal
require "./engine/*"

class LevelUpCommand < Command
  def execute(state : State, user_input : String?) : State
    state.character.skill += 1
    return state
  end
end

# elsewhere, in a scene...
LevelUpCommand.new("+", "Level up before going to the next scene!", NextScene)
# The character levels up before navigating to the `NextScene`
```

More details can be found in the [docs](https://shard-land.netlify.app/).

## Contributing

1. Fork it (<https://github.com/da1nerd/shard_land/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Joel](https://github.com/da1nerd) - creator and maintainer
