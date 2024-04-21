class Public::RelationshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  
  def create
    if @user != current_user
      current_user.follow(@user)
    end
    redirect_to request.referer
  end

  def destroy  
    if @user != current_user
      current_user.unfollow(@user)
    end
    redirect_to request.referer
  end
  
  def followings
    @users = @user.followings
  end
  
  def followers
    @users = @user.followers
  end
  
  private
  def set_user
    @user = User.find(params[:user_id])
  end
end
