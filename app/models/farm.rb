class Farm < ActiveRecord::Base
  attr_accessible :farm_name, :email, :password, :password_confirmation

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
                       length: { within: 5..255 },
                       confirmation: true

  validates_presence_of :password_confirmation, :if => :password_changed?

end
