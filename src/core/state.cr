require "./character.cr"
require "yaml"

struct State
  include YAML::Serializable

  @[YAML::Field(key: "character")]
  property character : Character

  @[YAML::Field(scene: "scene")]
  property scene : String?

  def initialize
    @character = Character.new("")
  end
end
