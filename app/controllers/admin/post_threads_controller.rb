class Admin::PostThreadsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_post_thread, only: [:show, :destroy]
  
  def show
    @group = @post_thread.group
  end

  def destroy
    if @post_thread.destroy
      flash[:success] = "スレッドを削除しました。"
      redirect_to admin_group_path(@post_thread.group)
    else
      flash.now[:danger] = "スレッドの削除に失敗しました。"
      render :show
    end
  end
  
  private
  
  def set_post_thread
    @post_thread = PostThread.find(params[:id])
  end
end
