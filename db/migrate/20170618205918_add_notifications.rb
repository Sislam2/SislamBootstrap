class AddNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.integer :actor_id, index: true
      t.integer :status, index: true
      t.string :action
      t.text :message
      t.datetime  :read_at
      t.integer :recipient_id, index: true
      t.references :notifiable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
