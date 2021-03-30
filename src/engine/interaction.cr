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
  def validate(state : State, user_input : String?) : Bool
    user_input == "take #{@name}"
  end
end
