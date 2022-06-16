## CREATE TRANSACTIONS TABLE IN DATABASE

class CreateTransactions < ActiveRecord::Migration[6.0]

    def change
        create_table :transactions do |t|
            t.decimal :price
            t.string :date
            t.integer :customer_id
            t.integer :merchant_id
            # options to consider: item, datetime
        end
    end

end