require "./command.cr"
require "../state.cr"
require "annotation"

module Commands
  class GetCharacterName < Command
    def initialize(scene : Scene.class)
      super("What is your name?", scene)
    end

    @[Override]
    def execute(state : State, user_input : String?) : State
      state.character.name = user_input.not_nil!
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
end
