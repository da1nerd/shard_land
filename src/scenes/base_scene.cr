require "../engine/*"
require "../commands/navigate.cr"
require "annotation"

# Provides some default commands for game scenes
abstract struct Scenes::BaseScene < Scene
  @commands = [Commands::KeyCommand.new("m", Menu)] of Command

  def goto(scene : Scene.class, name : String)
    @commands << Commands::Navigate.new(scene, name)
  end

  @[Override]
  def has(thing : Thing)
    super
    thing.names.each do |n|
      @commands << Commands::Examine.new(n, thing.description)
    end
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
    puts "Press any key to continue..."
    @commands << Commands::Noop.new(scene)
  end
end
