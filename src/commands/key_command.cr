# A convenience command that has to be activated by pressing a specific key
# By default, all commands will be executed in a scene when the user provides input.
# This command will only be executed if the player input matches the *key* value.
class Commands::KeyCommand < Command
  def initialize(@key : String, description : String, scene : Scene.class | Nil)
    describe description
    goto scene
  end

  def initialize(@key : String, description : String, sub_commands commands : Array(Command))
    describe description
    commands.each do |c|
      sub_command c
    end
  end

  def initialize(@key : String, @description : String, sub_command command : Command)
    describe description
    sub_command command
  end

  @[Override]
  def validate(state : State, user_input : String?) : Bool
    return user_input == @key
  end
end
