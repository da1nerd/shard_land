require "./menu.cr"

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
