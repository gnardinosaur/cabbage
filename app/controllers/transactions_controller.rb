class TransactionsController < ApplicationController
    
  SYMBOL_HASH = { 
        "Apple" => "AAPL", "Facebook" => "FB", "Alphabet Inc" => "GOOG", "Cisco Systems Inc" => "CSCO",
        "Coca-Cola Co" => "KO", "Walt Disney Co" => "DIS", "Exxon Mobil Corp" => "XOM", "Goldman Sachs Group Inc" => "GS",
        "Home Depot Inc" => "HD", "Caterpillar Inc" => "CAT", "Intel Corp" => "INTC", "Johnson & Johnson" => "JNJ", "JPMorgan Chase & Co" => "JPM",
        "Mcdonald's Corp" => "MCD", "Merck & Co Inc" => "MRK", "Microsoft Corporation" => "MSFT", "Nike" => "NKE", "Pfizer Inc" => "PFE",
        "PG&E Corporation" => "PCG",
        "Travelers Companies Inc" => "TRV","United Technologies Corporation" => "UTX","UnitedHealth Group Inc" => "UNH", "Visa Inc" => "V","Walmart Inc" => "WMT",
        "Walgreens Boots Alliance Inc" => "WBA"
    }


    def new #do we need this method? 
        @transaction = Transaction.new
    end

    def company_method
        SYMBOL_HASH.each do |k,v|
             if v == params[:stock][:symbol] 
                return k
             end
            end
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
