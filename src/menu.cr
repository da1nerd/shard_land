require "./scene.cr"
require "./game_scene/mountain_top.cr"
require "./commands/command.cr"
require "./commands/new_game.cr"

struct Menu < Scene
  def render
    puts "This is the menu!!!"
  end

  def commands : Array(Command)
    [
      # TODO: if commands could accept blocks we could load a file and then return the proper scene
      # TODO: we need to be able to store a player's current scene, their character details, and possibly some world state.
      Command.new("n", "Start a new game", Commands::NewGame.new("What is your name?", GameScene::MountainTop).as(Command)),
      Command.new("t", "test command", Command.new("Sub command 1", [
        Command.new("1", "Sub command 2.1", Command.new("sub command 2.1.3", self.class)),
        Command.new("2", "Sub command 2.2", Command.new("sub command 2.2.3", self.class)),
      ])),
      Command.new("o", "Open an existing game", GameScene::MountainTop),
      Command.new("q", "Quite the program", nil),
    ]
  end
end
