require "./scene.cr"
require "./command.cr"
require "./game_scene/mountain_top.cr"
require "./commands/new_game.cr"

struct Menu < Scene
  def render
    puts "This is the menu!!!"
  end

  def commands : Array(Command)
    [
      # TODO: if commands could accept blocks we could load a file and then return the proper scene
      # TODO: we need to be able to store a player's current scene, their character details, and possibly some world state.
      # TODO: if scenes could pass some state between each other we could keep everything functional
      Command.new("n", "Start a new game", GameScene::MountainTop.new),
      Command.new("o", "Open an existing game", NewGame.new("What is your name?", GameScene::MountainTop.new).as(Command)),
      Command.new("q", "Quite the program", nil),
    ]
  end
end
