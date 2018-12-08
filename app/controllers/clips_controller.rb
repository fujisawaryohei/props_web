class ClipsController < ApplicationController
  after_action :create_notifications, only: [:create]

  def create
    return if Clip.exists?(user_id: current_user.id, post_id: params[:post_id])
    @clip = Clip.new(user_id: current_user.id, post_id: params[:post_id])
    @post = Post.find_by(id: @clip.post_id)
    if @clip.save
      respond_to do |format|
        format.js
      end
    else
      render nothing: true, status: 404
    end
  end

  def destroy
    @clip = Clip.find_by(user_id: current_user.id, post_id: params[:post_id])
    @post = Post.find_by(id: @clip.post_id)
    if @clip.destroy
      notification = Notification.find_by(user_id: @post.user_id, post_id: @post.id, notified_by_id: current_user.id, notified_type: "clip")
      if notification
        notification.destroy
      end
      respond_to do |format|
        format.js
      end
    else
      render nothing: true, status: 404
    end
  end

  private

  def create_notifications
    post = Post.find(params[:post_id])

    return if post.user_id == current_user.id
    Notification.create(user_id: post.user_id, post_id: post.id, notified_by_id: current_user.id, notified_type: "clip")
  end
end
