## CREATE TRANSACTIONS TABLE IN DATABASE

class CreateTransactions < ActiveRecord::Migration[7.0]

    def change
        create_table :transactions do |t|
            t.decimal :price
            t.string :date
            t.references :customer
            t.references :merchant
            # options to consider: item, datetime
        end
    end

end