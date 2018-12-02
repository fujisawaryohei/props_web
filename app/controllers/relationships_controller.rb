class RelationshipsController < ApplicationController
  #ユーザーをフォローする
  before_action :create_following
  def create
    @user=User.find_by(user_params)
    current_user.follow!(@user)
      if current_user.follow?(@user)
        respond_to do |format|
          format.json
        end
      else
         #ステータスコードを制御して何も表示しない.
        render nothing: true,status: 404
      end
  end
  #ユーザーのフォローを解除
  def destroy
    @user=User.find_by(user_params)
    current_user.unfollow!(@user)
      if !current_user.follow?(@user)
        respond_to do |format|
          format.json
        end
      else
        render nothing: true,status: 404
      end
  end

  private #ストロングパラメータ設定
    def user_params
      params.require(:user).permit(:id)
    end
end
