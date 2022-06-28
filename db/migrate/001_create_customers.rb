## CREATE CUSTOMERS TABLE IN DATABASE

class CreateCustomers < ActiveRecord::Migration[7.0]
    
    def change
        create_table :customers do |t|
            t.string :first_name
            t.string :last_name
            t.integer :card_number
            t.string :username
            t.string :password
            t.date :birthdate

            # options to consider: address, member-since
        end
    end

end
