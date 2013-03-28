class Farm < ActiveRecord::Base
  attr_accessible :farm_name, :email
  attr_accessor :password
  before_save :encrypt_password

  has_many :tabs, dependent: :destroy
  has_many :customers, through: :tabs
  has_many :transactions, through: :customers

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :farm_name, presence: true,
                   uniqueness: true,
                   length: { within: 1..32 }

  validates :email, presence: true,
                    uniqueness: true,
                    length: { maximum: 255 },
                    format: { with: email_regex }

  validates :password, presence: true,
                       length: { within: 5..255 }

  validates_presence_of :password_confirmation, :if => :password_changed?

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
