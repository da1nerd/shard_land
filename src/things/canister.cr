require "../engine/*"

struct Canister < Thing
  @[Override]
  def name : String
    "round flat canister"
  end

  @[Override]
  def aliases : Array(String)
    [
      "flat canister",
      "round canister",
      "can",
    ]
  end

  @[Override]
  def description : String
    "A round flat canister about the size of your hand. It looks as if it can be connected to something."
  end
end
