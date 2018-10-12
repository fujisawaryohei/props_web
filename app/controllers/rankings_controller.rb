class RankingsController < ApplicationController
  before_action :post_ranking, :user_ranking

  def post_ranking
  end

  def user_ranking
    #フォロワーの多いユーザ10人のuser_idを順に取得
    user_rank_ids = Relationship.group(:followed).order('count_followed').limit(10).count(:followed)
    #user_rank_idsで並んでいる順にユーザのデータを配列として消す
    @user_ranks = user_rank_ids.map { |id| User.find(id) }
  end
end
