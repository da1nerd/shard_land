require "../base_scene.cr"

struct Scenes::Mountain::CliffTrail < Scenes::BaseScene
  @[Override]
  def description(state : State) : String
    # TODO: allow the player to succeed if they have a donkey
    return <<-MSG
    The cliff is treacherous and steep.
    After only a few minutes, you slip and fall to a frozen grave.

    ~ The End ~
    MSG
  end

  @[Override]
  def before(state : State) : State
    state.quit
    return state
  end
end
