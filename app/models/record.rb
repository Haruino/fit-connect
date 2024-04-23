class Record < ApplicationRecord
  belongs_to :user
  belongs_to :part
  belongs_to :exercise
end
