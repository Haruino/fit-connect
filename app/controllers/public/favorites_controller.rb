class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    post_thread = PostThread.find(params[:post_thread_id])
    favorite = current_user.favorites.find_or_initialize_by(post_thread_id: post_thread.id)
    favorite.save
    redirect_to post_thread_path(post_thread)
  end
  
  def destroy
    post_thread = PostThread.find(params[:post_thread_id])
    favorite = current_user.favorites.find_by(post_thread_id: post_thread.id)
    favorite.destroy
    redirect_to post_thread_path(post_thread)
  end
end
