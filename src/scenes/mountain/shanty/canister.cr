require "../../../engine/*"

struct Canister < Thing
  @[Override]
  def name : String
    "small round canister"
  end

  @[Override]
  def aliases : Array(String)
    [
      "small canister",
      "round canister",
      "can",
      "canister",
    ]
  end

  @[Override]
  def description : String
    "A small round canister about the size of your hand. It feels heavy for it's size. It looks as if it can be connected to something."
  end

  # This is just an idea.
  # We could place action methods on things that will allow it to manipulate the state if necessary,
  # and also give a text response to the action.
  def eat(state : State) : Tuple(String, State)
    {
      "You break a tooth on the canister. You should know better than to eat metal",
      state,
    }
  end
end
