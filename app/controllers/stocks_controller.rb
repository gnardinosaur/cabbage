class StocksController < ApplicationController

    def show 
        @stock = Stock.find(params[:id])
    end

    def end
        
    end

end
