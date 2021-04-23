require "annotation"
require "../../../effect/take.cr"
require "../../../engine/*"

struct OilLamp < Thing
  include Effect::Take

  @[Override]
  def name : String
    "oil lamp"
  end

  @[Override]
  def aliases : Array(String)
    ["lamp"] of String
  end

  @[Override]
  def description : String
    <<-MSG
    The lamp is in good condition and still holds some oil.
    There is a built in igniter on the side.
    MSG
  end
end
