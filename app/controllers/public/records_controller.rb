class Public::RecordsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @user = User.find(params[:user_id])
    @record = @user.records.build(record_params)
    if @record.save
      redirect_to user_records_path(@user)
    else
      render :show
    end
  end
  
  def show
    @records = Record.all
    @record = Record.new
    
  end
  
  def update
    
  end
  
  def destroy
    
  end
  
  private
  
  def record_params
    params.require(:record).permit(:part, :exercise, :weight, :rep, :set)
  end
end
