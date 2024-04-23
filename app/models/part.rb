class Part < ApplicationRecord
  has_many :records, dependent: :destroy
  
  validates :name, presence: true
end
