module NotificationsHelper
  def nt_time(datetime)
    time_ago_in_words(datetime) + '前'
  end

  def passed_time_min(notification)
    (Time.now - notification.post.created_at.to_time)/60
  end

  def some_notifications?(notification)
    latest_some_nt = Notification.where(user_id: notification.user_id, post_id: notification.post_id, notified_type: notification.notified_type, read: false).order('created_at DESC').first
    if latest_some_nt == notification
      return "true"
    else
      return "false"
    end
  end

  def some_notifications(notification)
    Notification.where(user_id: notification.user_id, post_id: notification.post_id, notified_type: notification.notified_type, read: false).order('created_at DESC')
  end

  def clip_some_notifications(notification)
    Notification.where(user_id: notification.user_id, post_id: notification.post_id, notified_type: 'clip', read: false).order('created_at DESC')
  end
end

