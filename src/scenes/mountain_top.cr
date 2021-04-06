require "./base_scene.cr"
require "./mountain_settlement.cr"
require "../things/shard.cr"

module Scenes
  struct MountainTop < BaseScene
    def render(state : State)
      describe <<-MSG
      You are falling. The sky is shattering around you like glass. Blackness covers you. Then nothing.

      You awake, cold and aching. As you open your eyes you see the snowy sky above you... without cracks.
      Your body aches as you slowly sit up and take in your suroundings. "Where am I?"
      Mountain tops and snow stretch as far as the eye can see. A wasteland.

      "Perfect."

      You notice a trail down the side of the mountain to your right.

      There is a round flat canister here. "Oh good, I did grab it."
      The shards where a myth. At least most people thought so.
      Now Chris had one in his possession. If he could just find the rest.
      MSG

      has Shard.new
      can Commands::KeyCommand.new(key: "1", description: "1 - Walk down the train", scene: MountainSettlement)
    end
  end
end
