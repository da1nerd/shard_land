require "./state.cr"

# Represents a single `Scene` option.
#
# Commands are displayed after a `Scene` description, and allow the player to
# iteract with the game.
#
# # Keyless Commands
# A command can be keyless if it has no sibling commands and you want to
# capture freeform text.
# For example you could retrieve a character's name, such as in `MenuCommands::GetCharacterName`.
#
# > Keyless commands don't need to be selected by typing a key (or keys) like keyed commands.
#
# To create a keyless command simply exclude the *key* parameter.
#
# ## Example
# ```
# Command.new(description: "Tell me about yourself", scene: NextScene)
# ```
#
# # Nested Commands
# Commands can be nested in order to produce complex command trees.
# The `Scene` won't change until the player exits the command tree.
#
# ## Example
#
# In this example the player is asked to enter their favorite color as freeform text.
# Next they must choose between two options: "apples" or "oranges".
# Finally, the player is take to the next scene.
#
# ```
# Command.new(
#   description: "We need to gather a little information first",
#   sub_command: Command.new(
#     description: "What is your favorite color?",
#     sub_commands: [
#       Command.new("a", "I perfer apples", NextScene),
#       Command.new("o", "I perfer oranges", NextScene),
#     ]
#   )
# )
# ```
#
# TODO: it would be nice to make the keyless and keyed command types type-safe so they are not used incorrectly.
class Command
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

  def initialize(@description : String, @scene : Scene.class | Nil)
    @sub_commands = [] of Command
  end

  def initialize(@description : String, @sub_commands : Array(Command))
  end

  def initialize(@description : String, sub_command : Command)
    @sub_commands = [sub_command]
  end

  # Performs extra processing on the user input.
  # This will run for both keyed and keyless commands.
  # Override this to add your custom logic.
  #
  # > When using nested commands, commands are executed in order of selection by the player.
  #
  # This is one of the most important parts of a command,
  # because it allows us to change state in response to the player's choices in the game.
  #
  # # Example
  #
  # If we had a *skill* field on `Character` we could update it here to give our player
  # more abilities.
  #
  # ```
  # def execute(state : State, user_input : String?) : State
  #   state.character.skill += 1
  #   return state
  # end
  # ```
  def execute(state : State, user_input : String?) : State
    return state
  end

  # Validates the user input given to the command.
  # This is only executed for keyless commands since the input to keyed commands is always the same as their `#key`.
  # Override this to add your custom logic.
  #
  # You could for example, you could make sure the player does not give an empty string for their character name.
  def validate(state : State, user_input : String?) : Bool
    true
  end
end
