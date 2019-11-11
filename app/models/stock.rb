class Stock < ApplicationRecord
    has_many :transactions
    has_many :portfolios, through: :transactions 
end
