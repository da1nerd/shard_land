require "./command.cr"
require "./thing.cr"
require "annotation"

# Defines some basic interactions that can be performed on things.
class Interaction < Command
  @name : String
  @thing : Thing

  def initialize(@name : String, @thing : Thing)
  end

  @[Override]
  def validate(state : State, user_input : String?) : Bool
    case user_input
    when "take #{@name}", "grab #{@name}", "pickup #{@name}"
      true
    else
      false
    end
  end

  @[Override]
  def execute(state : State, user_input : String?) : State
    puts "Picked up #{@thing.name}"
    # TODO: place the thing in the character's inventory
    return state
  end
end
