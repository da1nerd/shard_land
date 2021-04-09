require "../base_scene.cr"
require "./snowy_trail.cr"
require "./cliff_trail.cr"
require "./stable.cr"

struct Scenes::Mountain::Settlement < Scenes::BaseScene
  def description(state : State) : String
    # TODO: die if you don't have a coat
    return <<-MSG
    You are standing on the outer rim of a rough settlement. To the North a group of houses with smoke wafting out of their chimneys are closely packed together.
    A small stable sits to the Northeast, just a short distance from the group of houses.
    To the West, a trail leads deeper into the mountain. To the East, the trail continues to go down the mountain.
    MSG
  end

  @[Override]
  def run(state : State)
    northeast Scenes::Mountain::Stable, "A couple of donkeys are in a corral behind the stable. An old man is attending to some work inside the stable."
    west Scenes::Mountain::SnowyTrail, "The trail seems to lead to the top of the mountain."
    east Scenes::Mountain::CliffTrail, "The trail winds down a steep cliff."
  end
end
