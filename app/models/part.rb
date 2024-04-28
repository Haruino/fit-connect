class Part < ApplicationRecord
  belongs_to  :user
  has_many    :records, dependent: :destroy
  
  validates :name, presence: true, length: { maximum: 10 }
end
