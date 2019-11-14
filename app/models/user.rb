class User < ApplicationRecord
    has_many :portfolios
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :username, uniqueness: true
    has_secure_password


    def full_name                              
        self.first_name + " " + self.last_name
    end

end
