require "json"
# require 'rest-client'

class Stock < ApplicationRecord
    has_many :transactions
    has_many :portfolios, through: :transactions 

    def self.all_stocks	
        url = "https://financialmodelingprep.com/api/v3/stock/real-time-price/AAPL,FB,GOOG,CAT,CSCO,KO,DIS,DOWN,XOM,GS,HD,IBM,INTC,JNJ,JPM,MCD,MRK,MSFT,NKE,PFE,PG,TRV,UTX,UNH,VR,V,WMT,WBA"	
        response = RestClient.get(url)	
        full_hash = JSON.parse(response)	
        full_hash	
    end

end
