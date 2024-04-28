class Group < ApplicationRecord
  belongs_to :genre
  has_many :members,          dependent: :destroy
  has_many :post_threads,     dependent: :destroy
  belongs_to :owner,          class_name: 'User'
  has_many :users,            through: :members

  has_one_attached :group_image

  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true

  def is_owned_by?(user)
    owner.id == user.id
  end

  def includesUser?(user)
    members.exists?(user_id: user.id)
  end

  def get_group_image(size)
    unless group_image.attached?
      file_path = Rails.root.join('app/assets/images/group_no_image.png')
      group_image.attach(io: File.open(file_path), filename: 'group-no-image.png', content_type: 'image/png')
    end
    group_image.variant(resize: "#{size}x#{size}^", gravity: "center", extent: "#{size}x#{size}").processed
  end
end
