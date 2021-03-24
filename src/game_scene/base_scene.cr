require "../scene.cr"
require "../command.cr"
require "../menu.cr"

# Provides some default menu commands for game scenes
abstract struct GameScene::BaseScene < Scene
  def commands : Array(Command)
    [
      Command.new("m", "Open the menu", Menu.new),
    ]
  end
end
