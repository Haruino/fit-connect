class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :post_thread
  
  validates :user_id, uniqueness: {scope: :post_thread_id}
end
