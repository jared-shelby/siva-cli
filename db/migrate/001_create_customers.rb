## CREATE CUSTOMERS TABLE IN DATABASE

class CreateCustomers < ActiveRecord::Migration[5.2]
    
    def change
        # store name, unique card number
        create_table :customers do |t|
            t.string :first_name
            t.string :last_name
            t.integer :card_number
            # consider adding later: username, password, address, dob, active?
        end
    end

end
