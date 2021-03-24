require "./command.cr"
require "../state.cr"
require "annotation"

class Commands::LoadSavedGame < Command
  def initialize(@save_path : String, key, description, scene : Scene.class)
    super(key, description, scene)
  end

  @[Override]
  def execute(state : State, user_input : String?) : State
    return load_state
  end

  def load_state : State
    data = File.read(@save_path)
    return State.from_yaml(data)
  end
end
