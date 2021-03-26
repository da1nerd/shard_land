require "../engine/*"

# Provides some default commands for game scenes
abstract struct Scenes::BaseScene < Scene
  @[Override]
  def commands(state : State) : Array(Command)
    [
      KeyCommand.new("m", "m - Open Menu", Menu),
    ] of Command
  end
end
