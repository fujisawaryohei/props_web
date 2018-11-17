module NotificationsHelper
  def notified_time(datetime)
    time_ago_in_words(datetime) + '前'
  end
end
