require "./scene.cr"
require "./game_scene/mountain_top.cr"
require "./commands/*"
require "./state.cr"
require "./annotation"

struct Menu < Scene
  @[Override]
  def render
    puts <<-MSG
    **************
    * Shard Land *
    **************

    An RPG that is going to be awesome!

    Choose an option below:
    MSG
  end

  @[Override]
  def persist_scene_state(state : State) : State
    # The menu scene should never be stored in the state
    return state
  end

  @[Override]
  def commands(state : State) : Array(Command)
    options = [
      Commands::NewGame.new(GameScene::MountainTop).as(Command),
      Commands::SelectSavedGame.new(GameScene::MountainTop).as(Command),
    ]
    # TODO: this isn't the best way to check if a game is loaded
    if !state.character.name.empty?
      options << Commands::SaveGame.new("s", "Save Game", self.class).as(Command)
      options << Commands::SaveGame.new("r", "Resume Game", self.get_scene(state.scene)).as(Command)
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
