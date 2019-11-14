class User < ApplicationRecord
    has_many :portfolios
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :username, presence: true
    validates :username, uniqueness: true

    has_secure_password


    def full_name                              
        self.first_name + " " + self.last_name
    end

    def all_portfolios_balance  #adds up all instances of portfolio balances for this user
        @balance = 0
        self.portfolios.each do |portfolio|
            @balance += portfolio.portfolio_balance
        end
        @balance
    end

end
