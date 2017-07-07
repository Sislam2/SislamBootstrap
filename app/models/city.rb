class City < ApplicationRecord
  def name_with_state
    "#{name} - #{state}"
  end
end
