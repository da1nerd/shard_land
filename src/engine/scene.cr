require "./command.cr"
require "./state.cr"

# Represents a single scene in the game.
# Players navigate through the game by visiting different scenes.
# Scenes describe the environment and provide the user with different `Command` options.
abstract struct Scene
  @commands = [] of Command

  # The title of the scene
  def title : String
    self.class.name.split("::")[-1].underscore.gsub(/_/, " ").capitalize
  end

  # Returns a description of the scene
  # The scene is described when a player enters it and when they "look" around.
  abstract def description(state : State) : String

  # Adds a `Command` that can be performed in the scene
  def can(command : Command)
    @commands << command
  end

  # Render the scene description.
  #
  # > Note: There is no need to explain the scene's available options
  #  since `Command` options are automatically generated from `#commands`.
  #
  # # Example:
  #
  # ```
  # def render(state : State)
  #   describe "You are in an empty room. To your left is an open door."
  # end
  # ```
  #
  abstract def run(state : State)

  # Processes the user input.
  # This will keep running until the user enters valid input.
  private def process_input(state : State, commands : Array(Command)) : Tuple(Command, State)
    printf("> ")
    user_input = gets

    commands.each do |c|
      if c.enabled(state) && c.validate(state, user_input)
        return execute_command(state, c, user_input)
      end
    end

    puts "I don't understand."
    return process_input(state, commands)
  end

  private def display_commands(state : State, commands : Array(Command))
    commands.each do |c|
      puts c.description if c.enabled(state) && c.description
    end
  end

  # Executes the *command* and displays it's sub-commands if it has any.
  private def execute_command(state : State, command : Command, user_input : String?) : Tuple(Command, State)
    new_state = command.execute(state, user_input)
    if command.commands.size > 0
      return process_input(new_state, command.commands)
    else
      return {command, new_state}
    end
  end

  # Executed just before the player enters the scene.
  # By default this updates the `State` with the current scene
  # so we can keep track of a player's progress between saves.
  #
  # # Example:
  #
  # If we also also wanted to save a *timstamp* field on `State` we could set it here
  #
  # ```
  # protected def before(state : State) : State
  #   state = super(state)
  #   state.timstamp = Time.utc
  #   return state
  # end
  # ```
  def before(state : State) : State
    # TODO: if the scene has not been visited before, print the description.
    state.scene = self.class.name
    return state
  end

  # Executed right before the player leaves the scene
  # By default this does nothing, but you can override it to
  # include any exiting logic.
  def after(state : State) : State
    return state
  end

  # Execute the scene and return the next scene and state
  def execute(state : State) : Tuple(Scene, State)
    state = self.before(state)

    # describe the scene
    puts "### #{title} ###"
    puts description(state)
    if state.running == false
      # the game is over
      return {self.class.new, state}
    end

    # setup the scene
    run(state)
    command, state = self.process_input(state, @commands)

    # run until the scene changes or the game ends
    until command.next_scene || state.running == false
      command, state = self.process_input(state, @commands)
    end

    # proceed to the next scene
    if scene = command.next_scene
      self.after(state)
      return {scene.new, state}
    else
      # the game is over
      return {self.class.new, state}
    end
  end
end
