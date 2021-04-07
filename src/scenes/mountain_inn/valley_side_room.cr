require "../base_scene.cr"

struct Scenes::ValleySideRoom < Scenes::BaseScene
  @[Override]
  def render(state : State)
    describe <<-MSG
    The inn keeper leads you up the flight of steps to a hallway on the second floor.
    "Here you go" he says, opening a door on the right.
    You enter the room, close the door, and promptly fall asleep.
    MSG

    continue MountainInnMorning
  end
end
