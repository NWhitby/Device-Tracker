class Device < ApplicationRecord

  belongs_to :user
  has_many :comments, :dependent => :destroy
  has_many :commentors, :class_name => "User", through: :comments
  
end
