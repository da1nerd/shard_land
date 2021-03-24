require "yaml"

struct Character
  include YAML::Serializable

  @[YAML::Field(key: "name")]
  property name : String

  def initialize(@name)
  end
end
