require "../effect/take.cr"

# Defines some basic interactions that can be performed on things.
class Commands::Take < Command
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
    if @thing.is_a?(Effect::Take)
      puts "Took #{@thing.name}"
      return (@thing.as(Effect::Take)).take(state)
    else
      puts "Cannot take #{@thing.name}"
    end
    return state
  end
end
