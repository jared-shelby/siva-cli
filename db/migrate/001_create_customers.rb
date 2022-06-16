## CREATE CUSTOMERS TABLE IN DATABASE

class CreateCustomers < ActiveRecord::Migration[5.2]
    
    def change
        create_table :customers do |t|
            t.string :first_name
            t.string :last_name
            t.integer :card_number
            # options to consider: username, password, address, birthdate, member since
        end
    end

end
