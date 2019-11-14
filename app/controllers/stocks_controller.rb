class StocksController < ApplicationController

    def index	   
        if @logged_in_user
            @stocks = Stock.all_stocks
            @portfolio_id = params[:portfolio_id]       #gives stock index view the id of the portfolio that linked user here
            
            render :index
        else 
            redirect_to root_path
        end
    end

end
