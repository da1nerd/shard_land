require "./engine/*"
require "./game_scene/mountain_top.cr"

game_description = <<-MSG
**************
* Shard Land *
**************

An RPG that is going to be awesome!

Choose an option below:
MSG

start_game(game_description, GameScene::MountainTop)
