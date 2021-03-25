require "../command.cr"
require "../state.cr"
require "../annotation"
require "file_utils"

class MenuCommands::SaveGame < Command
  @[Override]
  def execute(state : State, user_input : String?) : State
    save_dir = File.join(Path.home, ".shard_land")
    FileUtils.mkdir_p(save_dir)
    File.write(File.join(save_dir, "#{state.character.name.underscore}.yml"), state.to_yaml)
    puts "Your game is saved!"
    return state
  end
end
