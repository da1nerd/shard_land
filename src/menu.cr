require "./scene.cr"
require "./game_scene/mountain_top.cr"
require "./commands/*"

struct Menu < Scene
  def render
    puts <<-MSG
    **************
    * Shard Land *
    **************

    An RPG that is going to be awesome!

    Choose an option below:
    MSG
  end

  def commands : Array(Command)
    options = [
      Commands::NewGame.new(GameScene::MountainTop).as(Command),
      Commands::SelectSavedGame.new(GameScene::MountainTop).as(Command),
    ]
    options << Commands::SaveGame.new("s", "Save Game", self.class).as(Command) if !@state.character.name.empty?
    options << Command.new("q", "Quite the program", nil)
    return options
  end
end
