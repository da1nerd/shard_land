# Initializes the `Menu` and initial game `State`, and starts the game loop.
# The game will run until a `Scene` returns nil.
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
  game = {
    starting_scene.new,
    State.new,
  }
  loop do
    break unless game
    scene, state = game
    game = scene.run(state)
  end
end
