class HomesController < ApplicationController
  def top
    @groups = Group.order(created_at: :desc).limit(4)
  end
  
  def search
    case params[:search_model]
    when "group" then
      redirect_to admin_groups_path(search: params[:search])
    when "user" then
      redirect_to admin_users_path(search: params[:search])
    end
  end
end
