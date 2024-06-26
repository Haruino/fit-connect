# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :prohibit_multiple_login, if: :admin_signed_in?
  before_action :active?, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end


  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to user_path(user)
  end

  def active?
    @user = User.find_by(email: params[:user][:email])
    return unless @user && @user.valid_password?(params[:user][:password]) && !@user.active
    redirect_to new_user_registration_path
  end
  
  protected
  
  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  def prohibit_multiple_login
    redirect_to root_path
  end
end
