require "../command.cr"
require "../state.cr"
require "../annotation"
require "file_utils"
require "../save_util.cr"

# Saves the game `State` to the disk.
class MenuCommands::SaveGame < Command
  @[Override]
  def execute(state : State, user_input : String?) : State
    SaveUtil.save_state(state)
    puts "Your game is saved!"
    return state
  end
end
