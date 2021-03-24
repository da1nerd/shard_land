require "./commands/command.cr"
require "./state.cr"

# Represents some scene on the screen and can process commands
abstract struct Scene
  # Render the scene information
  abstract def render

  # Returns an ordered list of commands available to the user.
  abstract def commands(state : State) : Array(Command)

  # Renders the list of commands and returns the chosen command
  private def render_commands(state : State, commands : Array(Command)) : Tuple(Command, State)?
    commands.each do |c|
      if c.key
        puts "#{c.key} - #{c.description}"
      else
        puts c.description
      end
    end
    user_input = gets

    # commands without a key will accept any raw input
    if commands.size == 1 && commands[0].key == nil
      c = commands[0]
      # validate raw input
      until c.validate(state, user_input)
        puts c.description
        user_input = gets
      end
      return execute_command(state, c, user_input)
    end

    # find the command by key
    commands.each do |c|
      if user_input == c.key
        return execute_command(state, c, user_input)
      end
    end

    # invalid option. try again
    puts %{Invalid option "#{user_input}". Please choose an option below:}
    return render_commands(state, commands)
  end

  # Renders a command's sub-commands if it has any
  private def execute_command(state : State, command : Command, user_input : String?)
    new_state = command.execute(state, user_input)
    if command.sub_commands.size > 0
      return render_commands(new_state, command.sub_commands)
    else
      return {command, new_state}
    end
  end

  # Persists the scene information to the state
  # so we can keep track of a user's progress
  # between saves
  def persist_scene_state(state : State) : State
    state.scene = self.class.name
    return state
  end

  # Execute the scene and return the next scene and state
  def run(state : State) : Tuple(Scene, State)?
    state = self.persist_scene_state(state)
    render
    selected_command = self.render_commands(state, self.commands(state))
    if s = selected_command
      command, new_state = selected_command
      if scene = command.scene
        return {scene.new, new_state}
      end
    else
      return {self, state}
    end
  end
end
