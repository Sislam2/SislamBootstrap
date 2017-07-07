class CreateCities < ActiveRecord::Migration[5.1]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :state, index: true
      t.string :country, index: true
      
      t.timestamps
    end
  end
end
