class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :new, :create]
  protect_from_forgery :except => [:create]
  before_action :set_query,:increment

  def index
    @user=User.new
    @user.reset_password_token = params[:reset_password_token]
    @posts = []
    @posts = Post.all.order(created_at:"DESC").limit(5)
    # @post_user = [current_user,current_user.followings]
    #   @post_user.each do |post_user|
    #     @posts = post_user.posts.all.order(created_at:"DESC")
    #   end
  end

  def all_index
    @posts = Post.all.order(created_at:"DESC")
    # @post_user = [current_user,current_user.followings]
    #   @post_user.each do |post_user|
    #     @posts = post_user.posts.all.order(created_at:"DESC")
    #   end
  end

  def new
    @post = Post.new
    posts = Post.all
    post_rank_ids = Like.group(:post_id).order('count_post_id DESC').limit(12).count(:post_id).keys
    @trend_post = post_rank_ids.map { |id| Post.find(id) }
  end

  def show
    @post = Post.find(params[:id])
    @posts = @post.user.posts.all.order(created_at:"DESC").limit(3)
    @comment = Comment.new
    @comments = @post.comments.all
  end

  def create
    @post = Post.new(set_params)
      respond_to do |format|
        if @post.save
          format.html {redirect_to:posts,notice:"投稿しました"}
        else
          flash.now[:alert] = "曲を選択後、タイトル,レビューを入力してください。"
          format.html {redirect_to:new_post}
        end
      end
  end

  def edit
  end

  def update
  end

  def destroy
    @post = Post.find_by(id:params[:id])
    respond_to do |format|
      if @post.destroy
        format.html {redirect_to:posts,notice:"削除しました"}
      end
    end
  end

  def track
    if set_query
      @track_info = search_track(params[:query])
      respond_to do |format|
        format.js
      end
    end
    puts @track_info
  end

  private
  #パラメータがあるかないかでartist_infoテンプレの表示、非表示の制御
  def increment
    @i = 0
  end

  def set_query
    return @params = params[:query]
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def set_params
    params.require(:post).permit(:user_id,:title,:text,:artist_name,:track_name,:track_image)
  end

  def search_track(track_name)
    client_id = 'CLIENT_ID'
    client_secret = 'CLIENT_SECRET'
    RSpotify.authenticate(client_id, client_secret)
      tracks = RSpotify::Track.search(track_name, limit: 12, market: 'JP')
      array = []
      tracks.each do |track|
        track_hash = {}
        track_hash['artist_name'] = check_nil(track.artists.first.name)
        track_hash['track_name'] = check_nil(track.name)
        track_hash['preview_url'] = check_nil(track.preview_url)
        track_hash['track_image'] = check_nil(track.album.images[1]['url'])
        array.push(track_hash)
      end
      #puts array
      return array
  end

  def check_nil(text)
    return text == nil ? '' : text
  end
end
