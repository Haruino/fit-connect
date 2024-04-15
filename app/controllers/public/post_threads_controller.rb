class Public::PostThreadsController < ApplicationController
  before_action :authenticate_user!
  def create
    @post_thread = PostThread.new(post_thread_params)
    @group = Group.find(params[:group_id])
    @post_thread.user_id = current_user.id
    @post_thread.group_id = @group.id
    if @post_thread.save
      redirect_to post_thread_path(@post_thread)
    else
      @post_threads = PostThread.all
      render "public/groups/show"
    end
  end

  def show
    @post_thread = PostThread.find(params[:id])
  end

  def destroy
    @post_thread = PostThread.find(params[:id])
    @post_thread.destroy
    redirect_to group_path(@post_thread.group)
  end

  private
  def post_thread_params
    params.require(:post_thread).permit(:title, :body)
  end
end
