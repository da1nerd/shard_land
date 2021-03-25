require "./character.cr"
require "yaml"

# Represents the current state of a game.
# You can inject more fields into this to extend functionality.
#
# # Example:
#
# Add a timestamp to the state.
# Properties prefixed with a `YAML::Field` annotation will automatically persist between saves.
#
# ```
# struct State
#   @[YAML::Field(key: "timestamp")]
#   property timestamp : Time?
# end
# ```
#
# By itself, state properties don't do anything.
# You can read and change state in a `Scene` or `Command`.
struct State
  include YAML::Serializable

  @[YAML::Field(key: "character")]
  property character : Character

  @[YAML::Field(key: "scene")]
  property scene : String?

  def initialize
    @character = Character.new("")
  end
end
