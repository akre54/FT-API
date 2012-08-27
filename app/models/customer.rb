class Customer < ActiveRecord::Base
  attr_accessible :name, :email

  attr_protected :crypted_pin
  validates_presence_of :name, :crypted_pin, :salt, :email
  validates_uniqueness_of :email

  after_save :setup_x_tab

  has_many :tabs, :foreign_key => "user_id"
  has_many :transactions
  has_and_belongs_to_many :farms

  def self.balance
    self.tabs.find_by_farm(@current_farm).balance
  end

  private
    def setup_x_tab
      self.tabs.create(farm_id: @current_farm.id)
    end

end
