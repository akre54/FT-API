class Tab < ActiveRecord::Base
  belongs_to :customer
  attr_protected :balance

  before_save :insert_transaction_record

  def insert_transaction_record
    Transaction.new(message: (serialze :balance.changes))
  end
end
