require("./contacts.rb")
require("./Database.rb")

class CRM

  def initialize(name)
    @name = name
  end 

  def main_menu
    print_main_menu
    user_selected = gets.chomp.to_i
    call_option(user_selected)
  end

  def print_main_menu
    puts "[1] Add a new contact"
    puts "[2] Modify an existing contact"
    puts "[3] Delete a contact"
    puts "[4] Display all the contacts"
    puts "[5] Display an attribute" 
    puts "[6] Exit"
    puts "Enter a number: "
  end

  def call_option(user_selected)
    add_new_contact if user_selected == 1
    modify_existing_contact if user_selected ==2
    delete_a_contact if user_selected == 3
    display_all_the_contacts if user_selected == 4
    display_an_attribute if user_selected == 5
    exit if user_selected == 6
  end 
  
  def add_new_contact
    puts "\e[H\e[2J"
    print "Enter First Name: "
    first_name = gets.downcase.capitalize.chomp
    print "Enter Last Name: "
    last_name = gets.downcase.capitalize.chomp
    print "Enter Email Address: "
    email = gets.downcase.chomp
    print "Enter a Note:"
    note = gets.downcase.chomp
    contact = Contact.new(first_name, last_name, email, note)
    Database.add_contact(contact)
    p Database.contacts

    main_menu

  end  

  def modify_existing_contact
    puts "\e[H\e[2J"
    puts "Please type the ID to be modified"
    contact_to_be_modified = gets.chomp.to_i
    if contact_to_be_modified == ""
      puts "Unknown ID"
      modify_existing_contact
    else 
      puts "Please confirm (y/n)"
      confirmation_selection = gets.chomp.downcase
    end 

    if confirmation_selection == "y"
      puts "What would you like to change?"
      puts "[1] first name"
      puts "[2] last name"
      puts "[3] email address"
      puts "[4] note"
      puts "[5] id "
      attribute_selection_input = gets.chomp
    else 
      main_menu
    end

      case attribute_selection_input
        when "1" then  
                puts "Please change the first name"
                first_name = gets.chomp
                Database.modify_first_name(first_name, contact_to_be_modified)
                main_menu

        when "2" then
                puts "Please change the second name"
                last_name = gets.chomp
                Database.modify_last_name(last_name, contact_to_be_modified)
                main_menu

        when "3" then  
                puts "Please change the email address"
                email = gets.chomp
                Database.modify_email(email, contact_to_be_modified)

        when "4" then
                puts "Please change the note"
                note = gets.chomp
                Database.modify_note(note, contact_to_be_modified)
        when "5" then 
                puts "Please change the ID"
                new_id = gets.chomp
                Database.modify_id(new_id, contact_to_be_modified)          
        else 
            puts "Whachu talkin bout Willis, we're headin back to the start"
            main_menu
      end
  end

  def delete_a_contact
    puts "Are you sure you would like to delete the contact?"
    delete_contact_verification = gets.chomp

    if delete_contact_verification == "y"
      puts "Enter the ID"
      delete_ID = gets.chomp.to_i
      Database.delete_a_contact(delete_ID)
      puts "ID deleted"
      main_menu
    else
      main_menu
    end 
   end
    
  def display_all_the_contacts
      all_contacts = Database.display_all_the_contacts
      all_contacts
      main_menu
  end

  def display_an_attribute
    puts "What would you like to see?"
    puts "[1] name"
    puts "[2] email"
    puts "[3] note"
    puts "[4] id" 

    attribute_to_be_displayed = gets.chomp

    case attribute_to_be_displayed
      when "1" then
                  all_name = Database.display_all_name
                  all_name
                  main_menu
      when "2" then
                  all_email = Database.display_all_email
                  all_email
                  main_menu
      when "3" then
                  all_note = Database.display_all_note
                  all_note
                  main_menu               
      when "4" then
                  all_id = Database.display_all_id
                  all_id
                  main_menu                            
      else main_menu

    end
  end

  def exit
    puts "You are now exiting the program"
    abort
  end

end

a_crm_app = CRM.new("crm")
a_crm_app.main_menu


