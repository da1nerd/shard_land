class Commands::Menu::LoadSavedGame < Command
  @game_index : String

  def initialize(@save_path : String, @game_index : String, description)
  end

  @[Override]
  def validate(state : State, user_input : String?) : Bool
    return user_input == @game_index
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
      else
        puts "The saved game is corrupt."
      end
    {% end %}
    return new_state
  end
end
