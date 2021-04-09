require "annotation"
require "../engine/*"
require "../commands/*"

# Provides some default commands for game scenes
abstract struct Scenes::BaseScene < Scene
  def goto(scene : Scene.class, name : String)
    @commands << Commands::Navigate.new(scene, name)
  end

  # Adds a `Thing` to the scene.
  # Players will be able to interact with the *thing*.
  def has(thing : Thing)
    thing.names.each do |n|
      @commands << Commands::Take.new(n, thing)
      @commands << Commands::Examine.new(n, thing.description)
    end
  end

  @[Override]
  def run(state : State)
    @commands << Commands::KeyCommand.new("menu", Menu)
    @commands << Commands::Look.new(description(state))
  end

  private macro define_direction(name, *aliases)
    # Defines a scene to the {{name.id}}
    def {{name.id}}(scene : Scene.class, description : String)
      # TODO: also support variations of go to [scene name]
      options = [
        {{name.id.stringify}},
        "go {{name.id}}",
        "go to the {{name.id}}",
        "travel {{name.id}}",
        {% for a in aliases %}
          {{a.id.stringify}},
          "go {{a.id}}",
          "go to the {{a.id}}",
          "travel {{a.id}}",
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
