require "./base_scene.cr"
require "./mountain_settlement.cr"
require "../things/canister.cr"
require "../commands"

module Scenes
  struct MountainTop < BaseScene
    def description(state : State) : String
      return <<-MSG
      You are falling. The sky is shattering around you like glass. Blackness covers you. Then nothing.

      You awake, cold and aching. As you open your eyes you see the snowy sky above you... without cracks.
      Your body aches as you slowly sit up and take in your suroundings, something metal clinks against your feet as you stand up.

      Mountain tops and snow stretch as far as the eye can see. A wasteland.
      To the east is a trailhead leading down the mountain.
      A small round canister lies in the snow next to your feet.
      MSG
    end

    @[Override]
    def run(state : State)
      super
      has Canister.new
      east MountainSettlement, "The trail is narrow and perilous, but it looks like the only way down the mountain."
    end
  end
end
