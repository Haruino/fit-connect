class Public::PostThreadsController < ApplicationController
  before_action :authenticate_user!
  def create
    @post_thread = PostThread.new(post_thread_params)
    @group = Group.find(params[:group_id])
    if @post_thread.save
      redirect_to group_path(group_id: @group.id)
    else
      @post_threads = PostThread.all
      render "public/groups/show"
    end
  end

  def show
    @post_thread = PostThread.find(params[:id])
  end

  def edit
  end

  def update

  end

  def destroy

  end

  private
  def post_thread_params
    params.require(:post_thread).permit(:title, :body)
  end
end
