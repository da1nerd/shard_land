require "../base_scene.cr"

struct Scenes::MountainSideRoom < Scenes::BaseScene
  @[Override]
  def render(state : State)
    describe <<-MSG
    The inn keeper leads you up the flight of steps to a hallway on the second floor.
    "Here you go" he says, opening a door on the left.
    You enter the room, close the door, and promptly fall asleep.
    MSG
  end
end
