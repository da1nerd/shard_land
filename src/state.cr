require "./character.cr"

struct State
  @character : Character
  property character

  def initialize
    @character = Character.new("")
  end
end
