class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.columns_types
    @column_types ||= self.columns.inject({}){|cols, col| cols[col.name] = col; cols }
  end
end
