class Public::GroupsController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update]

  def index
    @groups = Group.all
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    @group.genre_id = params[:group][:genre_id]
    if @group.save
      @group.members.create(user_id: current_user.id)
      redirect_to groups_path
    else
      @groups = Group.all
      render :index
    end
  end

  def show
    @group = Group.find(params[:id])
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

  def ensure_correct_user
    @group = Group.find(params[:id])
    unless @group.owner_id == current_user.id
      redirect_to groups_path
    end
  end
end
