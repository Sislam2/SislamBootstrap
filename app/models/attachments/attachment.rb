# == Schema Information
#
# Table name: attachments
#
#  id         :integer          not null, primary key
#  fileable_type       :string
#  fileable_id    :integer
#  archive_file_name       :string
#  archive_content_type       :string
#  archive_file_size       :integer
#  archive_updated_at       :datetime
#  archive_fingerprint       :string
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_attachments_on_fileable_type_and_fileable_id  ("fileable_type", "fileable_id")
#  index_attachments_on_type    (type)
#

module Attachments
  class Attachment < ::ApplicationRecord
    self.table_name = 'attachments'

    belongs_to :fileable, polymorphic: true, autosave: true, required: false
  end
end
