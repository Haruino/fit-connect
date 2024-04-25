class Record < ApplicationRecord
  before_save :create_name
  
  belongs_to :user
  belongs_to :part
  belongs_to :exercise
  
  def create_name
    self.name = Part.find(part_id).name + "   -   " + Exercise.find(exercise_id).name 
  end
end
