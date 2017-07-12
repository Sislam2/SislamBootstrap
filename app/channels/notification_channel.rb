class NotificationChannel < ApplicationCable::Channel
  def subscribed
    stream_from "notification:#{uuid}"
    Notification.speak uuid
  end

  def mark_all_read
    Notification.where(recipient_id: uuid).update_all(read_at: Time.current)
  end

  def mark_read
    Notification.find(params[:notification_id]).update(read_at: Time.current)
  end

  # def unsubscribed
  # end
end
