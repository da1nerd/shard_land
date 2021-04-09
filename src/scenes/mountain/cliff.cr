require "../base_scene.cr"

struct Scenes::Mountain::Cliff < Scenes::BaseScene
  def description(state : State) : String
    return <<-MSG
    The snow is so thick that you can't see where you are going.
    Suddenly, the ground drops away from beneath you and you plunge
    to a frozen grave.

    ~ The End ~
    MSG
  end

  @[Override]
  def before(state : State) : State
    state.quit
    return state
  end
end
