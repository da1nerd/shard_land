require "annotation"
require "../../../engine/*"

struct Cot < Thing
  @[Override]
  def name : String
    "cot"
  end

  @[Override]
  def description : String
    # TODO: turn the cot into a container so it can hold a money bag
    "The cot is worn and has tears along the edges. A glint of something metal catches your eye from beneath a blanket"
  end
end
