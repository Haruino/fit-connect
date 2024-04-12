class Genre < ApplicationRecord
  has_many :groups, dependent: :destroy
end
