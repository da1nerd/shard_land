require "../engine/*"

# Provides some default commands for game scenes
abstract struct GameScene::BaseScene < Scene
  @[Override]
  def commands(state : State) : Array(Command)
    [
      Command.new("m", "Open the menu", Menu),
    ]
  end
end
