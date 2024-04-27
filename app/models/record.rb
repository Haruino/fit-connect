class Record < ApplicationRecord
  before_save :create_name
  
  belongs_to :user
  belongs_to :part
  belongs_to :exercise
  
  validates :name,   presence: true
  validates :weight, presence: true, numericality: {only_integer: true, less_than_or_equal_to: 999}
  validates :rep,    presence: true, numericality: {only_integer: true, less_than_or_equal_to: 999}
  validates :set,    presence: true, numericality: {only_integer: true, less_than_or_equal_to: 999}
  
  def create_name
    self.name = Part.find(part_id).name + " - " + Exercise.find(exercise_id).name 
  end
end
