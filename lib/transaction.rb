# TRANSACTION CLASS

class Transaction < ActiveRecord::Base
    
    # establish connections
    belongs_to :customer
    belongs_to :merchant
    
end
