class ClipsController < ApplicationController

  def create
    @clip = Clip.create(user_id: current_user.id, post_id: params[:post_id])
  end

  def destroy
    clip = Clip.find_by(user_id: current_user.id, post_id: params[:post_id])
    clip.destroy
  end

end
