require "./base_scene.cr"
require "../commands"
require "./mountain_inn.cr"
require "./mountain_shop.cr"

module Scenes
  struct MountainSettlement < BaseScene
    describe <<-MSG
    You walk for about half an hour before arriving at a snowed in village.
    An old inn sits at the edge of the road facing the mountain side.
    A perfect place to rest for the night.
    There is an old shop not far from the inn. Probably selling supplies.
    MSG
    can Commands::KeyCommand.new(key: "1", description: "1 - Go to the Inn", scene: MountainInn)
    can Commands::KeyCommand.new(key: "2", description: "2 - Go to the supply store", scene: MountainShop)
  end
end
