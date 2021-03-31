require "../engine/*"

# Provides some default commands for game scenes
abstract struct Scenes::BaseScene < Scene
  @commands = [Commands::KeyCommand.new("m", "m - Open Menu", Menu)] of Command
end
