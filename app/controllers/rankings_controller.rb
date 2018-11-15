class RankingsController < ApplicationController
  layout 'sub_layout'
  before_action :post_ranking, :user_ranking

  protected

  def post_ranking

    #いいねの数が多い投稿を順に10個product_idを取得
    post_rank_ids = Like.group(:post_id).order('count_post_id DESC').limit(10).count(:post_id).keys

    #post_rank_idsで並んでいる順に投稿を配列として返す
    @post_ranks = post_rank_ids.map { |id| Post.find(id) }
  end

  def user_ranking
    #フォロワーの多いユーザ10人のuser_idを順に取得
    user_rank_ids = Relationship.group(:followed).order('count_followed').limit(10).count(:followed)
    #user_rank_idsで並んでいる順にユーザのデータを配列として消す
    @user_ranks = user_rank_ids.map { |id| User.find(id) }
  end
end
