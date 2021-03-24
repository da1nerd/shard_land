require "./menu.cr"

scene = Menu.new

loop do
  break unless scene
  scene = scene.run
end
