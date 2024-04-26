class Public::RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :find_record, only: [:update, :destroy]

  def create
    @record = @user.records.build(record_params)
    @record.set = latest_set_number + 1
    if @record.save
      redirect_to user_records_path(@user)
    else
      render :show
    end
  end
  
  def show
    records = @user.records.select(:id, :name, :rep, :set, :weight, :memo, :created_at).group_by(&:name)
    @todays_records = records.select { |name, records| records.any? { |record| record.created_at.to_date == Date.today } }
    @record = Record.new
    @part = Part.new
    @exercise = Exercise.new
  end

  def update
    if @record.update(record_params)
      redirect_to user_records_path(@user)
    else
      render :show
    end
  end

  def destroy
    if @record.destroy
      redirect_to user_records_path(@user)
    else
      render :show
    end
  end

  private
  
  def set_user
    @user = User.find(params[:user_id])
  end
  
  def find_record
    @record = @user.records.find(params[:id])
  end
  
  def latest_set_number
    latest_record = Record.where(exercise_id: record_params[:exercise_id]).last
    latest_record ? latest_record.set : 0
  end

  def record_params
    params.require(:record).permit(:part_id, :exercise_id, :weight, :rep, :memo)
  end
end
