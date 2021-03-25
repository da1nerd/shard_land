require "yaml"

# Represents the player's character in the game.
# The character is serializable and any fields annotated with `YAML::Field` will persist between saves.
#
# You can extend this for additional functionality.
#
# # Example:
#
# We could add a *skill* field to the character.
#
# ```
# struct Character
#   @[YAML::Field(key: "skill")]
#   property skill : Int32 = 0
# end
# ```
#
# The new *skill* field can now be utilized in a `Scene` or `Command`.
struct Character
  include YAML::Serializable

  @[YAML::Field(key: "name")]
  property name : String

  def initialize(@name)
  end
end
