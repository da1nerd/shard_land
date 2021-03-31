require "./base_scene.cr"
require "../commands"

module Scenes
  struct MountainSettlement < BaseScene
    def render(state : State)
      describe <<-MSG
      You walk for 30 minutes down the snowy trail until you reach a settlement.
      There is an inn just before you that appears to be built so that it hangs off the edge of the mountain.
      There are an assortment of small stores and homes grouped together.
      A small shanty that appears to be selling supplies is not far from the inn.
      MSG
      can Commands::KeyCommand.new(key: "1", description: "1 - Go to the Inn", scene: MountainSettlement)
      can Commands::KeyCommand.new(key: "2", description: "2 - Go to the supply store", scene: MountainSettlement)
    end
  end
end
