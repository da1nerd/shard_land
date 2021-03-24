struct Command
  getter key, description, scene

  def initialize(@key : String, @description : String, @scene : Scene?)
  end
end
