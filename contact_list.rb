require_relative 'contact'

# Interfaces between a user and their contact list. Reads from and writes to standard I/O.
class ContactList

  # TODO: Implement user interaction. This should be the only file where you use `puts` and `gets`.
  def menu
  puts "Here is a list of available commands:
  \tnew - Create a new contact
  \tlist - List all ContactList
  \tshow - Show a contact
  \tsearch - Search contacts"
  end 

  def launch_app 
    case ARGV[0]
    when "list" 
      puts Contact.all
    when "new"
      puts "Full name: "
      @name = STDIN.gets.chomp
      puts "E-mail: "
      @email = STDIN.gets.chomp
      puts Contact.create(@name,@email)

    else
      self.menu
    end
  end 

end


ContactList.new.launch_app