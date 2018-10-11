class RankingsController < ApplicationController
  before_action :post_ranking, :user_ranking

  def post_ranking
    #いいねの数が多い投稿を順に10個product_idを取得
    post_rank_ids = Like.group(:post_id).order('count_post_id DESC').limit(10).count(:post_id).keys
    #post_rank_idsで並んでいる順に投稿を配列として返す
    @post_ranks = post_rank_ids.map { |id| Post.find(id) }
  end

  def user_ranking
  end
end
