class Customer < ActiveRecord::Base
  attr_accessible :name, :email
  attr_protected :crypted_pin

  validates_presence_of :name, :crypted_pin, :salt, :email
  validates_uniqueness_of :email

  has_and_belongs_to_many :farms
  has_many :tabs, dependent: :destroy
  has_many :transactions

  def current_tab
    self.tabs.find_or_create_by_farm_id 2
  end

  def balance
    current_tab.balance
  end

  # fix this
  def balance=(newAmt)
    tab = self.tabs.find_or_create_by_farm_id 2
    tab.balance = newAmt
    tab.save!
  end

end
