class LikesController < ApplicationController
  after_action :create_notifications, only: [:create]

  def create
    return if Like.exists?(user_id: current_user.id, post_id: params[:post_id])
    @like = Like.new(user_id: current_user.id, post_id: params[:post_id])
    @post = Post.find_by(id: @like.post_id)
    if @like.save
      respond_to do |format|
        format.js
      end
    else
      render nothing: true, status: 404
    end
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
    @post = Post.find_by(id: @like.post_id)
    if @like.destroy
      notification = Notification.find_by(user_id: @post.user_id, post_id: @post.id, notified_by_id: current_user.id, notified_type: 'like')
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
    Notification.create(user_id: post.user_id, post_id: post.id, notified_by_id: current_user.id, notified_type: 'like')
  end
end
