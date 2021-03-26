require "file_utils"

module SaveUtil
  extend self
  SAVE_DIR = File.join(Path.home, ".shard_land")

  # Saves the game *state* to the disk
  def save_state(state : State)
    FileUtils.mkdir_p(SAVE_DIR)
    File.write(File.join(SAVE_DIR, "#{state.character.name.underscore}.yml"), state.to_yaml)
  end

  # Loads the game `State` stored in *save_path*
  def load_state(save_path) : State
    data = File.read(save_path)
    return State.from_yaml(data)
  end

  # Returns an array of saved games.
  # Games are represented as a tuple of `{name, path}`
  def list_saves : Array(Tuple(String, String))
    saves = Dir.glob(File.join(SAVE_DIR, "*.yml"))
    saves.map do |path|
      {File.basename(path, ".yml"), path}
    end
  end
end
