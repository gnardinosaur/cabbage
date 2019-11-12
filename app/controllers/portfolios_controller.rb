class PortfoliosController < ApplicationController

    def new 
        @portfolio = Portfolio.new
    end 

    def create 
        @portfolio = Portfolio.create(portfolio_params)

        redirect_to portfolio_path(@portfolio)
    end 

    def show
        @portfolio = Portfolio.find(params[:id])
    end


    private

    def portfolio_params
        params.require(:portfolio).permit(:title, :cash, :user_id)
    end

end
