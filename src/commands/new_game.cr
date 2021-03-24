require "./command.cr"
require "../state.cr"
require "annotation"

class Commands::NewGame < Command
  @[Override]
  def execute(state : State, user_input : String?) : State
    puts "Your name is #{user_input}"
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
