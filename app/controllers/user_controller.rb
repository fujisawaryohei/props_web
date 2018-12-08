class UserController < ApplicationController
  layout 'sub_layout'
  before_action :authenticate_user!, only: [:index, :edit, :update, :destroy, :new, :create]
  before_action :other_user, only: [:show, :following, :follower, :like, :clip]

  def index
    @user = User.find_by(id: current_user)
    @posts = current_user.posts.order('created_at DESC')
  end

  def show
    @posts = @user.posts.order('created_at DESC')
  end

  def edit
    @user = User.find_by(id: current_user)
  end

  def update
    @user = User.find_by(id: current_user)
    if @user.update(user_params)
      redirect_to user_index_path
    else
      render :edit
    end
  end

  def following
    @user_followings = @user.followings
    respond_to do |format|
      format.js
    end
  end

  def follower
    @user_followers = @user.followers
    respond_to do |format|
      format.js
    end
  end

  def like
    user_likes = @user.likes
    @posts = user_likes.map { |like| Post.find_by(id: like.post_id) }
    respond_to do |format|
      format.js
    end
  end

  def clip
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

  def other_user
    @user = User.find_by(id: params[:id])
  end

end
