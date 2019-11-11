class User < ApplicationRecord
    has_many :portfolios

    def full_name
        if self.first_name && self.last_name
            self.first_name + " " + self.last_name
        else 
            self.username
        end
    end

end
