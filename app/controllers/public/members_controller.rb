class Public::MembersController < ApplicationController
  before_action :authenticate_user!
  
  def index
     @group = Group.find(params[:group_id])
  end
  
  def create
    member = current_user.members.new(group_id: params[:group_id])
    member.save
    redirect_to request.referer
  end
  
  def destroy
    member = current_user.members.find_by(group_id: params[:group_id])
    member.destroy
    redirect_to request.referer
  end
end