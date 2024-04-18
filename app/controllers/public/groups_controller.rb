class Public::GroupsController < ApplicationController
  before_action :ensure_logged_in, only: [:show]
  before_action :set_group, only: [:show, :edit, :update]
  before_action :ensure_correct_user, only: [:edit, :update]

  def index
    if params[:search]
      @groups = Group.where("title LIKE ?", "%#{params[:search]}%")
      @group_title = "「#{params[:search]}」の検索一覧"
    elsif params[:genre_search]
      @groups = Group.where(genre_id: params[:genre_search])
      @group_title = "#{Genre.find(params[:genre_search]).name}一覧"
    else
      @groups = Group.all
      @group_title = "グループ一覧"
    end
    @genres = Genre.all
    @group = Group.new
  end

  def create
    @group = current_user.groups.build(group_params.merge(owner_id: current_user.id, genre_id: params[:group][:genre_id]))
    if @group.save
      @group.members.create(user_id: current_user.id)
      redirect_to groups_path
    else
      @groups = Group.all
      render :index
    end
  end

  def show
    @post_threads = @group.post_threads
    @post_thread = PostThread.new
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to groups_path
    else
      render :edit
    end
  end

  private

  def group_params
    params.require(:group).permit(:title, :body, :group_image, :genre_id)
  end

  def ensure_logged_in
    redirect_to new_user_session_path unless user_signed_in?
  end
  
  def set_group
    @group = Group.find(params[:id])
  end
  
  def ensure_correct_user
    redirect_to groups_path unless @group.owner_id == current_user.id
  end
end
