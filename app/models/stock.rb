require "json"
# require 'rest-client'

class Stock < ApplicationRecord
    has_many :transactions
    has_many :portfolios, through: :transactions 

    def self.all_stocks	
        url = "https://financialmodelingprep.com/api/v3/stock/real-time-price/AAPL,FB,GOOG,CAT,CSCO,KO,DIS,XOM,GS,HD,IBM,INTC,JNJ,JPM,MCD,MRK,MSFT,NKE,PFE,PG,TRV,UTX,UNH,V,WMT,WBA"	
        response = RestClient.get(url)	
        full_hash = JSON.parse(response)	
        full_hash	
    end

    def current_price
        Stock.all_stocks["companiesPriceList"].each do |hash|
            if hash["symbol"] == self.symbol
                @current_price = hash["price"]
            end
        end
        @current_price
    end

end
