class Database

	attr_accessor :first_name, :last_name, :email, :note, :id

	@contacts = []
	@id = 5

	def self.add_contact(contact)
		contact.id = @id
		@contacts << contact
		@id += 5

	end	

	def self.contacts
		@contacts

	end
	
	def self.modify_first_name(first_name, contact_to_be_modified)
		#puts I'm in modify email method
		contacts.each {|x| x.first_name = first_name if x.id == contact_to_be_modified}
	end	

	def self.modify_last_name(last_name, contact_to_be_modified)

		contacts.each {|x| x.last_name = last_name if x.id == contact_to_be_modified}
	end	

@contacts.each {|x| x.id = new_id if x.id == contact_to_be_modified}
	end

end


