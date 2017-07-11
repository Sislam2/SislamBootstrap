# == Schema Information
#
# Table name: cities
#
#  id         :integer          not null, primary key
#  name       :string
#  state      :string
#  country    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_cities_on_country  (country)
#  index_cities_on_state    (state)
#

class City < ApplicationRecord
  def name_with_state
    "#{name} - #{state}"
  end

  def to_s
    "#{name_with_state} - #{country}"
  end
end
