require "../engine/*"
require "../commands/navigate.cr"
require "annotation"

# Provides some default commands for game scenes
abstract struct Scenes::BaseScene < Scene
  @commands = [
    Commands::KeyCommand.new("menu", Menu),
  ] of Command

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

  private macro define_direction(name, *aliases)
    # Defines a scene to the {{name.id}}
    def {{name.id}}(scene : Scene.class, description : String)
      options = [
        {{name.id.stringify}},
        {% if name.id.includes?("_") %}
          {{name.id.gsub(/\_/, " ").stringify}},
        {% end %}
        {% for a in aliases %}
          {% if a.id.includes?("_") %}
            {{a.id.gsub(/\_/, " ").stringify}},
          {% end %}
          {{a.id.stringify}},
        {% end %}
      ]
      options.each do |o|
        @commands << Commands::KeyCommand.new(o, scene)
        @commands << Commands::Examine.new(o, description)
      end
    end
  end

  define_direction :east, :e
  define_direction :southeast, :se
  define_direction :northeast, :ne
  define_direction :west, :w
  define_direction :southwest, :sw
  define_direction :northwest, :nw
  define_direction :north, :n
  define_direction :south, :s

  def continue(scene : Scene.class)
    puts "Press any key to continue..."
    @commands << Commands::Noop.new(scene)
  end
end
