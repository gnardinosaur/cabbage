class TransactionsController < ApplicationController
    
    def new         #do we need this method? 
        @transaction = Transaction.new
    end

    def create
        if params[:stock][:num_of_shares].to_i * params[:stock][:share_price].to_i > @logged_in_user.balance 
            flash[:message] = "You don't have enough cash, add to your balance."

            redirect_to stocks_path
        else 
            @stock = Stock.create(price: params[:stock][:share_price], symbol: params[:stock][:symbol])
            @stock_id = @stock.id
            @transaction = Transaction.create(stock_id: @stock_id, num_of_shares: transaction_params[:num_of_shares], portfolio_id: transaction_params[:portfolio_id], share_price: transaction_params[:share_price])            
            
            #decrement user's cash balance by amount of purchase 
            @logged_in_user.balance -= @transaction.total_cost
            @logged_in_user.save 
            
            redirect_to portfolio_path(@transaction.portfolio_id)
        end
    end

    def edit 
        @transaction = Transaction.find(params[:id])
    end

    def update
        @transaction = Transaction.find(params[:id])
        @transaction.num_of_shares -= params[:transaction][:num_of_shares].to_i
        @transaction.save 
        #increment user's cash balance by amount of purchase 
        @logged_in_user.balance += params[:transaction][:num_of_shares].to_i * @transaction.current_stock_price
        @logged_in_user.save 

        redirect_to portfolio_path(@transaction.portfolio)
    end

  private
    def transaction_params
        params.require(:stock).permit(:share_price, :num_of_shares, :portfolio_id)
    end
end
