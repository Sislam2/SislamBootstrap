# == Schema Information
#
# Table name: people
#
#  id           :integer          not null, primary key
#  name         :string
#  email        :string
#  address      :string
#  cep          :string
#  phone        :string
#  mobile_phone :string
#  city_id      :integer
#  cpf_cnpj     :string
#  type         :string
#  account_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_people_on_account_id  (account_id)
#  index_people_on_city_id     (city_id)
#  index_people_on_type        (type)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (city_id => cities.id)
#

class Person < ApplicationRecord
  include Fields
  belongs_to :city, required: false
  belongs_to :account, required: false

  has_one :avatar, class_name: 'Attachments::Image', as: :fileable, dependent: :destroy
  accepts_nested_attributes_for :avatar

  validates :name, presence: true

  add_field :email, type: :email
  add_field :name, :address, :cep, :cpf_cnpj
  add_field :phone, :mobile_phone, type: :tel
  add_field :city_id, type: :select2

  add_nested_attributes :avatar
end
