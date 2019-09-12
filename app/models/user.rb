class User < ApplicationRecord

  has_secure_password

  has_many :devices
  has_many :comments
  has_many :commented_devices, :through => :comments, :source => :device

  validates :username, presence: true, uniqueness: true, length: { minimum: 4 }
  validates :email, presence: true, uniqueness: true

  def self.find_or_create_by_omniauth(auth_hash)
    self.where(email: auth_hash["info"]["email"]).first_or_create do |u|
      u.username = auth_hash.info.name
      u.password = SecureRandom.hex
    end
  end 

end
