require "./command.cr"

# Represents some scene on the screen and can process commands
abstract struct Scene
  # Render the scene information
  abstract def render

  # Returns an ordered list of commands available to the user.
  abstract def commands : Array(Command)

  # Execute the scene and return the next scene
  def run : Scene?
    render
    puts "---"
    self.commands.each do |c|
      puts "#{c.key} - #{c.description}"
    end
    user_input = gets
    self.commands.each do |c|
      if user_input == c.key
        return c.scene
      end
    end
    return self
  end
end
