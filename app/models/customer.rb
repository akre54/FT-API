class Customer < ActiveRecord::Base
  attr_accessible :name, :email
  attr_protected :crypted_pin

  validates_presence_of :name, :crypted_pin, :salt, :email
  validates_uniqueness_of :email

  belongs_to :farm
  has_many :tabs , dependent: :destroy
  has_many :farms, through: :tabs
  has_many :transactions

  def balance
    tab = self.tabs.find_by_farm_id 2
    tab.balance
  end

  # fix this (scope maybe?)
  def balance=(newAmt)
    tab = self.tabs.find_by_farm_id 2
    tab.balance = newAmt
    tab.save!
  end
end
