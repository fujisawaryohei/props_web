class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :search
  before_action :sidebar_ranking

  def search
    @q = params[:q]
    @searched_posts = Post.search(title_cont: @q).result
    @searched_users = User.search(name_start: @q).result
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  protected

  def sidebar_ranking
    #いいねの数が多い投稿を順に10個product_idを取得
    post_rank_ids = Like.group(:post_id).order('count_post_id DESC').limit(5).count(:post_id).keys
    #post_rank_idsで並んでいる順に投稿を配列として返す
    @side_post_ranks = post_rank_ids.map { |id| Post.find(id) }
    #フォロワーの多いユーザ10人のuser_idを順に取得
    user_rank_ids = Relationship.group(:following_id).order('count_following_id DESC').limit(5).count(:following_id).keys
    #user_rank_idsで並んでいる順にユーザのデータを配列として消す
    @side_user_ranks = user_rank_ids.map { |id| User.find(id) }
  end
end
