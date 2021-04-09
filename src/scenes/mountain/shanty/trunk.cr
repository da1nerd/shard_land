require "annotation"
require "../../../engine/*"

struct Trunk < Thing
  @[Override]
  def name : String
    "trunk"
  end

  @[Override]
  def description : String
    # TODO: allow the trunk to be unlocked so you can get a coat
    "The trunk is locked"
  end
end
