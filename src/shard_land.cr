require "./menu.cr"

game = {Menu.new, State.new}

loop do
  break unless game
  scene, state = game
  game = scene.run(state)
end
