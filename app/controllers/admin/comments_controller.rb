class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @comments = Comment.includes(:post_thread).all
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @post_thread = @comment.post_thread 
    if params[:from_page] == "post_thread_show"
      @comment.destroy
      redirect_to admin_post_thread_path(@post_thread)
    elsif params[:from_page] == "comments_index"
      @comment.destroy
      redirect_to admin_comments_path
    else
      render "admin/post_threads/show"
    end
  end
end
