class Part < ApplicationRecord
  has_many :records, dependent: :destroy
  
  validates :name, presence: true, length: { maximum: 10 }
end
