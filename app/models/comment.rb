class Comment < ApplicationRecord

  belongs_to :commentor, :class_name => "User", :foreign_key => "user_id"
  belongs_to :device  
  
  validates :content, presence: true, length: { maximum: 1000 }

end
