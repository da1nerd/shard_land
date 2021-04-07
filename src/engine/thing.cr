# Things can exist in scenes and be interacted with.
abstract struct Thing
  abstract def name : String

  def aliases : Array(String)
    [] of String
  end

  abstract def description : String

  def names : Array(String)
    [name] + aliases
  end
end
