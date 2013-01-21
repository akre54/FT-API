class Transaction < ActiveRecord::Base
  attr_accessible :amount

  belongs_to :tab
  belongs_to :venue
  delegate :farm, to: :tab
  delegate :customer, to: :tab

  validates_presence_of :amount, :transaction_type
  validates_numericality_of :amount, greater_than_or_equal_to: 0
  validates_inclusion_of :transaction_type, in: %w(deposit withdrawal)
  validate :negative_validator

  after_create :update_balance

  def update_balance
    bal = self.customer.balance
    if self.transaction_type == 'deposit'
      self.customer.set_balance(bal + self.amount, self.farm)
    else
      self.customer.set_balance(bal - self.amount, self.farm)
    end
  end

  def negative_validator
    if transaction_type == 'withdrawal' and amount > self.tab.balance
      errors.add(:amount, 'cannot be more than customer balance')
    end
  end
end
