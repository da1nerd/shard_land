require "./base_scene.cr"
require "./mountain_settlement.cr"
require "../things/canister.cr"

module Scenes
  struct MountainTop < BaseScene
    @[Override]
    def render(state : State)
      describe <<-MSG
      You are falling. The sky is shattering around you like glass. Blackness covers you. Then nothing.

      You awake, cold and aching. As you open your eyes you see the snowy sky above you... without cracks.
      Your body aches as you slowly sit up and take in your suroundings. "Where am I?"
      Mountain tops and snow stretch as far as the eye can see. A wasteland.

      "Perfect."

      You notice a trail down the side of the mountain to your right.

      There is a round flat canister here.
      MSG

      has Canister.new
      can Commands::KeyCommand.new(key: "1", description: "1 - Walk down the trail", scene: MountainSettlement)
    end
  end
end
