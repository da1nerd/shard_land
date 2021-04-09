require "../base_scene.cr"
require "./settlement.cr"

struct Scenes::Mountain::Stable < Scenes::BaseScene
  def description(state : State) : String
    # TODO: die if you don't have a coat
    return <<-MSG
    You are in the stable...
    The center of the settlement sits to the Southwest.
    MSG
  end

  @[Override]
  def run(state : State)
    southwest Scenes::Mountain::Settlement, "There are houses and a trailhead over there."
  end
end
