class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :cep
      t.string :phone
      t.string :mobile_phone
      t.belongs_to :city, foreign_key: true
      t.string :cpf_cnpj
      t.string :type, index: true
      t.belongs_to :account, foreign_key: true

      t.timestamps
    end
  end
end
