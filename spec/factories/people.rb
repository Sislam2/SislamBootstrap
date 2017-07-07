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

FactoryGirl.define do
  factory :person do
    name "MyString"
    email "MyString"
    address "MyString"
    cep "MyString"
    phone "MyString"
    mobile_phone "MyString"
    city nil
    cpf_cnpj "MyString"
    type ""
    account nil
  end
end
