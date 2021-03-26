require "./state.cr"

# Represents a single `Scene` option.
# Commands process user input in a scene and can either display a visible description, or operate invisibly.
#
# A command will always produce a `Scene` or another command. The occurrence of a new `Scene` indicates
# the player is finished in the current scene and will then navigate to the new scene.
abstract class Command
  @description : String?
  @scene : Scene.class | Nil
  @sub_commands : Array(Command)

  # A description of the command.
  # This should help the player decide what to do.
  getter description

  # The scene that will be visited next after this command has been executed.
  # If the scene is nill and there are no `#sub_commands` the game will exit.
  getter scene

  # An array of sub commands available to the user.
  # Instead of navigating directly to a scene, these subcommands will be display to the player.
  # Then we rely on the subcommands to specify a scene to visit next.
  getter sub_commands

  def initialize(@scene : Scene.class | Nil)
    @sub_commands = [] of Command
  end

  def initialize(@sub_commands : Array(Command))
  end

  def initialize(sub_command : Command)
    @sub_commands = [sub_command] of Command
  end

  def initialize(@description : String, @scene : Scene.class | Nil)
    @sub_commands = [] of Command
  end

  def initialize(@description : String, @sub_commands : Array(Command))
  end

  def initialize(@description : String, sub_command : Command)
    @sub_commands = [sub_command] of Command
  end

  # Performs extra processing on the user input.
  # Override this to add your custom logic.
  #
  # > When using nested commands, commands are executed in order of selection by the player.
  #
  # This is one of the most important parts of a command,
  # because it allows us to change state in response to the player's choices in the game.
  #
  # # Example
  #
  # If we had a *character_name* field on `State` we could update it here:
  #
  # ```
  # def execute(state : State, user_input : String?) : State
  #   state.character_name = user_input
  #   return state
  # end
  # ```
  def execute(state : State, user_input : String?) : State
    return state
  end

  # Validates the user input given to the command.
  # Override this to add your custom logic.
  #
  # # Example
  # You could make sure the player provides a non-empty string for their character name.
  #
  # ```
  # def validate(state : State, user_input : String?) : Bool
  #   if input = user_input
  #     return !input.empty?
  #   end
  #   return false
  # end
  # ```
  def validate(state : State, user_input : String?) : Bool
    true
  end
end
