# A convenience command that has to be activated by pressing a specific key
# By default, all commands will be executed in a scene when the user provides input.
# This command will only be executed if the player input matches the *key* value.
class Commands::KeyCommand < Command
  def initialize(@key : String, @scene : Scene.class | Nil)
  end

  def initialize(@key : String, sub_commands commands : Array(Command))
    commands.each do |c|
      @commands << c
    end
  end

  def initialize(@key : String, sub_command command : Command)
    @commands << command
  end

  @[Override]
  def validate(state : State, user_input : String?) : Bool
    return user_input == @key
  end
end
