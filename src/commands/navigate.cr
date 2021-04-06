# Navigates to a scene if the player uses the "go to" command.
class Commands::Navigate < Command
  @scene_name : String

  # Infers the scene name from the class name
  def initialize(scene : Scene.class)
    @scene = scene
    @scene_name = scene.name.split("::")[-1]
  end

  def initialize(@scene : Scene.class, @scene_name)
  end

  @[Override]
  def validate(state : State, user_input : String?) : Bool
    return user_input == "go to #{@scene_name}" || user_input == @scene_name
  end
end
