# A convenience command that has to be activated by pressing a specific key
# By default, all commands will be executed in a scene when the user provides input.
# This command will only be executed if the player input matches the *key* value.
class Commands::Examine < Command
  @desc : String

  def initialize(@key : String, @desc : String)
  end

  @[Override]
  def validate(state : State, user_input : String?) : Bool
    return user_input == "x #{@key}" || user_input == "examine #{@key}"
  end

  @[Override]
  def execute(state : State, user_input : String?) : State
    puts @desc
    return state
  end
end
