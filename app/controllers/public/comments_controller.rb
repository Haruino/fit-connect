class Public::CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @post_thread = PostThread.find(params[:post_thread_id])
    @comment = current_user.comments.build(comment_params)
    @comment.post_thread = @post_thread
    if @comment.save
      redirect_to post_thread_path(@post_thread)
    else
      render "public/post_threads/show"
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @post_thread = @comment.post_thread
    if @comment.destroy
      redirect_to post_thread_path(@post_thread)
    else
      render "public/post_threads/show"
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
