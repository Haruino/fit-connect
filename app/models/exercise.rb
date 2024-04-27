class Exercise < ApplicationRecord
  has_many :records, dependent: :destroy
  
  validates :name, presence: true, length: { maximum: 20 }
end
