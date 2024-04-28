class Public::ExercisesController < ApplicationController
  def create
    @exercise = current_user.exercises.build(exercise_params)
    if @exercise.save
      @user = User.find(params[:user_id])
      @user.exercises << @exercise  # ここで@exerciseを@userに関連付ける
      redirect_to user_records_path(current_user)
    else
      flash[:error] = "種目の追加に失敗しました。"
      redirect_to user_records_path(current_user)
    end
  end

  def destroy
    @exercise = current_user.exercises.find(params[:id])
    @exercise.destroy
    redirect_to parts_exercises_user_records_path(current_user)
  end

  private

  def exercise_params
    params.require(:exercise).permit(:name)
  end
end
