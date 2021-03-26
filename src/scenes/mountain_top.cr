require "./base_scene.cr"
require "./mountain_trail.cr"

module Scenes
  struct MountainTop < BaseScene
    @[Override]
    def render(state : State)
      puts <<-MSG
      You are falling. The sky is shattering around you like glass. Blackness covers you. Then nothing.

      You awake, cold and aching. As you open your eyes you see the snowy sky above you... without cracks.
      Your body aches as you slowly sit up and take in your suroundings. "Where am I?"
      Mountain tops and snow stretch as far as the eye can see. A wasteland.

      "Perfect."

      You notice a trail down the side of the mountain to your right.
      MSG
    end

    @[Override]
    def commands(state : State) : Array(Command)
      super + [
        KeyCommand.new(key: "1", description: "1 - Walk down the train", scene: MountainTrail),
      ]
    end
  end
end
