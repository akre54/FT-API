class Customer < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation

  has_secure_password

  has_many :tabs, dependent: :destroy
  has_many :farms, through: :tabs
  has_many :transactions, through: :tabs



  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true,
                   uniqueness: true,
                   length: { within: 1..32 }

  validates :email, presence: true,
                    uniqueness: true,
                    length: { maximum: 255 },
                    format: { with: email_regex }

  validates :password, presence: true,
                       length: { within: 5..255 },
                       on: :create

  validates_presence_of :password_confirmation, :if => :password_changed?


  # delegate balance to the current tab (relative to farm)
  def balance(farm)
    tab = self.tabs.find_by_farm_id farm
    tab.balance
  end

  # fix this (scope maybe?)
  def balance=(newAmt, farm)
    tab = self.tabs.find_by_farm_id farm
    tab.balance = newAmt
    tab.save!
  end
end
