class ClipsController < ApplicationController

  def create
    @clip = Clip.new(user_id: current_user.id, post_id: params[:post_id])
    if @clip.save
      respond_to do |format|
        format.json
      end
    else
      render nothing: true, status: 404
    end
  end

  def destroy
    clip = Clip.find_by(user_id: current_user.id, post_id: params[:post_id])
    if clip.destroy
      respond_to do |format|
        format.json
      end
    else
      render nothing: true, status: 404
    end
  end

end
