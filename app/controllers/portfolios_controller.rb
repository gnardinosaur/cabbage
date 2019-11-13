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

    def update
        @portfolio = Portfolio.find(params[:id])

        if params[:add_cash]                        #add amount to portfolio cash balance
            @portfolio.cash += params[:add_cash].to_i
            @portfolio.save
        elsif params[:withdraw_cash]                #remove amount from portfolio cash balance
            @portfolio.cash -= params[:withdraw_cash].to_i
            @portfolio.save
        end

        redirect_to portfolio_path(@portfolio)
    end


    private

    def portfolio_params
        params.require(:portfolio).permit(:title, :cash, :user_id)
    end

end
