require 'csv'

# Represents a person in an address book.
# The ContactList class will work with Contact objects instead of interacting with the CSV file directly
class Contact

  attr_accessor :id, :name, :email
  
  # Creates a new contact object
  # @param name [String] The contact's name
  # @param email [String] The contact's email address
  def initialize(id, name, email)
    @id = id
    @name = name
    @email = email
    # TODO: Assign parameter values to instance variables.
  end

  # Provides functionality for managing contacts in the csv file.
  class << self

    # Opens 'contacts.csv' and creates a Contact object for each line in the file (aka each contact).
    # @return [Array<Contact>] Array of Contact objects
    def all
      contact_list = []
      CSV.foreach('contacts.csv')do |contact|
        new_contact = self.new(contact[0], contact[1], contact[2])
        contact_list << new_contact
      end 
      contact_list
    end

    # Creates a new contact, adding it to the csv file, returning the new contact.
    # @param name [String] the new contact's name
    # @param email [String] the contact's email
    def create(name, email)
      contact_list_size = CSV.read('contacts.csv').count
      @contact_id = contact_list_size + 1
      contacts_file = File.open('contacts.csv', 'a')
      new_contact = self.new(@contact_id,name, email)
      contacts_file.puts "#{@contact_id},#{new_contact.name},#{new_contact.email}"
      # TODO: Instantiate a Contact, add its data to the 'contacts.csv' file, and return it.
    end
    
    # Find the Contact in the 'contacts.csv' file with the matching id.
    # @param id [Integer] the contact id
    # @return [Contact, nil] the contact with the specified id. If no contact has the id, returns nil.
    def find(id)
      CSV.foreach('contacts.csv') do |contact|
        if id == contact[0]
          matching_contact = self.new(contact[0], contact[1], contact[2])
          return matching_contact 
        end

      end 
      # TODO: Find the Contact in the 'contacts.csv' file with the matching id.
    end
    
    # Search for contacts by either name or email.
    # @param term [String] the name fragment or email fragment to search for
    # @return [Array<Contact>] Array of Contact objects.
    def search(term)
      matching_contacts = []
      CSV.foreach('contacts.csv') do |contact|
        if contact.to_s.include?(term)
          matching_contact = self.new(contact[0], contact[1],contact[2])
          matching_contacts << matching_contact
        end   
      end 
      matching_contacts
      # TODO: Select the Contact instances from the 'contacts.csv' file whose name or email attributes contain the search term.
    end

  end

end