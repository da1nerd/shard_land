require "./thing.cr"

# Containers are a special kind of `Thing` that can hold other `Thing`s.
struct Container < Thing
  getter contents : Array(Thing) = [] of Thing
end
