require "../state.cr"

# Represents a user command.
# Commands are displayed after a `Scene` and allows the user to
# choose between different actions.
#
# An action can be keyeless if it has no sibling commands and you want to
# capture free form text. This is useful for situations where you
# want to retrieve a player's name.
#
# Commands can be nested in order to produce complex command trees.
#
# TODO: it would be nice to make the keyeless and keyed command types type-safe.
class Command
  @key : String?
  @sub_commands : Array(Command)

  getter key, description, scene, sub_commands

  def initialize(@key : String, @description : String, @scene : Scene.class | Nil)
    @sub_commands = [] of Command
  end

  # Creates a keyless command that will execute a scene right away
  # Keyless commands should not be used with keyed commands.
  def initialize(@description : String, @scene : Scene.class | Nil)
    @sub_commands = [] of Command
  end

  def initialize(@key : String, @description : String, @sub_commands : Array(Command))
  end

  def initialize(@key : String, @description : String, command : Command)
    @sub_commands = [command]
  end

  # Creates a keyless command that immediately calls another command.
  # Keyless commands should not be used with keyed commands.
  def initialize(@description : String, @sub_commands : Array(Command))
  end

  # :ditto:
  def initialize(@description : String, command : Command)
    @sub_commands = [command]
  end

  # Performs extra processing on the user input.
  # This will run for both keyed and keyless commands.
  # Override this to add your custom logic.
  def execute(state : State, user_input : String?) : State
    return state
  end

  # Validates the user input given to the command.
  # This is only executed for keyless commands since keyed commands don't have any raw input.
  # Override this to add your custom logic.
  def validate(state : State, user_input : String?) : Bool
    true
  end
end
