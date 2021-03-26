# A convenience command that has to be activated by pressing a specific key
# By default, all commands will be executed in a scene when the user provides input.
# This command will only be executed if the player input matches the *key* value.
class Commands::KeyCommand < Command
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
