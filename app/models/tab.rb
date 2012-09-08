class Tab < ActiveRecord::Base
  belongs_to :customer
  attr_protected :balance
  validates_numericality_of :balance

  before_save :insert_transaction_record

  def insert_transaction_record
    #Transaction.create(message: "new balance is #{:balance}, changes are #{:balance.changes}")
  end
end
