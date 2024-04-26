class Public::PastRecordsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @past_records_by_date = @user.records.where("created_at < ?", Date.today).group_by { |record| record.created_at.to_date }
  end

  def show
    @user = User.find(params[:user_id])
    @date = params[:date].to_date
    all_records = @user.records.where("DATE(created_at) = ?", @date).select(:id, :name, :rep, :set, :weight, :memo, :created_at)
    @grouped_records_for_date = all_records.group_by(&:name).select { |_, records| records.any? { |record| record.created_at.to_date == @date } }
  end

  def update
    @user = User.find(params[:user_id])
    date = Date.parse(params[:date])
    @record = @user.records.where("DATE(created_at) = ?", date).first
    if @record.update(record_params)
      redirect_to user_past_record_path(@user)
    else
      render :show
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    date = Date.parse(params[:date])
    @record = @user.records.where("DATE(created_at) = ?", date).first
    if @record.destroy
      redirect_to user_past_record_path(@user)
    else
      render :show
    end
  end

  private

  def record_params
    params.require(:record).permit(:part_id, :exercise_id, :weight, :rep, :memo)
  end
end
