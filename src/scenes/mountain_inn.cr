require "./base_scene.cr"

struct Scenes::MountainInn < Scenes::BaseScene
  describe <<-MSG
  The inn keeper looks at you with a quizickle expression as you walk into the inn.
  "Where are you here from stranger? And how can I help you?"
  "The blackness brought me here" Chris replies.
  "I need to rest for a night and be on my way in the morning."
  "The blackness eh?" replies the inn keeper.
  "you must be a lucky one. Most people have to be carried away on a donkey
  and rested real good for a week before they can walk again. 
  That is if they recover at all"
  "Yeah. Lucky" Chris replies.
  "You'd better be more careful" the inn keeper continues.
  People don't maintain a... natural state of mind after experiencing
  the blackness more than a couple of times.
  There's a place for those you know, sector 0.
  It's better for society that way, safer.
  I've only known one fella who survived the blackness more than a few times.
  Well... he's in sector 0 now. Got cocky.

  Thanks for the advice. I'll be careful.

  MSG
  # TODO: put conversation with in keeper into an action
end