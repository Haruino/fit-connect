class Public::PartsController < ApplicationController
  def create
    @part = Part.new(part_params)
    if @part.save
      redirect_to user_records_path(current_user)
    else
      flash[:error] = "部位の追加に失敗しました。"
      redirect_to user_records_path(current_user)
    end
  end
  
  private

  def part_params
    params.require(:part).permit(:name)
  end
end
