class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_user, only: [:show, :withdraw]

  def index
    if params[:search].present?
      @users = User.where("name LIKE ?", "%#{params[:search]}%").page(params[:page])
      @user_title = "「#{params[:search]}」の検索結果"
    else
      @users = User.page(params[:page])
    end
  end

  def show
    @user = User.find(params[:id])
  end
  
  def withdraw
    withdrew_email = "withdrew_" + Time.now.to_i.to_s + @user.email
    @user.update(email: withdrew_email, active: false)
    flash[:info] = "ユーザーを退会させした。"
    redirect_to admin_users_path
  end
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end
end
