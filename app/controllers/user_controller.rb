class UserController < ApplicationController
  #ユーザー詳細
  def user_show
  end
  #ユーザー情報編集
  def edit
  end
  #ユーザー情報のupdate
  def update
  end
  #フォローボタンの部分テンプレ
  def follow_form
    @current_user=current_user
    @user=User.find_by(id:[:params])
  end
  #ログインしているユーザーのフォロー数、フォロワー数を確認できる部分テンプレ user/showにrender
  def current_user_stats
    @current_user_followings=current_user.followings.count
    @current_user_followers=current_user.followers.count
  end
  #ユーザーのフォローしている人一覧部分テンプレ user/showにrender
  def show_follow
    @followings_users=User.followings
  end
  #ユーザーのフォローされている人一覧部分テンプレ user/showにrender
  def show_follower
    @followers_users=User.followers
  end
end
