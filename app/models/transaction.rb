class Transaction < ApplicationRecord
    belongs_to :portfolio
    belongs_to :stock

    def total_cost
        total_cost = self.share_price * self.num_of_shares
    end

    def plus_minus
        if current_stock_price > total_cost
            current_stock_price - total_cost
        else
            current_stock_price - total_cost
        end
    end

    def current_stock_price                    #gets current stock price from API
        current_stock_price = 0                                        
        Stock.all_stocks["companiesPriceList"].each do |hash|
            if hash["symbol"] == self.stock.symbol
                current_stock_price += hash["price"]
            end
        end
        current_stock_price * self.num_of_shares
    end 

end