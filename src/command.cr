class Command
  @key : String?
  @sub_commands : Array(Command)

  getter key, description, scene, sub_commands

  def initialize(@key : String, @description : String, @scene : Scene?)
    @sub_commands = [] of Command
  end

  def initialize(@key : String, @description : String, command : Command)
    @sub_commands = [command]
  end

  def initialize(@key : String, @description : String, @sub_commands : Array(Command))
  end

  def initialize(@description : String, @scene : Scene?)
    @sub_commands = [] of Command
  end

  # This can be overridden to perform some logic when the command is chosen
  def execute(user_input : String?)
    # TODO: this should take in and return some state
  end
end
