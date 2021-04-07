require "../engine/*"
require "../commands/navigate.cr"
require "annotation"

# Provides some default commands for game scenes
abstract struct Scenes::BaseScene < Scene
  @commands = [Commands::KeyCommand.new("m", "m - Open Menu", Menu)] of Command

  def goto(scene : Scene.class, name : String)
    @commands << Commands::Navigate.new(scene, name)
  end

  # Defines a scene to the east
  def east(scene : Scene.class, description : String)
    options = ["e", "east"]
    options.each do |o|
      @commands << Commands::KeyCommand.new(o, scene)
      @commands << Commands::Examine.new(o, description)
    end
  end

  def continue(scene : Scene.class)
    @commands << Commands::Continue.new(scene)
  end
end
