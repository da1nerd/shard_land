require "../base_scene.cr"
require "./cliff.cr"
require "./snowy_trail.cr"
require "./shanty"

struct Scenes::Mountain::MountainTop < Scenes::BaseScene
  def description(state : State) : String
    return <<-MSG
    You are falling. The sky is shattering around you like glass. Blackness covers you. Then nothing.

    You awake, cold and aching. As you open your eyes you see the snowy sky above you... without cracks.
    It's cold, really cold. 

    You are standing in the middle of a snowy field on the top of what appears to be a high mountain.
    Visibility is limited through the swirling snow, but you can just make out a small shanty to South, and a line of trees to the East.
    MSG
  end

  @[Override]
  def run(state : State)
    super
    north Scenes::Mountain::Cliff, "The snow storm is so thick that you can't make out anything to the North."
    south Scenes::Mountain::Shanty, "You squint through the blinding snow towards the South. A shanty stands alone, abandoned, but intacted. You can feel yourself getting colder every second."
    east Scenes::Mountain::SnowyTrail, "To the East is a line of pine trees standing guard over what looks like a trail head leading down the mountain."
    west Scenes::Mountain::Cliff, "The ground drops down towards the West. It looks very steep."
  end
end
