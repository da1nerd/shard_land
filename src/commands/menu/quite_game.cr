# Saves the game `State` to the disk.
class Commands::Menu::QuitGame < Command
  @[Override]
  def validate(state : State, user_input : String?) : Bool
    return user_input == "q"
  end

  @[Override]
  def execute(state : State, user_input : String?) : State
    state.quit
    return state
  end
end
