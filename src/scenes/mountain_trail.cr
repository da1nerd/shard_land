require "./base_scene.cr"
require "../commands"

module Scenes
  struct MountainTrail < BaseScene
    @[Override]
    def render(state : State)
      puts <<-MSG
      You start walking down the trail...
      MSG
    end
  end
end
