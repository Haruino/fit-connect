class Public::PostThreadsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post_thread, only: [:show, :destroy]
  
  def create
    @group = Group.find(params[:group_id])
    @post_thread = @group.post_threads.build(post_thread_params)
    @post_thread.user_id = current_user.id
    if @post_thread.save
      flash[:notice] = "スレッドを投稿しました。"
      redirect_to post_thread_path(@post_thread)
    else
      @post_threads = PostThread.page(params[:page])
      flash.now[:error] = "スレッドの投稿に失敗しました。"
      render "public/groups/show"
    end
  end

  def show
    @group = @post_thread.group
    @comment = Comment.new
  end

  def destroy    
    if @post_thread.destroy
      flash[:notice] = "スレッドを削除しました。"
      redirect_to group_path(@post_thread.group)
    else
      flash.now[:error] = "スレッドの削除に失敗しました。"
      render :show
    end
  end

  private
  
  def post_thread_params
    params.require(:post_thread).permit(:title, :body)
  end
  
  def set_post_thread
    @post_thread = PostThread.find(params[:id])
  end
end
