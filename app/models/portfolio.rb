class Portfolio < ApplicationRecord
    belongs_to :user
    has_many :transactions
    has_many :stocks, through: :transactions 
end
