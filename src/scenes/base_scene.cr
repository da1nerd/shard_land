require "../engine/*"

# Provides some default commands for game scenes
abstract struct Scenes::BaseScene < Scene
  can Commands::KeyCommand.new("m", "m - Open Menu", Menu)
end
