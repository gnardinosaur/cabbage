class Portfolio < ApplicationRecord
    belongs_to :user
    has_many :transactions
    has_many :stocks, through: :transactions 

    def portfolio_plus_minus
        @portfolio_total = 0
        
        self.transactions.each do |transaction|
            @portfolio_total += transaction.plus_minus
        end
        
        @portfolio_total
    end

end
