## CUSTOMER CLASS

class Customer < ActiveRecord::Base

    # establish connections
    has_many :transactions
    has_many :merchants, through: :transactions

end
