class Farm < ActiveRecord::Base

  has_secure_password

  has_many :tabs, dependent: :destroy
  has_many :customers, through: :tabs
  has_many :transactions, through: :customers

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true,
                   uniqueness: true,
                   length: { within: 1..32 }

  validates :email, presence: true,
                    uniqueness: true,
                    length: { maximum: 255 },
                    format: { with: email_regex }

  validates :password, presence: true,
                       length: { within: 6..128 },
                       confirmation: true,
                       on: :create

  validates :password, presence: true,
                       length: { :within => 6..128 },
                       confirmation: true,
                       on: :update,
                       unless: lambda{ |farm| farm.password.to_s.empty? }
end
