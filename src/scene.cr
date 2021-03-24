require "./commands/command.cr"
require "./state.cr"

# Represents some scene on the screen and can process commands
abstract struct Scene
  def initialize(@state : State)
  end

  def initialize
    @state = State.new
  end

  # Render the scene information
  abstract def render

  # Returns an ordered list of commands available to the user.
  abstract def commands : Array(Command)

  # Renders the list of commands and returns the chosen command
  private def render_commands(commands : Array(Command)) : Tuple(Command, String?)?
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
      until c.validate(@state, user_input)
        puts c.description
        user_input = gets
      end
      return render_sub_commands(c, user_input)
    end

    # find the command by key
    commands.each do |c|
      if user_input == c.key
        return render_sub_commands(c, user_input)
      end
    end

    # invalid option. try again
    puts %{Invalid option "#{user_input}". Please choose an option below:}
    return render_commands(commands)
  end

  # Renders a command's sub-commands if it has any
  private def render_sub_commands(command : Command, user_input : String?)
    if command.sub_commands.size > 0
      return render_commands(command.sub_commands)
    else
      return {command, user_input}
    end
  end

  # Execute the scene and return the next scene
  def run : Scene?
    render
    puts "---"
    selected_command = self.render_commands(self.commands)
    if s = selected_command
      command, input = selected_command
      state = command.execute(@state, input)
      if scene = command.scene
        return scene.new(state)
      end
    else
      return self
    end
  end
end
