## MERCHANT CLASS

class Merchant < ActiveRecord::Base
    
    # establish connections
    has_many :transactions
    has_many :customers, through: :transactions

end
