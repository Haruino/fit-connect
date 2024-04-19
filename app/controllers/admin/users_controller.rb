class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
  
  def withdraw
    withdrew_email = "withdrew_" + Time.now.to_i.to_s + @user.email
    @user.update(email: withdrew_email, active: false)
    reset_session
    redirect_to root_path
  end
end
