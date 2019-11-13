class StocksController < ApplicationController
  
  def index
    @stocks = Stock.all_stocks
  end
  
  def show 
    @stock = Stock.find(params[:id])
  end

end
