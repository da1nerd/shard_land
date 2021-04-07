# Initializes the initial game `State`, and starts the game loop.
#
# # Example:
#
# ```
# require "./engine/*"
# require "./first_scene.cr"
#
# start_game(FirstScene)
# ```
def start_game(starting_scene : Scene.class)
  state = State.new
  scene = starting_scene.new
  loop do
    break unless state.running
    scene, state = scene.execute(state)
  end
end
