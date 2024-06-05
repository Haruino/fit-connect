class Admin::MembersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_group
  
  def index
  end
  
  def destroy
    @group = Group.find(params[:group_id])
    @member = @group.members.find_by(id: params[:id])
    if @member.destroy
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
