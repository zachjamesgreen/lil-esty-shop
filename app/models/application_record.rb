class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  def formatted_time
    created_at.to_formatted_s(:long)[0..-6].strip
  end
  def convert_dollars
    unit_price.to_f/100
  end
end
