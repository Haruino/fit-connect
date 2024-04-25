class Public::RecordsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:user_id])
    @record = @user.records.build(record_params)
    @record.set = latest_set_number + 1
    if @record.save
      redirect_to user_records_path(@user)
    else
      render :show
    end
  end

  def show
    @user = User.find(params[:user_id])
    records = @user.records.select(:name, :rep, :set, :weight, :created_at).group_by(&:name)
    @todays_records = records.select { |name, records| records.any? { |record| record.created_at.to_date == Date.today } }
    @record = Record.new
    @part = Part.new
    @exercise = Exercise.new
  end

  def update
  
  end
  
  def destroy
    @user = User.find(params[:user_id])
    @record = @user.records.find_by(id: params[:id])
    @record.destroy
    redirect_to user_records_path(@user), notice: "Record deleted successfully."
  end

  private
  def latest_set_number
    latest_record = Record.last
    latest_record ? latest_record.set : 0
  end

  def record_params
    params.require(:record).permit(:part_id, :exercise_id, :weight, :rep)
  end
end
