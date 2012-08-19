class Farm < ActiveRecord::Base
  validates_presence_of :email, :name
  
  has_many :customers
end
