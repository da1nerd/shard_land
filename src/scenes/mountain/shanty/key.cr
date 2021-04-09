require "annotation"
require "../../../engine/*"

struct Key < Thing
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
