require "../scene.cr"
require "../commands/command.cr"
require "../menu.cr"
require "annotation"

# Provides some default menu commands for game scenes
abstract struct GameScene::BaseScene < Scene
  @[Override]
  def commands : Array(Command)
    [
      Command.new("m", "Open the menu", Menu),
    ]
  end
end
