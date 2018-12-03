class UserController < ApplicationController
  layout 'sub_layout'

  def index
    @user = User.find_by(id: current_user)
    @posts = current_user.posts.order('created_at DESC')
  end

  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts.order('created_at DESC')
  end

  def edit
    @user = User.find_by(id: current_user)
  end

  def update
    @user = User.find_by(id: current_user)
    if @user.update(user_params)
      redirect_to user_index_path, notice: 'ユーザー情報を編集しました'
    else
      render :edit, alert: 'もう一度入力してください'
    end
  end

  def following
    @user = User.find_by(id: params[:id])
    @user_followings = @user.followings
    respond_to do |format|
      format.js
    end
  end

  def follower
    @user = User.find_by(id: params[:id])
    @user_followers = @user.followers
    respond_to do |format|
      format.js
    end
  end

  def like
    @user = User.find_by(id: params[:id])
    user_likes = @user.likes
    @posts = user_likes.map { |like| Post.find_by(id: like.post_id) }
    respond_to do |format|
      format.js
    end
  end

  def clip
    @user = User.find_by(id: params[:id])
    user_clips = @user.clips
    @posts = user_clips.map { |clip| Post.find_by(id: clip.post_id) }
    respond_to do |format|
      format.js
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :self_comment, :image)
  end
end
