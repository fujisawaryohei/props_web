class RelationshipsController < ApplicationController
  #ユーザーをフォローする
  def create
    @user=User.find_by(id:params[:id])
    current_user.follow!(@user)
      if current_user.following?(@user)
        respond_to do |format|
          format.js
        end
      else
         #ステータスコードを制御して何も表示しない.
        render nothing: true,status: 404
      end
  end
  #ユーザーのフォローを解除
  def destroy
    @user=User.find_by(id:params[:id])
    current_user.unfollow!(@user)
      if !current_user.following?(@user)
        respond_to do |format|
          format.js
        end
      else
        render nothing: true,status: 404
      end
  end
end
