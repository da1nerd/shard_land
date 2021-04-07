require "./state.cr"

# Represents a single `Scene` option.
# Commands process user input in a scene and can either display a visible description, or operate invisibly.
# Each instance of a command requires user input. So if you have three nested commands,
# the user will be prompted for input three times one after another before continuing.
#
# # Example
#
# There are a couple of macros to help you define your command:
# ```
# class MyCommand < Command
#   def initialize
#     describe "This is my command"
#     goto TheNextScene
#     sub_command MySubCommand
#     sub_command MyAltSubCommand
#   end
# end
# ```
#
# It's important to note that a command's scene (defined with `goto`) can be ovewritten by a sub command.
# Let's say for example that `MySubCommand` also defines a scene `SubScene`, while `MyAltSubCommand` does not.
# If that sub command ends up being activated, the player will navigate to `SubScene` instead of `TheNextScene`.
# However, if `MyAltSubCommand` is activated, the player will navigate to `TheNextScene`.
abstract class Command
  @next_scene : Scene.class | Nil
  @commands : Array(Command) = [] of Command

  # The scene that will be visited next after this command has been executed.
  getter next_scene

  # An array of sub commands available to the user.
  # Instead of navigating directly to a scene, these subcommands will be display to the player.
  # Then we rely on the subcommands to specify a scene to visit next.
  getter commands

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

  # Checks if the command is enabled.
  # Disabled commands will not be displayed and will not process user input.
  def enabled(state : State) : Bool
    true
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
