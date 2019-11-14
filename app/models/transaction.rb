class Transaction < ApplicationRecord
    belongs_to :portfolio
    belongs_to :stock

    def total_cost
        total_cost = self.share_price * self.num_of_shares
    end

    def plus_minus
        if current_value > total_cost
            current_value - total_cost
        else
            - total_cost + current_value #for some reason this was returning a positive value, so this math turns it negative 
        end
    end

    def current_value                    #gets current stock price from API
        current_value = 0                                        
        Stock.all_stocks["companiesPriceList"].each do |hash|
            if hash["symbol"] == self.stock.symbol
                current_value += hash["price"]
            end
        end
        current_value * self.num_of_shares
    end 

end