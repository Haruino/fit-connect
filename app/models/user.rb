class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :members,          dependent: :destroy
  has_many :groups,           through:  :members
  has_many :post_threads,     dependent: :destroy
  has_many :comments,         dependent: :destroy
  has_many :favorites,        dependent: :destroy
  has_many :relationships,    dependent: :destroy
  has_many :records,          dependent: :destroy
  has_many :parts,          dependent: :destroy
  has_many :exercises,          dependent: :destroy
  has_many :favorites,        dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :followed
  has_one_attached :profile_image

  validates :name, presence: true, length: { maximum: 255 }
  
  def get_profile_image(size)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/user_no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'user-no-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize: "#{size}x#{size}^", gravity: "center", extent: "#{size}x#{size}").processed
  end

  def follow(user)
    relationships.create(followed_id: user.id)
  end

  def unfollow(user)
    relationships.find_by(followed_id: user.id).destroy
  end

  def following?(user)
    followings.include?(user)
  end

  # ゲストユーザー機能
  GUEST_USER_EMAIL = "guest@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
      user.introduction = "guestuser"
    end
  end

  def guest_user?
    email == GUEST_USER_EMAIL
  end

end
