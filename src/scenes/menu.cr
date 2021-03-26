require "../engine/*"
require "../commands/*"
require "./mountain_top.cr"

# A special scene that provides some basic game controls to the user
# such as starting a new game or opening a saved game.
#
# The menu *description* introduces the player to your game.
# The *starting_scene* is where players will go first when starting a new game.
struct Scenes::Menu < Scene
  def initialize
    @description = <<-MSG
    **************
    * Shard Land *
    **************
  
    An RPG that is going to be amazing!
  
    Choose an option below:
    MSG
  end

  @[Override]
  def render(state : State)
    puts @description
  end

  # Overrides the normal behavior so that navigating to the menu does not interupt the user's current `Scende` location.
  @[Override]
  def persist_scene_state(state : State) : State
    return state
  end

  @[Override]
  def commands(state : State) : Array(Command)
    options = [
      Commands::Menu::NewGame.new(MountainTop),
      Commands::Menu::SelectSavedGame.new(MountainTop),
    ]
    # TODO: this isn't the best way to check if a game is loaded
    if !state.character.name.empty?
      options << Commands::Menu::SaveGame.new(self.class)
      options << Commands::KeyCommand.new("r", "r - Resume Game", self.get_scene(state.scene))
    end
    options << Commands::KeyCommand.new("q", "q - Quit Game", nil)
    return options
  end

  # Looks up a scene class by name
  private def get_scene(name : String?) : Scene.class | Nil
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
