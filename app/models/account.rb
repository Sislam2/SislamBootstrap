class Account < ApplicationRecord
  resourcify

  has_many :users, through: :roles
end
