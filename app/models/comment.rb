class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post_thread
  
  validates :comment, presence: true
end
