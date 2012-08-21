class Customer < ActiveRecord::Base
  attr_accessible :name, :email

  attr_protected :crypted_pin
  validates_presence_of :name, :crypted_pin, :email
  validates_uniqueness_of :email

  before_save :setup_x_tab

  has_many :tabs, :foreign_key => "user_id"
  has_many :transactions
  has_and_belongs_to_many :farms

  def self.setup_x_tab
    self.tabs.create(farm: @current_farm)
  end

  def self.balance
    self.tabs.find_by_farm(@current_farm).balance
  end

end
