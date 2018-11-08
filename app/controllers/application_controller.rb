class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :search

  def search
    @q = params[:q]
    @searched_posts = Post.search(title_cont: @q).result
    @searched_users = User.search(name_start: @q).result
  end
end
