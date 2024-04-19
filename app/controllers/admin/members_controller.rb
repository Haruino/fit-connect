class Admin::MembersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_group
  
  def index
  end
  
  def destroy
    @membership = @group.members.find_by(user_id: params[:id])
    if @membership.destroy
      redirect_to admin_group_members_path(@group)
    else
      render :index
    end
  end
  
  private
  
  def set_group
    @group = Group.find(params[:group_id])
  end
end
