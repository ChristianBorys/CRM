require("./contacts.rb")
require("./Database.rb")

class CRM

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
    print "Enter a Note: "
    note = gets.downcase.chomp
    contact = Contact.new(first_name, last_name, email, note)
    Database.add_contact(contact)
    p Database.contacts

    main_menu

  end  

  def modify_existing_contact
    puts "\e[H\e[2J"
    puts "Please type your ID"
    contact_to_be_modified = gets.chomp.to_i
    if contact_to_be_modified == ""
      puts "Unknown ID"
      modify_existing_contact
    else 
      puts "Please confirm (y/n)"
      confirmation_selection = gets.chomp.downcase
    end 

  end

  def delete_a_contact

  end

  def display_all_the_contacts

  end

  def display_an_attribute

  end

  def exit

  end

end

a_crm_app = CRM.new
a_crm_app.main_menu


