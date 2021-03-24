require "./base_scene"

module GameScene
  struct MountainTop < BaseScene
    def render
      puts <<-MSG
      You are falling. The sky is shattering around you like glass. Blackness covers you. Then nothing.

      You awake, cold and aching. As you open your eyes you see the snowy sky above you... without cracks.
      Your body aches as you slowly sit up and take in your suroundings. "Where am I?"
      Mountain tops and snow stretch as far as the eye can see. A wasteland.

      "Perfect."
      MSG
    end

    def commands : Array(Command)
      super + [
        Command.new("l", "Look around", self),
      ]
    end
  end
end
