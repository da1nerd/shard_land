require "../../base_scene.cr"
require "../mountain_top.cr"
require "./cot.cr"
require "./trunk.cr"
require "./key.cr"
require "./letter.cr"
require "./oil_lamp.cr"

struct Scenes::Mountain::Shanty < Scenes::BaseScene
  @[Override]
  def description(state : State) : String
    return <<-MSG
    You are in a small one-room shanty. Small cracks in the wall produce a howling noise from the snowstorm outside.
    A cot sits in the far corner. To your right is a closed trunk.
    In the middle of the room is a small table on which sits a letter, oil lamp, and a key.
    MSG
  end

  @[Override]
  def run(state : State)
    north Scenes::Mountain::MountainTop, "A door stands behind you to the North"
    # TODO: turn cot into a container
    has Cot.new
    # TODO: turn trunk into a container
    has Trunk.new
    # TODO: create a table container that holds these
    has Key.new
    has Letter.new
    has OilLamp.new
  end
end
