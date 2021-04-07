require "../engine/*"

struct Canister < Thing
  def names : Array(String)
    [
      "canister",
      "flat canister",
      "round canister",
      "can",
    ]
  end

  def description : String
    "A round flat canister about the size of your hand. It looks as if it can be connected to something."
  end
end
