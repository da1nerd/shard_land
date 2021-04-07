# Starts a new game after collecting some player information.
module Commands::Menu
  class NewGame < Command
    def initialize(scene : Scene.class)
      sub_command GetCharacterName.new(scene)
    end

    @[Override]
    def validate(state : State, user_input : String?) : Bool
      return user_input == "n"
    end

    @[Override]
    def execute(state : State, user_input : String?) : State
      puts "What is your name?"
      return state
    end
  end
end
