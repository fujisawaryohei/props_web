class PostsController < ApplicationController
  protect_from_forgery :except => [:create]
  before_action :set_query,:increment
  def index
    @user=User.new
    @user.reset_password_token = params[:reset_password_token]
    @posts = Post.all.order(created_at:"DESC")
  end

  def new
    @post = Post.new
  end

  def show
  end

  def create
    @post = Post.new(set_params)
      respond_to do |format|
        if @post.save
          format.html {redirect_to:posts,notice:"投稿しました"}
        elsif params[:title].nil?
          format.html {render:new_post,notice:"タイトルを入力してください"}
        elsif params[:text].nil?
          format.html {render:new_post,notice:"レビューを入力してください"}
        else
          format.html {render:new_post,notice:"曲を選択してください"}
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
    client_id = '08f6b6d35a0e4a8cb0b5710475e2e6f4'
    client_secret = '7d7e993dfaaa4e00b1a518570dd15660'
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
