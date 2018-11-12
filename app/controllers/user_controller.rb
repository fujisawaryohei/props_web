class UserController < ApplicationController
  #ユーザー詳細
  def show
    @followings = current_user.followings
    @followers = current_user.followers
  end
  #ユーザー情報編集
  def edit
  end
  #ユーザー情報のupdate
  def update
  end
  #フォローボタンの部分テンプレ
  def follow_form
  end
  #ログインしているユーザーのフォロー数、フォロワー数を確認できる部分テンプレ user/showにrender
  def current_user_stats
  end
end
