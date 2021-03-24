require "./character.cr"
require "yaml"

struct State
  include YAML::Serializable

  @[YAML::Field(key: "character")]
  property character : Character

  def initialize
    @character = Character.new("")
  end
end
