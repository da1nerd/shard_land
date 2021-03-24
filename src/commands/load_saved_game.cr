require "./command.cr"
require "../state.cr"
require "../annotation"
require "../game_scene/*"

class Commands::LoadSavedGame < Command
  def initialize(@save_path : String, key, description, default_scene : Scene.class)
    super(key, description, default_scene)
  end

  @[Override]
  def execute(state : State, user_input : String?) : State
    new_state = load_state
    # load the proper scene
    {% begin %}
      case new_state.scene
      {% for s in Scene.all_subclasses.reject &.abstract? %}
      when "{{s.name}}"
        @scene = {{s}}
      {% end %}
      end
    {% end %}
    return new_state
  end

  def load_state : State
    data = File.read(@save_path)
    return State.from_yaml(data)
  end
end
