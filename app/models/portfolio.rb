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

    def portfolio_balance   #adds up num_of_shares * live current price from API for each stock in the portfolio instance 
        @balance = 0
        self.transactions.each do |transaction|
            Stock.all_stocks["companiesPriceList"].each do |hash|
                if hash["symbol"] == transaction.stock.symbol
                    @balance += hash["price"] * transaction.num_of_shares
                end
            end 
        end
        @balance 
    end

end
