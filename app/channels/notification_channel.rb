class NotificationChannel < ApplicationCable::Channel
  def subscribed
    stream_from "notification:#{uuid}"
    Notification.speak uuid
  end

  def mark_all_read
    Notification.where(recipient_id: uuid).update_all(read_at: Time.current)
    Notification.speak uuid
  end

  def unsubscribed
    stop_all_streams
  end
end
