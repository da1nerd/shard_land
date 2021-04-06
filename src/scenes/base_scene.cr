require "../engine/*"
require "../commands/navigate.cr"
require "annotation"

# Provides some default commands for game scenes
abstract struct Scenes::BaseScene < Scene
  @commands = [Commands::KeyCommand.new("m", "m - Open Menu", Menu)] of Command

  def goto(scene : Scene.class, name : String)
    @commands << Commands::Navigate.new(scene, name)
  end
end
