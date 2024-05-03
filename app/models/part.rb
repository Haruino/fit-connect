class Part < ApplicationRecord
  belongs_to  :user
  has_many    :records, dependent: :destroy
  
  validates :name, presence: true, length: { maximum: 10 }, uniqueness: { scope: :user_id, case_sensitive: false }
end
