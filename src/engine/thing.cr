# Things can exist in scenes and be interacted with.
abstract struct Thing
  abstract def names : Array(String)
  abstract def description : String
end
