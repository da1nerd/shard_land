require "../../save_util.cr"

# Handles displaying a list of saved games, and allows the
# player select one to continue.
class Commands::Menu::SelectSavedGame < Command
  # The player is taken to *default_scene* if there is a problem loading their saved scene.
  def initialize(@default_scene : Scene.class)
    super(description: "o - Open an existing game", sub_commands: [] of Command)
  end

  @[Override]
  def execute(state : State, user_input : String?) : State
    puts "Choose a saved game:"
    SaveUtil.list_saves.each_with_index do |save, index|
      name, path = save
      game_key = "#{index + 1}"
      @sub_commands << LoadSavedGame.new(path, game_key, "#{game_key} - #{name}", @default_scene)
    end
    return state
  end

  @[Override]
  def validate(state : State, user_input : String?) : Bool
    user_input == "o"
  end
end
