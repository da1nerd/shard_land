require "./scene.cr"
require "./game_scene/mountain_top.cr"
require "./commands/command.cr"
require "./commands/new_game.cr"

struct Menu < Scene
  def render
    puts <<-MSG
    **************
    * Shard Land *
    **************

    An RPG that is going to be awesome!

    Choose an option below:
    MSG
  end

  def commands : Array(Command)
    [
      Commands::NewGame.new(GameScene::MountainTop).as(Command),
      Command.new("o", "Open an existing game", GameScene::MountainTop),
      Command.new("q", "Quite the program", nil),
    ]
  end
end
