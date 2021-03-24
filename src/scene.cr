require "./command.cr"

# Represents some scene on the screen and can process commands
abstract struct Scene
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

    # commands without a key will any raw input
    if commands.size == 1 && commands[0].key == nil
      return {commands[0], user_input}
    end

    # find the command by key
    commands.each do |c|
      if user_input == c.key
        if c.sub_commands.size > 0
          return render_commands(c.sub_commands)
        else
          return {c, user_input}
        end
      end
    end
  end

  # Execute the scene and return the next scene
  def run : Scene?
    render
    puts "---"
    selection = self.render_commands(self.commands)
    if s = selection
      command, input = selection
      command.execute(input)
      return command.scene
    else
      return self
    end
  end
end
