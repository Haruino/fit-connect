class PostThread < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :comments,   dependent: :destroy
  has_many :favorites,  dependent: :destroy

  validates :title, presence: true, length: { maximum: 255 }
  validates :body,  presence: true

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
