class Public::PartsController < ApplicationController
  def create
    @part = current_user.parts.build(part_params)
    if @part.save
      redirect_to user_records_path(current_user)
    else
      flash[:error] = "部位の追加に失敗しました。"
      redirect_to user_records_path(current_user)
    end
  end
  
  def destroy
    @part = current_user.parts.find(params[:id])
    @part.destroy
    redirect_to parts_exercises_user_records_path(current_user)
  end
  
  private

  def part_params
    params.require(:part).permit(:name)
  end
end
