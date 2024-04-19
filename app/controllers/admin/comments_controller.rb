class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @comments = Comment.all
  end
  
  def destroy
    @post_thread = PostThread.find(params[:id])
    @comment = Comment.find(params[:id])
    @post_thread = @comment.post_thread
    if @comment.destroy
      redirect_to admin_post_thread_path(@post_thread)
    else
      render "admin/post_threads/show"
    end
  end
end
