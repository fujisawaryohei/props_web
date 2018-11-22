module NotificationsHelper
  def nt_time(datetime)
    time_ago_in_words(datetime) + '前'
  end

  def passed_time(notification)
    (Time.now - Post.find(notification.post_id).created_at.to_time)
  end

  def like_some_notification?(notification)
    latest_like_some_nt = Notification.where(user_id: notification.user_id, post_id: notification.post_id, notified_type: 'like', read: false).order('created_at DESC').first
    if latest_like_some_nt == notification
      return "true"
    else
      return "false"
    end
  end

  def like_some_notifications(notification)
    Notification.where(user_id: notification.user_id, post_id: notification.post_id, notified_type: 'like', read: false).order('created_at DESC')
  end

  def clip_some_notification?(notification)
    latest_clip_some_nt = Notification.where(user_id: notification.user_id, post_id: notification.post_id, notified_type: 'clip', read: false).order('created_at DESC').first
    if latest_clip_some_nt == notification
      return "true"
    else
      return "false"
    end
  end

  def clip_some_notifications(notification)
    Notification.where(user_id: notification.user_id, post_id: notification.post_id, notified_type: 'clip', read: false).order('created_at DESC')
  end
end

