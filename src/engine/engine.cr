require "./menu.cr"

# Initializes the `Menu` and initial game `State`, and starts the game loop.
# The game will run until a `Scene` returns nil.
#
# # Example:
#
# ```
# require "./engine/*"
# start_game("My game is awesome!", FirstScene)
# ```
def start_game(menu_text : String, starting_scene : Scene.class)
  game = {
    Menu.new(menu_text, starting_scene),
    State.new,
  }
  loop do
    break unless game
    scene, state = game
    game = scene.run(state)
  end
end
