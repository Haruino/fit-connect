class Public::MembersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: [:index, :create, :destroy]

  def index
  end

  def create
    current_user.members.create(group: @group)
    flash[:notice] = "グループに参加しました。"
    redirect_to request.referer
  end

  def destroy
    @user = User.find(params[:id])
    transfer_ownership
    @group.users.delete(@user)
    group_destroy_or_leave
  end
  
  private

  def set_group
    @group = Group.find(params[:group_id])
  end
  
  def transfer_ownership
    if @group.owner_id == @user.id
      new_owner = @group.users.where.not(id: @user.id).first
      @group.update(owner_id: new_owner.id) if new_owner
    end
  end
  
  def group_destroy_or_leave
    if @group.users.empty?
      @group.destroy
      flash[:notice] = "グループが削除されました。"
      redirect_to(groups_path, notice: "グループが削除されました。")
    else
      flash[:notice] = "グループから退会しました。"
      redirect_to(group_path(@group), notice: "グループから退会しました。")
    end
  end
end