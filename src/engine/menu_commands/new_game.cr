require "../command.cr"
require "./get_character_name.cr"
require "../state.cr"
require "../annotation"

# Starts a new game after collecting some player information.
module MenuCommands
  class NewGame < Command
    def initialize(scene : Scene.class)
      super("n", "Start a new game", GetCharacterName.new(scene).as(Command))
    end

    @[Override]
    def execute(state : State, user_input : String?) : State
      puts "We need to ask you a few questions first:"
      return state
    end
  end
end
