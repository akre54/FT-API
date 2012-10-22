class Farm < ActiveRecord::Base
  attr_accessible :email, :farm_name
  attr_protected :pass, :salt
  validates_presence_of :email, :farm_name, :pass, :salt
  
  has_and_belongs_to_many :customers
  has_many :transactions, through: :customers

end
