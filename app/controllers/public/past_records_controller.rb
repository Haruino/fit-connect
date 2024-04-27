class Public::PastRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  
  def index
    @past_records_by_date = @user.records.where("created_at < ?", Date.today).group_by { |record| record.created_at.to_date }.to_a
    @past_records_by_date = Kaminari.paginate_array(@past_records_by_date).page(params[:page]).per(10)
  end

  def show
    all_records_for_date
  end

  def destroy
    date = Date.parse(params[:date])
    @record = @user.records.where("DATE(created_at) = ?", date).first
    if @record.destroy
      redirect_to user_past_record_path(@user)
    else
      all_records_for_date
      render :show
    end
  end

  private
  
  def set_user
    @user = User.find(params[:user_id])
  end
  
  def all_records_for_date
    @date = params[:date].to_date
    all_records = @user.records.where("DATE(created_at) = ?", @date).select(:id, :name, :rep, :set, :weight, :memo, :created_at)
    @grouped_records_for_date = all_records.group_by(&:name).select { |_, records| records.any? { |record| record.created_at.to_date == @date } }
  end

  def record_params
    params.require(:record).permit(:part_id, :exercise_id, :weight, :rep, :memo)
  end
end
