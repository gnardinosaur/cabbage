class Transaction < ApplicationRecord
    belongs_to :portfolio
    belongs_to :stock

    def current_total                                   
        @current_total = stock.price * self.num_of_shares
    end

    def purchased_total
        @purchased_total = self.share_price * self.num_of_shares
    end

    def plus_minus
        if current_total > purchased_total
            current_total - purchased_total
        else
            current_total - purchased_total
        end
    end

end
