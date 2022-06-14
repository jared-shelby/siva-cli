## CREATE MERCHANTS TABLE IN DATABASE

class CreateMerchants < ActiveRecord::Migration[5.2]
    
    def change
        # store name
        create_table :merchants do |t|
            t.string :name
            # consider adding later: location, category
        end
    end

end
