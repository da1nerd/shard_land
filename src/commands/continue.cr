# A simple command that gives the player the option to continue to
# the next scene by pressing any key.
class Commands::Continue < Command
  # Infers the scene name from the class name
  def initialize(@scene : Scene.class)
    describe "Press any key to continue..."
  end

  @[Override]
  def validate(state : State, user_input : String?) : Bool
    return true
  end
end
