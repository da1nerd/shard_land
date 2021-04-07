require "./base_scene.cr"
require "../commands"
require "./mountain_inn.cr"
require "./mountain_shop.cr"

module Scenes
  struct MountainSettlement < BaseScene
    def description(state : State) : String
      return <<-MSG
      You walk for 30 minutes down the snowy trail until you reach a settlement.
      There is an inn to the northeast that appears to be built so that it hangs off the edge of the mountain.
      There are an assortment of small stores and homes grouped together.
      To the east is a small shanty, that appears to be selling supplies, is not far from the inn.
      MSG
    end

    @[Override]
    def run(state : State)
      west MountainTop, "to the west, a small trail leads up the side of the mountain."
      northeast MountainInn, "The inn is rugged weathered and surrounded by snow drifts. Smoke is coming out of the chimney. Looks like a good place to get warm."
      east MountainShop, "The outside of the shop is cluttered with crates of various shapes and sizes. The inside looks equaly cluttered. Might be a good place to find supplies."
    end
  end
end
