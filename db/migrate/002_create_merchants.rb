## CREATE MERCHANTS TABLE IN DATABASE

class CreateMerchants < ActiveRecord::Migration[6.0]
    
    def change
        create_table :merchants do |t|
            t.string :name
            # options to consider: location, category, established
        end
    end

end
