class LikesController < ApplicationController
  before_action :set_variables

  def create
    @like = Like.create(user_id: current_user.id, post_id: params[:post_id])
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
    like.destroy
  end

  private

  def set_variables
    #投稿
    @post = Post.find_by(params[:post_id])
    #いいね数
    @likes_count = Like.where(post_id: params[:post_id]).count
  end
end
