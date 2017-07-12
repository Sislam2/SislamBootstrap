class CreateAttachments < ActiveRecord::Migration[5.1]
  def change
    create_table :attachments do |t|
      t.belongs_to :fileable, polymorphic: true, index: true

      t.attachment :archive
      t.string :archive_fingerprint

      t.string :type, index: true
      t.timestamps
    end
  end
end
