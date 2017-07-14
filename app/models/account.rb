# == Schema Information
#
# Table name: accounts
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  person_id  :integer
#
# Indexes
#
#  index_accounts_on_person_id  (person_id)
#
# Foreign Keys
#
#  fk_rails_...  (person_id => people.id)
#

class Account < ApplicationRecord
  include Fields
  
  resourcify

  has_many :users, through: :roles
  has_many :people

  belongs_to :person, required: false

  add_field :name
end
