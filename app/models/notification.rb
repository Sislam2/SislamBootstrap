# == Schema Information
#
# Table name: notifications
#
#  id              :integer          not null, primary key
#  actor_id        :integer
#  status          :integer
#  action          :string
#  message         :text
#  read_at         :datetime
#  recipient_id    :integer
#  notifiable_type :string
#  notifiable_id   :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_notifications_on_actor_id                           (actor_id)
#  index_notifications_on_notifiable_type_and_notifiable_id  (notifiable_type,notifiable_id)
#  index_notifications_on_recipient_id                       (recipient_id)
#  index_notifications_on_status                             (status)
#

class Notification < ApplicationRecord
    belongs_to :recipient, class_name: "User"
    belongs_to :actor, class_name: "User", required: false
    belongs_to :notifiable, polymorphic: true, required: false

    scope :unread, ->{where read_at: nil}
    scope :unread_by_id, ->(id){ where(recipient_id: id).unread }

    enum status: [:request, :allow, :deny]

    after_save :try_notify_user

    def self.speak(recipient_id, message=nil)
      data = { unread: self.unread_by_id(recipient_id).count }
      if message
        data[:message] = message
      else
        data[:items] = self.unread_by_id(recipient_id)
      end
      NotificationChannel.broadcast_to recipient_id, data
    end

    private
      def try_notify_user
        self.class.speak(self.recipient_id, self.message)
      end
end
