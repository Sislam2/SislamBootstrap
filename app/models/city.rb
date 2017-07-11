class City < ApplicationRecord
  def name_with_state
    "#{name} - #{state}"
  end

  def to_s
    "#{name_with_state} - #{country}"
  end
end
