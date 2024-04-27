class Public::ExercisesController < ApplicationController
  def create
    @exercise = Exercise.new(exercise_params)
    if @exercise.save
      @user = User.find(params[:user_id])
      @user.exercises << @exercise  # ここで@exerciseを@userに関連付ける
      redirect_to user_records_path(current_user)
    else
      flash[:error] = "種目の追加に失敗しました。"
      redirect_to user_records_path(current_user)
    end
  end

  private

  def exercise_params
    params.require(:exercise).permit(:name)
  end
end
