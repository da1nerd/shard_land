require "../../save_util.cr"

# Handles displaying a list of saved games, and allows the
# player select one to continue.
class Commands::Menu::SelectSavedGame < Command
  @[Override]
  def execute(state : State, user_input : String?) : State
    games = SaveUtil.list_saves
    if games.size > 0
      puts "Choose a saved game:"
      games.each_with_index do |save, index|
        name, path = save
        game_key = "#{index + 1}"
        puts "#{game_key} - #{name}"
        @commands << LoadSavedGame.new(path, game_key, "#{game_key} - #{name}")
      end
    else
      puts "There are no saved games."
    end
    return state
  end

  @[Override]
  def validate(state : State, user_input : String?) : Bool
    user_input == "o"
  end
end
