class Farm < ActiveRecord::Base
  attr_accessible :email, :farm_name
  attr_protected :pass, :salt
  validates_presence_of :email, :farm_name, :pass, :salt

  before_save { |farm| farm.email = email.downcase }
  
  has_many :tabs, dependent: :destroy
  has_many :customers, through: :tabs
  has_many :transactions, through: :customers

end
