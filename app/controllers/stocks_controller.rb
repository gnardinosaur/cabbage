class StocksController < ApplicationController

def index
    # byebug
    @stocks = Stock.all_stocks
    # byebug
end

end
