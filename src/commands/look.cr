# Displays the description of the scene
class Commands::Look < Command
  @desc : String

  def initialize(@desc : String)
  end

  @[Override]
  def validate(state : State, user_input : String?) : Bool
    return user_input == "l" || user_input == "look"
  end

  @[Override]
  def execute(state : State, user_input : String?) : State
    puts @desc
    return state
  end
end
