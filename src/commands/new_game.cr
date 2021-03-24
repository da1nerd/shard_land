require "../command.cr"

class NewGame < Command
  def execute(user_input : String)
    puts "Your name is #{user_input}"
  end
end
