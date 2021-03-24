require "./command.cr"
require "../state.cr"
require "annotation"

class Commands::OpenGame < Command
  def initialize(scene : Scene.class)
    super("Choose your game", scene)
  end

  @[Override]
  def execute(state : State, user_input : String?) : State
    puts "Loading your game"
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
