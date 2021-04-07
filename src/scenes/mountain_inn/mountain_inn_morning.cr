require "../base_scene.cr"

struct Scenes::MountainInnMorning < Scenes::BaseScene
  def description(state : State) : String
    return <<-MSG
    You wake up the next morning and walk downstairs.
    MSG
  end

  @[Override]
  def run(state : State)
  end
end
