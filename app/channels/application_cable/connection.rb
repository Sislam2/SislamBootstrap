module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :uuid

    def connect
      self.uuid = cookies.signed["user.id"]
    end
  end
end
