class Tab < ActiveRecord::Base
  belongs_to :customer
  belongs_to :farm
  attr_protected :balance
  validates_numericality_of :balance, greater_than_or_equal_to: 0
end
