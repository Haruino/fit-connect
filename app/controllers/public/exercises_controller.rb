class Public::ExercisesController < ApplicationController
  def create
    @exercise = Exercise.new(exercise_params)
    if @exercise.save
      redirect_to user_records_path(current_user)
    else
      @record = Record.new
      render 'records/show'
    end
  end

  private

  def exercise_params
    params.require(:exercise).permit(:name)
  end
end
