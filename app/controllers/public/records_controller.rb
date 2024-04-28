class Public::RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :find_record, only: [:update, :destroy]

  def create
    @record = @user.records.build(record_params)
    @record.set = latest_set_number(@record.exercise_id, @record.part_id) + 1
    if @record.save
      flash[:notice] = "トレーニングを記録しました。"
      redirect_to user_records_path(@user)
    else
      flash.now[:error] = "トレーニングの記録に失敗しました。"
      todays_records_select
      render :show
    end
  end
  
  def show
    todays_records_select
    @record = Record.new
  end

  def update
    if @record.update(record_params)
      redirect_to user_records_path(@user)
    else
      todays_records_select
      render :show
    end
  end

  def destroy
    if @record.destroy
      redirect_to user_records_path(@user)
    else
      todays_records_select
      render :show
    end
  end
  
  def parts_exercises
    @user = User.find(params[:user_id])
    @parts = @user.parts
    @exercises = @user.exercises
  end

  private
  
  def set_user
    @user = User.find(params[:user_id])
  end
  
  def find_record
    @record = @user.records.find(params[:id])
  end
  
  def latest_set_number(exercise_id, part_id)
    latest_record = @user.records.where(part_id: part_id, exercise_id: exercise_id).where("DATE(created_at) = ?", Date.today).order(created_at: :desc).first
    latest_record ? latest_record.set : 0
  end
  
  def todays_records_select
    records = @user.records.select(:id, :name, :rep, :set, :weight, :memo, :created_at).group_by(&:name)
    @todays_records = records.select { |name, records| 
      records.any? { |record| record.created_at.to_date == Date.today }
    }.transform_values { |records| records.select { |record| record.created_at.to_date == Date.today } }
  end


  def record_params
    params.require(:record).permit(:part_id, :exercise_id, :weight, :rep, :memo)
  end
end
