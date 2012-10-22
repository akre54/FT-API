class Transaction < ActiveRecord::Base
    attr_accessible :amount

    belongs_to :farm
    belongs_to :customer
    belongs_to :venue

    after_save :update_balance

    def update_balance
        @customer.balance += @amount
    end
end
