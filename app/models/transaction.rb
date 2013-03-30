class Transaction < ActiveRecord::Base
  attr_accessible :amount

  belongs_to :tab
  belongs_to :venue
  delegate :farm, to: :tab
  delegate :customer, to: :tab

  validates :amount, presence: true,
                     numericality: { greater_than_or_equal_to: 0 }

  validates :transaction_type, presence: true,
                               inclusion: { in: %w(deposit withdrawal),
                               message: "Transaction type must be either withdrawal or deposit" }

  validate do |t|
    if t.transaction_type == 'withdrawal' && t.customer.balance(t.farm) < t.amount
      errors.add(:amount, 'cannot be more than customer balance')
    end
  end

  after_create :update_balance

  def update_balance
    bal = self.customer.balance self.farm
    if self.transaction_type == 'deposit'
      self.customer.set_balance(self.farm, bal + self.amount)
    else
      self.customer.set_balance(self.farm, bal - self.amount)
    end
  end
end
