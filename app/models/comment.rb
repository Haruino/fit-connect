class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post_thread,  dependent: :destroy
  
  validates :comment, presence: true
end
