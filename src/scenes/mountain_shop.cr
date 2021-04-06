require "./base_scene.cr"

struct Scenes::MountainShop < Scenes::BaseScene
  def render(state : State)
    describe <<-MSG
    In the shop you find an old man sitting on a shot stool while polishing some leather.
    A very old man.
    "What do you need stranger?"
    MSG
  end
end
