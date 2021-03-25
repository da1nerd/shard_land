require "./core/*"
require "./game_scene/mountain_top.cr"

game_description = <<-MSG
**************
* Shard Land *
**************

An RPG that is going to be awesome!

Choose an option below:
MSG

game = {
  Menu.new(description: game_description, starting_scene: GameScene::MountainTop),
  State.new,
}

loop do
  break unless game
  scene, state = game
  game = scene.run(state)
end
