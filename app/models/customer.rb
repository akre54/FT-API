class Customer < ActiveRecord::Base
  attr_accessible :name, :email
  attr_protected :crypted_pin

  validates_presence_of :name, :crypted_pin, :salt, :email
  validates_uniqueness_of :email

  belongs_to :farm
  has_many :tabs , dependent: :destroy
  has_many :farms, through: :tabs
  has_many :transactions

  after_create :add_first_tab


  def add_first_tab
    # we know that it only belongs to one farm at the moment, so use that to create the tab
    self.tabs << Tab.create :farm_id = self.farm_ids.first
  end

=begin
  def tab_for_farm
    self.tabs.find_by_farm_id self.farm_id
  end

  def balance
    tab_for_farm(farm_id).balance
  end

  # fix this (scope maybe?)
  def balance=(newAmt)
    debugger
    tab = self.tabs.where farm_id: self.farm_id
    tab.balance = newAmt
    tab.save!
  end
=end

end
