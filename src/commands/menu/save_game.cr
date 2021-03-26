require "../../save_util.cr"

# Saves the game `State` to the disk.
class Commands::Menu::SaveGame < Command
  def initialize(scene : Scene.class)
    describe "s - Save Game"
    goto scene
  end

  @[Override]
  def validate(state : State, user_input : String?) : Bool
    return user_input == "s"
  end

  @[Override]
  def execute(state : State, user_input : String?) : State
    SaveUtil.save_state(state)
    puts "Your game is saved!"
    return state
  end
end
