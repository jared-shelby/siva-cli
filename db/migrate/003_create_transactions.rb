## CREATE TRANSACTIONS TABLE IN DATABASE

class CreateTransactions < ActiveRecord::Migration[5.2]

    def change
        # store price, date, customer, merchant
        create_table :transactions do |t|
            t.decimal :price
            t.string :date
            t.integer :customer_id
            t.integer :merchant_id
            # consider adding later: item
        end
    end

end