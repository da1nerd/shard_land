require "./command.cr"
require "./state.cr"
require "./annotation"

# A command that has to be activated by pressing a specific key
class KeyCommand < Command
  def initialize(@key : String, description : String, scene : Scene.class | Nil)
    super(description, scene)
  end

  def initialize(@key : String, description : String, sub_commands : Array(Command))
    super(description, sub_commands)
  end

  def initialize(@key : String, @description : String, sub_command : Command)
    super(description, sub_command)
  end

  @[Override]
  def validate(state : State, user_input : String?) : Bool
    return user_input == @key
  end
end
