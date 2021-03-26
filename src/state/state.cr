require "../engine/*"
require "./character.cr"

struct State
  @[YAML::Field(key: "character")]
  property character : Character

  def initialize
    @character = Character.new("")
  end
end
