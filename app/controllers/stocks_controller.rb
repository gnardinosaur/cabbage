class StocksController < ApplicationController

    def index	   
        @stocks = Stock.all_stocks
        @portfolio_id = params[:portfolio_id]       #gives index view portfolio.id of the portfolio show view it came from 
    end

end
