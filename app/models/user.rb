class User < ApplicationRecord

  has_secure_password

  has_many :devices
  has_many :comments
  has_many :commented_devices, :through => :comments, :source => :devices

  validates :username, presence: true, uniqueness: true, length: { minimum: 6 }
  validates :email, presence: true, uniqueness: true

end
