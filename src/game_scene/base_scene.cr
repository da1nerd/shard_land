require "../annotation"
require "../scene.cr"
require "../commands/command.cr"
require "../menu.cr"
require "../state.cr"

# Provides some default menu commands for game scenes
abstract struct GameScene::BaseScene < Scene
  @[Override]
  def commands(state : State) : Array(Command)
    [
      Command.new("m", "Open the menu", Menu),
    ]
  end
end
