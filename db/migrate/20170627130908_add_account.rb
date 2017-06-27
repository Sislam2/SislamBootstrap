class AddAccount < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
