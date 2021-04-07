require "../base_scene.cr"

struct Scenes::MountainInnMorning < Scenes::BaseScene
  @[Override]
  def render(state : State)
    describe <<-MSG
    You wake up the next morning and walk downstairs.
    MSG
  end
end
