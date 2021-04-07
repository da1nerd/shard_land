require "./base_scene.cr"
require "../commands"
require "./mountain_inn.cr"
require "./mountain_shop.cr"

module Scenes
  struct MountainSettlement < BaseScene
    @[Override]
    def render(state : State)
      describe <<-MSG
      You walk for 30 minutes down the snowy trail until you reach a settlement.
      There is an inn just before you that appears to be built so that it hangs off the edge of the mountain.
      There are an assortment of small stores and homes grouped together.
      A small shanty that appears to be selling supplies is not far from the inn.
      MSG
      can Commands::KeyCommand.new(key: "1", scene: MountainInn)
      can Commands::KeyCommand.new(key: "2", scene: MountainShop)
    end
  end
end
