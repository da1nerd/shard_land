# Things can exist in scenes and be interacted with.
abstract struct Thing
  getter description

  def initialize(@description : String)
  end
end