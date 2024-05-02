class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :favorites, :withdraw]
  before_action :set_current_user, only: [:edit, :update]
  before_action :ensure_correct_user, only: [:edit, :update, :withdraw]
  before_action :ensure_not_guest_user, only: [:edit, :update]

  def index
    if params[:search].present?
      @users = User.where("name LIKE ?", "%#{params[:search]}%").page(params[:page])
      @user_title = "「#{params[:search]}」の検索結果"
    else
      @users = User.page(params[:page]).per(10)
      @user_title = "全ユーザー"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "ユーザー情報を編集しました。"
      redirect_to user_path(@user)
    else
      flash.now[:error] = "ユーザー情報の編集に失敗しました。"
      render "edit"
    end
  end

  def favorites
    @favorites = @user.favorites
  end

  def withdraw
    withdrew_email = "withdrew_" + Time.now.to_i.to_s + @user.email
    @user.update(email: withdrew_email, active: false)
    reset_session
    flash[:notice] = "退会しました。"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction,:profile_image)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_current_user
    @user = current_user
  end

  def ensure_correct_user
    redirect_to user_path(current_user) unless @user == current_user
  end

  def ensure_not_guest_user
    redirect_to new_user_session_path if @user.guest_user?
  end
end
