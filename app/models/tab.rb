class Tab < ActiveRecord::Base
  attr_protected :balance

  belongs_to :customer, :inverse_of => :tab
  belongs_to :farm
  has_many :transactions

  validates_numericality_of :balance, greater_than_or_equal_to: 0
  validates_uniqueness_of :customer_id, scope: :farm_id
end
