class Farm < ActiveRecord::Base
  attr_accessible :email, :farm_name
  validates_presence_of :email, :farm_name, :pass, :salt
  
  has_many :customers
end
