require "annotation"
require "../../../effect/take.cr"
require "../../../engine/*"

struct Key < Thing
  include Effect::Take

  @[Override]
  def name : String
    "key"
  end

  @[Override]
  def description : String
    <<-MSG
    There is nothing unusual about the key.
    MSG
  end
end
