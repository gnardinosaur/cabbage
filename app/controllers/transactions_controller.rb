class TransactionsController < ApplicationController
    def new
        @transaction = Transaction.new
    end

    def create
        @stock = Stock.create(price: params[:stock][:share_price], symbol: params[:stock][:symbol])
        @stock_id = @stock.id
        @transaction = Transaction.create(stock_id: @stock_id, num_of_shares: transaction_params[:num_of_shares], portfolio_id: transaction_params[:portfolio_id], share_price: transaction_params[:share_price])

        redirect_to portfolio_path(@transaction.portfolio_id)
    end

  private
    def transaction_params
        params.require(:stock).permit(:share_price, :num_of_shares, :portfolio_id)
    end
end
