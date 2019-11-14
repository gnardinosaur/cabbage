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


    def new
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
      
        @stock = Stock.create(company_name: company_method, price: params[:stock][:share_price], symbol: params[:stock][:symbol])
        @stock_id = @stock.id

        @transaction = Transaction.create(stock_id: @stock_id, num_of_shares: transaction_params[:num_of_shares], portfolio_id: transaction_params[:portfolio_id], share_price: transaction_params[:share_price])
        redirect_to portfolio_path(@transaction.portfolio_id)
    end

  private

    def transaction_params
        params.require(:stock).permit(:share_price, :num_of_shares, :portfolio_id)
    end
end
