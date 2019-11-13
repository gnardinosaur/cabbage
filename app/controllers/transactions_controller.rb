class TransactionsController < ApplicationController


    def new
        @transaction = Transaction.new
    end

    def create
        @transaction= Transaction.create(transaction_params)
        redirect_to transaction_path(@transaction.portfolio_id)
    end
private
    def transaction_params
        params.require(:stock).permit(:stock_id)
    end
end
