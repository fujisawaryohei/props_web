class PostsController < ApplicationController
  before_action :set_query
  def index
    @user=User.new
    @user.reset_password_token = params[:reset_password_token]
    @posts = Post.all
  end

  def new

  end

  def show
  end

  def create
    artist_name = params['track']['artist_name']
    track_name = params['track']['track_name']
    track_image = params['track']['track_image']
    preview_url = params['track']['preview_url']
      @post = Post.new(artist_name:artist_name,track_name:track_name,track_image:track_image,preview_url:preview_url)
      if @post
        @post.save
        redirected_to '/posts/new'
      end
  end

  def edit
  end

  def update
  end

  def destroy
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
  def set_query
    return @params = params[:query]
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:artist_name,:track_name,:track_image,:preview_url)
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
