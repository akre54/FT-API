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
                       confirmation: true,
                       on: :create

  validates :password, presence: true,
                       length: { within: 5..255 },
                       confirmation: true,
                       unless: lambda{ |customer| customer.password.to_s.empty? },
                       on: :update


  # delegate balance to the current tab (relative to farm)
  def balance(farm_id)
    tab = self.tabs.where(farm_id: farm_id).first
    tab.balance
  end

  # fix this (scope maybe?)
  def set_balance(newAmt, farm_id)
    tab = self.tabs.where(farm_id: farm_id).first
    tab.update_column(:balance, newAmt)
  end
end
