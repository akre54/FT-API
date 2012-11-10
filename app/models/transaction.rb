class Transaction < ActiveRecord::Base
    attr_accessible :amount

    belongs_to :farm
    belongs_to :customer
    belongs_to :venue

    #validates_numericality_of :amount, on: :create

    after_create :update_balance

    def update_balance
        self.customer.balance += self.amount
    end
end
