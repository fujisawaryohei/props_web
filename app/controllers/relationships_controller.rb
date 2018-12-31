class RelationshipsController < ApplicationController
  after_action :create_notifications, only: [:create]
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
      notification = Notification.find_by(user_id: @user.id, notified_by_id: current_user.id, notified_type: 'follow')
      if notification
        notification.destroy
      end
      if !current_user.following?(@user)
        respond_to do |format|
          format.js
        end
      else
        render nothing: true,status: 404
      end
  end

  private

  def create_notifications
    @user = User.find_by(id:params[:id])
    Notification.create(user_id: @user.id, post_id: nil, notified_by_id: current_user.id, notified_type: 'follow')
  end
end
