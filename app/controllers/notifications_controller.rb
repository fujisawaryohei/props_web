class NotificationsController < ApplicationController
  before_action :set_variables
  layout 'sub_layout'

  def index
  end

  def link_through
    @notification = Notification.find_by(id: params[:id])

    if @notification.notified_type == 'like' || @notification.notified_type == 'clip'
      notifications = Notification.where(user_id: @notification.user_id, post_id: @notification.post_id, notified_type: @notification.notified_type, read: false)
      notifications.each do |notification|
        unless notification.update read: true
          redirect_back(fallback_location: notifications_index_path)
        end
      end
      #後でリダイレクト先を対象の投稿のページに変更(post_path(@notification))
      redirect_to notifications_index_path
    elsif @notification.notified_type == 'comment'
      if @notification.update read: true
        #後でリダイレクト先を対象の投稿のページに変更(post_path(@notification))
        redirect_to notifications_index_path
      else
        redirect_back(fallback_location: notifications_index_path)
      end
    elsif @notification.notified_type == 'follow'
      if @notification.update read: true
        #後でリダイレクト先をフォローされたユーザーの詳細ページに変更
        redirect_to notifications_index_path
      else
        redirect_back(fallback_location: notifications_index_path)
      end
    else
      redirect_back(fallback_location: notifications_index_path)
    end
  end

  private

  def set_variables
    #notified_typeがfollowのときpost_idはnullになってしまうことに注意(followの通知ビュー上でを扱う際にpost_idを使用していない)
    @notifications = current_user.notifications.where(read: false).order('created_at DESC')
  end
end