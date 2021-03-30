require "./command.cr"
require "./thing.cr"

# Defines some basic interactions that can be performed on things.
class Interaction < Command
  @thing : String
  @thing : Thing

  def initialize(@name : String, @thing : Thing)
    @description = "There is a #{@name} here."
  end

  @[Override]
  def execute(state : State, user_input : String?) : State
    if user_input == "take #{@name}"
      puts "You took #{@name}"
    end
    return state
  end
end
