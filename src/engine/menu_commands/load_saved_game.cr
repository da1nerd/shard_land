require "../command.cr"
require "../state.cr"
require "../annotation"
require "../save_util.cr"

class MenuCommands::LoadSavedGame < Command
  def initialize(@save_path : String, key, description, default_scene : Scene.class)
    super(key, description, default_scene)
  end

  @[Override]
  def execute(state : State, user_input : String?) : State
    new_state = SaveUtil.load_state(@save_path)
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
end
