class TransactionsController < ApplicationController
    def new
        @transaction = Transaction.new
    end

    def create
        byebug
        @transaction= Transaction.create(transaction_params)
        redirect_to portfolio_path(@transaction.portfolio_id)
    end

  private
    def transaction_params
        params.require(:stock).permit(:stock_id, :share_price, :num_of_shares)
    end
end
