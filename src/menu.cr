require "./scene.cr"
require "./command.cr"
require "./game_scene/mountain_top.cr"

struct Menu < Scene
  def render
    puts "This is the menu!!!"
  end

  def commands : Array(Command)
    [
      Command.new("s", "Start a new game", GameScene::MountainTop.new),
      Command.new("q", "Quite the program", nil),
    ]
  end
end
