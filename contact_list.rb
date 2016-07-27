require_relative 'contact_2'

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
      counter = 0
      Contact.all.each do |contact| 
      puts "#{counter+1}: #{Contact.all[counter].name} -- #{Contact.all[counter].email}"
      counter += 1 
      end 
    when "new"
      puts "Full name: "
      name = STDIN.gets.chomp
      puts "E-mail: "
      email = STDIN.gets.chomp
      puts Contact.create(name,email)
      puts "Contact was created successfully."
    when "show"
      id = ARGV[1]
      if Contact.find(id) == nil 
        puts "Sorry, contact with ID number #{id} not found."
      else
       puts "#{id}: #{Contact.find(id).name} -- #{Contact.find(id).email}"
     end
    when "search"
      search_term = ARGV[1] 
      if Contact.search(search_term) == []
        puts "Sorry, no contact found."
      else 
        # Contact.search(search_term)
        Contact.search(search_term).each do |contact|
        puts "#{contact.id}: #{contact.name} -- #{contact.email}"
        end
      end 
    else
      self.menu
    end
  end 

end



ContactList.new.launch_app