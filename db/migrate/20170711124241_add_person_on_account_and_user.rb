class AddPersonOnAccountAndUser < ActiveRecord::Migration[5.1]
  def change
    change_table :accounts do |t|
      t.belongs_to :person, foreign_key: true
    end
    change_table :users do |t|
      t.belongs_to :person, foreign_key: true
    end
  end
end
