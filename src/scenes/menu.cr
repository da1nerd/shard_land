require "../engine/*"
require "../commands/*"
require "./mountain_top.cr"
require "annotation"

# A special scene that provides some basic game controls to the user
# such as starting a new game or opening a saved game.
#
# The menu *description* introduces the player to your game.
# The *starting_scene* is where players will go first when starting a new game.
struct Scenes::Menu < Scene
  @[Override]
  def render(state : State)
    describe <<-MSG
    **************
    * Shard Land *
    **************
  
    An RPG that is going to be amazing!
  
    Choose an option below:
    MSG

    can Commands::Menu::NewGame.new(MountainTop)
    can Commands::Menu::SelectSavedGame.new(MountainTop)
    # TODO: this isn't the best way to check if a game is loaded
    if !state.character.name.empty?
      can Commands::Menu::SaveGame.new(self.class)
      can Commands::KeyCommand.new("r", "r - Resume Game", self.get_scene(state.scene))
    end
    can Commands::Menu::QuitGame.new
  end

  # Overrides the normal behavior so that navigating to the menu does not interupt the user's current `Scende` location.
  @[Override]
  def before(state : State) : State
    return state
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
