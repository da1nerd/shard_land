require "../command.cr"
require "../state.cr"
require "../annotation"
require "./load_saved_game.cr"

class MenuCommands::SelectSavedGame < Command
  def initialize(@starting_scene : Scene.class)
    super("o", "Open an existing game", [] of Command)
  end

  @[Override]
  def execute(state : State, user_input : String?) : State
    puts "Choose a saved game:"
    # TODO: load games from file system
    list_saved_games.each_with_index do |save, index|
      name, path = save
      @sub_commands << LoadSavedGame.new(path, "#{index + 1}", name, @starting_scene)
    end
    return state
  end

  @[Override]
  def validate(state : State, user_input : String?) : Bool
    if input = user_input
      return !input.empty?
    end
    return false
  end

  def list_saved_games : Array(Tuple(String, String))
    saves = Dir.glob(File.join(Path.home, ".shard_land/*.yml"))
    saves.map do |path|
      {File.basename(path, ".yml"), path}
    end
  end
end
