class Public::PartsController < ApplicationController
  def create
    @part = Part.new(part_params)
    if @part.save
      redirect_to user_records_path(current_user)
    else
      render 'records/show'
    end
  end
  
  private

  def part_params
    params.require(:part).permit(:name)
  end
end
