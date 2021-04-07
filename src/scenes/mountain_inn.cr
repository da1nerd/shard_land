require "./base_scene.cr"
require "./mountain_inn/*"
require "annotation"

struct Scenes::MountainInn < Scenes::BaseScene
  def description(state : State) : String
    return <<-MSG
    You walk into a drafty room with a fire roaring in the corner.
    The Inn keeper sits behind a desk, and a flight of stairs leading upstairs is to the left of him.
    The inn keeper looks at you with a quizickle expression as you walk into the inn.
    "Where are you here from stranger? And how can I help you?"
    "I don't know. I woke up on the top of the mountain." You reply
    "Ah..." the Inn keeper replies knowingly. "The blackness. It takes people where it will, and usually takes there memories as well. What's  your name son?"
    "I'm..." you stop, you don't actualy remember. In fact you don't remember anything about your past.
    "No worries son" Says the Inn keeper in response to your look of shock.
    "It'll be a new life for you, a new start. I have two rooms available. Would you like to face the mountain or the valley?"
    MSG
  end

  @[Override]
  def render(state : State)
    goto Scenes::MountainSideRoom, "mountain"
    goto Scenes::ValleySideRoom, "valley"
  end
end
