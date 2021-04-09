require "annotation"
require "../../../engine/*"

struct Letter < Thing
  @[Override]
  def name : String
    "letter"
  end

  @[Override]
  def description : String
    <<-MSG
    ~~
    November 18, It's been 3 years since the blackness began. Some say it is because the mines in the south ran too deep and awakened an ancient evil.
    But I know better.
    I've found the first shard, high up in the western mountain. Yes it's real. I now know there are 3 more.
    If we can collect the rest we can end the blackness and stop "him" from carrying out his plans.
    ~~
    MSG
  end
end
