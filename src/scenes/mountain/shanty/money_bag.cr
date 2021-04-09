require "annotation"
require "../../../engine/*"

struct MoneyBag < Thing
  @[Override]
  def name : String
    "money bag"
  end

  @[Override]
  def aliases : Array(String)
    ["money", "bag"] of String
  end

  @[Override]
  def description : String
    "The small bag contains 24 silver coins."
  end
end
