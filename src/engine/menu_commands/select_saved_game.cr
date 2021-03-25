require "../command.cr"
require "../state.cr"
require "../annotation"
require "./load_saved_game.cr"
require "../save_util.cr"

# Handles displaying a list of saved games, and allows the
# player select one to continue.
class MenuCommands::SelectSavedGame < Command
  # The player is taken to *default_scene* if there is a problem loading their saved scene.
  def initialize(@default_scene : Scene.class)
    super("o", "Open an existing game", [] of Command)
  end

  @[Override]
  def execute(state : State, user_input : String?) : State
    puts "Choose a saved game:"
    SaveUtil.list_saves.each_with_index do |save, index|
      name, path = save
      @sub_commands << LoadSavedGame.new(path, "#{index + 1}", name, @default_scene)
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
end
