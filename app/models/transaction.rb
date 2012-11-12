class Transaction < ActiveRecord::Base
    attr_accessible :amount

    belongs_to :farm
    belongs_to :customer
    belongs_to :venue

    validates_presence_of :amount, :transaction_type, :farm_id, :customer_id
    validates_numericality_of :amount, greater_than_or_equal_to: 0
    validates_inclusion_of :transaction_type, in: %w(deposit withdrawal)
    validate :negative_validator

    after_create :update_balance

    def update_balance
        if self.transaction_type == 'deposit'
            self.customer.balance += self.amount
        else
            self.customer.balance -= self.amount
        end
    end

    def negative_validator
        if transaction_type == 'withdrawal' and amount > self.customer.balance
            errors.add(:amount, 'cannot be more than customer balance')
        end
    end
end
