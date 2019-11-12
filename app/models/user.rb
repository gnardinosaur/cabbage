class User < ApplicationRecord
    has_many :portfolios

    def full_name                               #for seeds, if no first/last_name use username on user show page 
        if self.first_name && self.last_name
            self.first_name + " " + self.last_name
        else 
            self.username
        end
    end

end
