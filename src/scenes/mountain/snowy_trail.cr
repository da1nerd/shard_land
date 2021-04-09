require "../base_scene.cr"
require "./settlement.cr"
require "./mountain_top.cr"

struct Scenes::Mountain::SnowyTrail < Scenes::BaseScene
  def description(state : State) : String
    # TODO: die if you don't have a coat
    return <<-MSG
    You are on a steep trail along the side of the mountain. The snow comes up to your thighs and it is difficult to keep moving.
    The trail leads down the mountain to the East.
    The trail leads up the mountain to the West.
    MSG
  end

  @[Override]
  def run(state : State)
    west Scenes::Mountain::MountainTop, "The trail winds through snow covered pine trees as it climbs the mountain."
    east Scenes::Mountain::Settlement, "The trail goes down toward some sort of settlement."
  end
end
