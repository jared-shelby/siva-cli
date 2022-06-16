## CUSTOMER CLASS

class Customer < ActiveRecord::Base

    # establish connections
    has_many :transactions
    has_many :merchants, through: :transactions

    # get list of transactions made by customer
    def transactions
        Transaction.all.where(customer: self)
    end

    # get hash of merchants visited by customer
    def merchants
        self.transactions.collect { |transaction| transaction.merchant.name }.tally
    end

end
