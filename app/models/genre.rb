class Genre < ApplicationRecord
  has_many :groups, dependent: :destroy
  
  validates :name, uniqueness: true, presence: true, length: { maximum: 255 }
end
