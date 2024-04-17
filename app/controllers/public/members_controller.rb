class Public::MembersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: [:index, :create, :destroy]

  def index
  end
  
  def create
    current_user.members.create(group: @group)
    redirect_to request.referer
  end
  
  def destroy
    member = current_user.members.find_by(group: @group)
    member.destroy
    redirect_to request.referer
  end
  
  private
  
  def set_group
    @group = Group.find(params[:group_id])
  end
end