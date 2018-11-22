class NotificationsController < ApplicationController
  layout 'sub_layout'

  def index
  end

  private

  def set_variables
    #notified_typeがfollowのときpost_idはnullになってしまうことに注意
    @notifications = current_user.notifications.where(read: false).order('created_at DESC')
  end
end