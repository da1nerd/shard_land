# A simple command simply navigates to a scene
# after the user provides any input.
class Commands::Noop < Command
  def initialize(@scene : Scene.class)
  end

  @[Override]
  def validate(state : State, user_input : String?) : Bool
    return true
  end
end
