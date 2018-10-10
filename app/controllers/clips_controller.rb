class ClipsController < ApplicationController
  before_action :set_variables

  def create
    @clip = Clip.create(user_id: current_user.id, post_id: params[:post_id])
  end

  def destroy
    clip = Clip.find_by(user_id: current_user.id, post_id: params[:post_id])
    clip.destroy
  end

  private

  def set_variables
    #投稿
    @post = Post.find_by(params[:post_id])
    #clip数
    @clips_count = Clip.where(post_id: params[:post_id]).count
  end
end
