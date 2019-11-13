class StocksController < ApplicationController

    def index	   
        @stocks = Stock.all_stocks
        
    end

end
