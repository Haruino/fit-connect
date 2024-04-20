class Admin::GroupsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_group, only: [:show, :destroy]
  
  def index
    if params[:search]
      @groups = Group.where("title LIKE ?", "%#{params[:search]}%")
      @group_title = "「#{params[:search]}」の検索結果"
    elsif params[:genre_search]
      @groups = Group.where(genre_id: params[:genre_search])
      @group_title = "ジャンル：#{Genre.find(params[:genre_search]).name}"
    else
      @groups = Group.all
    end
    @genres = Genre.all
  end
  
  def show
    if params[:thread_search].present?
      @post_threads = PostThread.where("title LIKE ?", "%#{params[:thread_search]}%")
    else
      @post_threads = @group.post_threads
    end
  end
  
  def destroy
    if @group.destroy
      redirect_to admin_groups_path
    else
      render :index
    end
  end
  
  private

  def set_group
    @group = Group.find(params[:id])
  end
end
