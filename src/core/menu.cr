require "./scene.cr"
require "./menu_commands/*"
require "./state.cr"
require "./annotation"

struct Menu < Scene
  def initialize(@description : String, @starting_scene : Scene.class)
  end

  # Provides a default initializer to make the compiler happy.
  # Since elsewhere we are initializing instances of `Scene.class` without any arguments
  # the compile expects all instances of `Scene` to be initialized with no arguments.
  def initialize
    @description = <<-MSG
    **************
    * Shard Land *
    **************
  
    This is the default menu screen.
    You should override this:

    Menu.new(description: "Hello world!", starting_scene: HelloWorldScene)
  
    Choose an option below:
    MSG
    @starting_scene = self.class
  end

  @[Override]
  def render
    puts @description
  end

  @[Override]
  def persist_scene_state(state : State) : State
    # The menu scene should never be stored in the state
    return state
  end

  @[Override]
  def commands(state : State) : Array(Command)
    options = [
      MenuCommands::NewGame.new(@starting_scene).as(Command),
      MenuCommands::SelectSavedGame.new(@starting_scene).as(Command),
    ]
    # TODO: this isn't the best way to check if a game is loaded
    if !state.character.name.empty?
      options << MenuCommands::SaveGame.new("s", "Save Game", self.class).as(Command)
      options << MenuCommands::SaveGame.new("r", "Resume Game", self.get_scene(state.scene)).as(Command)
    end
    options << Command.new("q", "Quite the program", nil)
    return options
  end

  # Looks up a scene class by name
  def get_scene(name : String?) : Scene.class | Nil
    {% begin %}
      case name
      {% for s in Scene.all_subclasses.reject &.abstract? %}
      when "{{s.name}}"
        {{s}}
      {% end %}
      end
    {% end %}
  end
end
