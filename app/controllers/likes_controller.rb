class LikesController < ApplicationController
  def create
    @like = Like.new(user_id: current_user.id, post_id: params[:post_id])
    if @like.save
      respond_to do |format|
        format.json
      end
    else
      render nothing: true, status: 404
    end
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
    if like.destroy
      respond_to do |format|
        format.json
      end
    else
      render nothing: true, status: 404
    end
  end
end
